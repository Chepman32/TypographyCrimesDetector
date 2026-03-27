import Foundation
import TypographyDomain

public protocol CrimeDetector: Sendable {
    var crimeType: CrimeType { get }
    func supports(_ evidence: SubmittedEvidence) -> Bool
    func detect(in evidence: SubmittedEvidence) async throws -> [CrimeInstance]
}

public enum AnalysisProgress: Sendable, Equatable {
    case preparing(totalDetectors: Int)
    case detectorFinished(index: Int, total: Int, type: CrimeType)
    case compiling
}

public struct TypographyCrimeEngine: Sendable {
    public init() {}

    public func analyze(
        _ evidence: SubmittedEvidence,
        preferences: UserPreferences,
        progress: @escaping @Sendable (AnalysisProgress) -> Void = { _ in }
    ) async -> CrimeReport {
        if evidence.isWhitespaceOnly {
            return CrimeScorer.buildReport(
                evidence: evidence,
                preferences: preferences,
                instances: [],
                notes: [
                    AnalysisNote(kind: .info, message: "Your text contains only whitespace. While technically not criminal, it is suspicious.")
                ]
            )
        }

        let scriptProfile = TextScriptProfile.classify(evidence.text)
        let detectors = makeDetectors(preferences: preferences, scriptProfile: scriptProfile).filter { detector in
            preferences.isEnabled(detector.crimeType) && detector.supports(evidence)
        }

        progress(.preparing(totalDetectors: detectors.count))
        var allInstances: [CrimeInstance] = []

        await withTaskGroup(of: (CrimeType, [CrimeInstance]).self) { group in
            for detector in detectors {
                group.addTask {
                    let matches = (try? await detector.detect(in: evidence)) ?? []
                    return (detector.crimeType, matches)
                }
            }

            var completed = 0
            while let result = await group.next() {
                completed += 1
                allInstances.append(contentsOf: result.1)
                progress(.detectorFinished(index: completed, total: detectors.count, type: result.0))
            }
        }

        progress(.compiling)

        var notes: [AnalysisNote] = []
        if scriptProfile == .nonLatinDominant {
            notes.append(
                AnalysisNote(
                    kind: .warning,
                    message: "Analysis is optimized for Latin-script text. Some spacing and punctuation rules may not apply to this writing system."
                )
            )
        }

        if evidence.text.count < 10 {
            notes.append(AnalysisNote(kind: .info, message: "Widow and orphan detection is less reliable on very short passages."))
        }

        return CrimeScorer.buildReport(
            evidence: evidence,
            preferences: preferences,
            instances: allInstances,
            notes: notes
        )
    }

    private func makeDetectors(preferences: UserPreferences, scriptProfile: TextScriptProfile) -> [any CrimeDetector] {
        let spacingDetectorsAllowed = scriptProfile != .nonLatinDominant
        return [
            DoubleSpaceDetector(enabled: spacingDetectorsAllowed),
            StraightQuoteDetector(),
            HyphenAsDashDetector(dashStyle: preferences.dashStyle),
            FakeEllipsisDetector(),
            WidowDetector(enabled: spacingDetectorsAllowed),
            OrphanDetector(enabled: spacingDetectorsAllowed),
            InconsistentSpacingDetector(enabled: spacingDetectorsAllowed),
            ComicSansDetector(),
            PrimeMarksDetector(),
            MultiplicationSignDetector(),
            TrademarkSymbolDetector(),
        ]
    }
}

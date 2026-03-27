import Foundation
import TypographyDomain

public enum CrimeScorer {
    public static func buildReport(
        evidence: SubmittedEvidence,
        preferences: UserPreferences,
        instances: [CrimeInstance],
        notes: [AnalysisNote]
    ) -> CrimeReport {
        let grouped = Dictionary(grouping: instances, by: \.crimeType)
            .map { crimeType, matches in
                CrimeSummary(
                    crimeType: crimeType,
                    severity: crimeType.defaultSeverity,
                    count: matches.count,
                    instances: matches.sorted { $0.location.startOffset < $1.location.startOffset }
                )
            }
            .sorted {
                if $0.severity == $1.severity {
                    if $0.count == $1.count {
                        return $0.crimeType.displayName < $1.crimeType.displayName
                    }
                    return $0.count > $1.count
                }
                return severityRank($0.severity) > severityRank($1.severity)
            }

        let baseRawScore = grouped.reduce(0.0) { partial, summary in
            partial + (summary.crimeType.baseWeight * Double(summary.count) * preferences.strictnessMode.multiplier)
        }

        let trifectaBonus = hasTrifecta(grouped) ? 10.0 : 0.0
        let comicSansBonus = hasComicSansAggravator(grouped) ? 10.0 : 0.0
        let rawScore = baseRawScore + trifectaBonus + comicSansBonus
        let normalizedScore = normalized(rawScore)
        let verdict = Verdict.from(score: normalizedScore)

        return CrimeReport(
            analyzedText: evidence.text,
            score: normalizedScore,
            verdict: verdict,
            crimes: instances.sorted { $0.location.startOffset < $1.location.startOffset },
            groupedCrimes: grouped,
            textLength: evidence.text.count,
            strictnessMode: preferences.strictnessMode,
            rawScore: rawScore,
            notes: notes
        )
    }

    static func normalized(_ rawScore: Double, k: Double = 40) -> Int {
        let value = 100 * (1 - Foundation.exp(-rawScore / k))
        return min(100, max(0, Int(value.rounded())))
    }

    private static func hasTrifecta(_ grouped: [CrimeSummary]) -> Bool {
        let types = Set(grouped.map(\.crimeType))
        return types.contains(.straightQuotes) && types.contains(.fakeEllipsis) && types.contains(.hyphenAsDash)
    }

    private static func hasComicSansAggravator(_ grouped: [CrimeSummary]) -> Bool {
        let types = Set(grouped.map(\.crimeType))
        return types.contains(.comicSans) && types.count > 1
    }

    private static func severityRank(_ severity: CrimeSeverity) -> Int {
        switch severity {
        case .infraction: 1
        case .misdemeanor: 2
        case .felony: 3
        }
    }
}

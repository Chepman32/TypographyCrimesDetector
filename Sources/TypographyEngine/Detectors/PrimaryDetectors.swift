import Foundation
import TypographyDomain

struct DoubleSpaceDetector: CrimeDetector {
    let enabled: Bool
    let crimeType: CrimeType = .doubleSpace

    func supports(_ evidence: SubmittedEvidence) -> Bool { enabled && !evidence.text.isEmpty }

    func detect(in evidence: SubmittedEvidence) async throws -> [CrimeInstance] {
        let regex = try NSRegularExpression(pattern: #"(?<=[.!?]) {2,}(?=\p{L})"#, options: [])
        let matches = regex.matches(in: evidence.text, range: NSRange(location: 0, length: (evidence.text as NSString).length))
        return matches.map {
            TextAnalysisSupport.makeInstance(
                type: .doubleSpace,
                range: $0.range,
                in: evidence.text,
                suggestedFix: L10n.text("engine.fix.single_space"),
                explanation: L10n.text("engine.explain.double_space")
            )
        }
    }
}

struct StraightQuoteDetector: CrimeDetector {
    let crimeType: CrimeType = .straightQuotes

    func supports(_ evidence: SubmittedEvidence) -> Bool { !evidence.text.isEmpty }

    func detect(in evidence: SubmittedEvidence) async throws -> [CrimeInstance] {
        let regex = try NSRegularExpression(pattern: #"["']"#)
        let nsText = evidence.text as NSString
        return regex.matches(in: evidence.text, range: NSRange(location: 0, length: nsText.length)).compactMap { match in
            let quote = nsText.substring(with: match.range)
            let previousLocation = match.range.location > 0 ? match.range.location - 1 : 0
            let lineRange = nsText.lineRange(for: NSRange(location: previousLocation, length: 0))
            let lineText = nsText.substring(with: lineRange)
            if TextAnalysisSupport.isLikelyCodeLine(lineText) { return nil }

            if match.range.location > 0 {
                let previous = nsText.substring(with: NSRange(location: match.range.location - 1, length: 1))
                if previous.rangeOfCharacter(from: .decimalDigits) != nil { return nil }
            }

            let replacement = TextAnalysisSupport.smartQuoteReplacement(in: evidence.text, matchRange: match.range, quote: quote)
            return TextAnalysisSupport.makeInstance(
                type: .straightQuotes,
                range: match.range,
                in: evidence.text,
                suggestedFix: L10n.format("engine.fix.replace_with", replacement),
                explanation: L10n.text("engine.explain.straight_quotes")
            )
        }
    }
}

struct HyphenAsDashDetector: CrimeDetector {
    let dashStyle: DashStylePreference
    let crimeType: CrimeType = .hyphenAsDash

    func supports(_ evidence: SubmittedEvidence) -> Bool { !evidence.text.isEmpty }

    func detect(in evidence: SubmittedEvidence) async throws -> [CrimeInstance] {
        let regex = try NSRegularExpression(pattern: #"(?<=\S)\s--?\s(?=\S)"#)
        let nsText = evidence.text as NSString
        return regex.matches(in: evidence.text, range: NSRange(location: 0, length: nsText.length)).compactMap { match in
            let token = nsText.substring(with: match.range)
            guard let dashRange = token.range(of: "-") else { return nil }
            let localStart = token.distance(from: token.startIndex, to: dashRange.lowerBound)
            let dashLength = token.hasPrefix(" --") || token.contains("--") ? 2 : 1
            let highlight = NSRange(location: match.range.location + localStart, length: dashLength)
            return TextAnalysisSupport.makeInstance(
                type: .hyphenAsDash,
                range: highlight,
                in: evidence.text,
                suggestedFix: L10n.format("engine.fix.replace_with", dashStyle.replacement),
                explanation: L10n.text("engine.explain.hyphen_dash")
            )
        }
    }
}

struct FakeEllipsisDetector: CrimeDetector {
    let crimeType: CrimeType = .fakeEllipsis

    func supports(_ evidence: SubmittedEvidence) -> Bool { !evidence.text.isEmpty }

    func detect(in evidence: SubmittedEvidence) async throws -> [CrimeInstance] {
        let regex = try NSRegularExpression(pattern: #"\.{3,}"#)
        let matches = regex.matches(in: evidence.text, range: NSRange(location: 0, length: (evidence.text as NSString).length))
        return matches.map {
            TextAnalysisSupport.makeInstance(
                type: .fakeEllipsis,
                range: $0.range,
                in: evidence.text,
                suggestedFix: L10n.format("engine.fix.replace_with", "…"),
                explanation: L10n.text("engine.explain.fake_ellipsis")
            )
        }
    }
}

struct InconsistentSpacingDetector: CrimeDetector {
    let enabled: Bool
    let crimeType: CrimeType = .inconsistentSpacing

    func supports(_ evidence: SubmittedEvidence) -> Bool { enabled && !evidence.text.isEmpty }

    func detect(in evidence: SubmittedEvidence) async throws -> [CrimeInstance] {
        let regex = try NSRegularExpression(pattern: #"([.!?])( {1,})(?=\p{L})"#)
        let nsText = evidence.text as NSString
        let matches = regex.matches(in: evidence.text, range: NSRange(location: 0, length: nsText.length))

        let singles = matches.filter { nsText.substring(with: $0.range(at: 2)).count == 1 }
        let multiples = matches.filter { nsText.substring(with: $0.range(at: 2)).count > 1 }

        guard !singles.isEmpty, !multiples.isEmpty else { return [] }
        let dominantRatio = Double(max(singles.count, multiples.count)) / Double(matches.count)
        guard dominantRatio <= 0.9 else { return [] }

        let minority = singles.count < multiples.count ? singles : multiples
        return minority.map {
            let spacingRange = $0.range(at: 2)
            return TextAnalysisSupport.makeInstance(
                type: .inconsistentSpacing,
                range: spacingRange,
                in: evidence.text,
                suggestedFix: L10n.text("engine.fix.normalize_spacing"),
                explanation: L10n.text("engine.explain.inconsistent_spacing")
            )
        }
    }
}

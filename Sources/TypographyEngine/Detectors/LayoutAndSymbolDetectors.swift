import Foundation
import TypographyDomain

struct WidowDetector: CrimeDetector {
    let enabled: Bool
    let crimeType: CrimeType = .widow

    func supports(_ evidence: SubmittedEvidence) -> Bool { enabled && evidence.text.count >= 10 }
    func detect(in evidence: SubmittedEvidence) async throws -> [CrimeInstance] { WidowOrphanAnalyzer.detectWidows(in: evidence.text) }
}

struct OrphanDetector: CrimeDetector {
    let enabled: Bool
    let crimeType: CrimeType = .orphan

    func supports(_ evidence: SubmittedEvidence) -> Bool { enabled && evidence.text.count >= 10 }
    func detect(in evidence: SubmittedEvidence) async throws -> [CrimeInstance] { WidowOrphanAnalyzer.detectOrphans(in: evidence.text) }
}

struct ComicSansDetector: CrimeDetector {
    let crimeType: CrimeType = .comicSans

    func supports(_ evidence: SubmittedEvidence) -> Bool { !evidence.fontRuns.isEmpty }

    func detect(in evidence: SubmittedEvidence) async throws -> [CrimeInstance] {
        guard evidence.fontRuns.contains(where: { $0.fontName.localizedCaseInsensitiveContains("comic") && $0.fontName.localizedCaseInsensitiveContains("sans") }) else {
            return []
        }

        let range = NSRange(location: 0, length: min(2, (evidence.text as NSString).length))
        return [
            TextAnalysisSupport.makeInstance(
                type: .comicSans,
                range: range,
                in: evidence.text,
                suggestedFix: "Use literally any other font.",
                explanation: "Comic Sans metadata was found in the submitted rich text."
            )
        ]
    }
}

struct PrimeMarksDetector: CrimeDetector {
    let crimeType: CrimeType = .primeMarks

    func supports(_ evidence: SubmittedEvidence) -> Bool { !evidence.text.isEmpty }

    func detect(in evidence: SubmittedEvidence) async throws -> [CrimeInstance] {
        let regex = try NSRegularExpression(pattern: #"(?<=\d)['"]"#)
        let nsText = evidence.text as NSString
        return regex.matches(in: evidence.text, range: NSRange(location: 0, length: nsText.length)).map { match in
            let quote = nsText.substring(with: match.range)
            let replacement = TextAnalysisSupport.primeReplacement(for: quote)
            return TextAnalysisSupport.makeInstance(
                type: .primeMarks,
                range: match.range,
                in: evidence.text,
                suggestedFix: "Replace with \(replacement)",
                explanation: "This measurement mark uses an ASCII quote instead of a proper prime symbol."
            )
        }
    }
}

struct MultiplicationSignDetector: CrimeDetector {
    let crimeType: CrimeType = .multiplicationSign

    func supports(_ evidence: SubmittedEvidence) -> Bool { !evidence.text.isEmpty }

    func detect(in evidence: SubmittedEvidence) async throws -> [CrimeInstance] {
        let regex = try NSRegularExpression(pattern: #"\d\s*x\s*\d"#, options: [.caseInsensitive])
        let nsText = evidence.text as NSString
        return regex.matches(in: evidence.text, range: NSRange(location: 0, length: nsText.length)).compactMap { match in
            let token = nsText.substring(with: match.range)
            guard let xRange = token.range(of: "x", options: .caseInsensitive) else { return nil }
            let localStart = token.distance(from: token.startIndex, to: xRange.lowerBound)
            let highlight = NSRange(location: match.range.location + localStart, length: 1)
            return TextAnalysisSupport.makeInstance(
                type: .multiplicationSign,
                range: highlight,
                in: evidence.text,
                suggestedFix: "Replace with ×",
                explanation: "This dimension uses the letter x where the multiplication sign should appear."
            )
        }
    }
}

struct TrademarkSymbolDetector: CrimeDetector {
    let crimeType: CrimeType = .trademarkSymbol

    func supports(_ evidence: SubmittedEvidence) -> Bool { !evidence.text.isEmpty }

    func detect(in evidence: SubmittedEvidence) async throws -> [CrimeInstance] {
        let regex = try NSRegularExpression(pattern: #"\((?:c|r|tm)\)"#, options: [.caseInsensitive])
        let nsText = evidence.text as NSString
        return regex.matches(in: evidence.text, range: NSRange(location: 0, length: nsText.length)).map { match in
            let token = nsText.substring(with: match.range).lowercased()
            let replacement: String
            switch token {
            case "(c)": replacement = "©"
            case "(r)": replacement = "®"
            default: replacement = "™"
            }
            return TextAnalysisSupport.makeInstance(
                type: .trademarkSymbol,
                range: match.range,
                in: evidence.text,
                suggestedFix: "Replace with \(replacement)",
                explanation: "This fallback notation should be replaced by the proper symbol."
            )
        }
    }
}

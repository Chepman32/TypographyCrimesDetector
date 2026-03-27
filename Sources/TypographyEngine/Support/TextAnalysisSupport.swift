import Foundation
import TypographyDomain

enum TextScriptProfile: Sendable {
    case latinDominant
    case mixed
    case nonLatinDominant

    static func classify(_ text: String) -> TextScriptProfile {
        var latin = 0
        var nonLatin = 0

        for scalar in text.unicodeScalars where CharacterSet.letters.contains(scalar) {
            if isLatin(scalar) {
                latin += 1
            } else {
                nonLatin += 1
            }
        }

        let total = latin + nonLatin
        guard total > 0 else { return .latinDominant }
        let latinRatio = Double(latin) / Double(total)

        if latinRatio >= 0.75 { return .latinDominant }
        if latinRatio <= 0.25 { return .nonLatinDominant }
        return .mixed
    }

    private static func isLatin(_ scalar: Unicode.Scalar) -> Bool {
        switch scalar.value {
        case 0x0041 ... 0x007A,
             0x00C0 ... 0x00FF,
             0x0100 ... 0x024F,
             0x1E00 ... 0x1EFF:
            return true
        default:
            return false
        }
    }
}

enum TextAnalysisSupport {
    static func location(for range: NSRange, in text: String) -> CrimeLocation {
        let safeOffset = max(0, min(range.location, (text as NSString).length))
        let prefix = (text as NSString).substring(to: safeOffset)
        let lines = prefix.components(separatedBy: .newlines)
        let line = max(lines.count, 1)
        let column = (lines.last?.count ?? 0) + 1
        return CrimeLocation(
            startOffset: range.location,
            endOffset: range.location + range.length,
            line: line,
            column: column
        )
    }

    static func snippet(around range: NSRange, in text: String, radius: Int = 28) -> String {
        let nsText = text as NSString
        let lower = max(0, range.location - radius)
        let upper = min(nsText.length, range.location + range.length + radius)
        return nsText.substring(with: NSRange(location: lower, length: upper - lower))
            .replacingOccurrences(of: "\n", with: "↩")
    }

    static func evidenceSnippet(for range: NSRange, in text: String) -> String {
        let nsText = text as NSString
        let safe = normalized(range, maxLength: nsText.length)
        guard safe.length > 0 else { return "" }
        return nsText.substring(with: safe)
            .replacingOccurrences(of: "\n", with: "↩")
    }

    static func normalized(_ range: NSRange, maxLength: Int) -> NSRange {
        let location = max(0, min(range.location, maxLength))
        let upperBound = max(location, min(range.location + range.length, maxLength))
        return NSRange(location: location, length: upperBound - location)
    }

    static func isLikelyCodeLine(_ line: String) -> Bool {
        let trimmed = line.trimmingCharacters(in: .whitespaces)
        let markers = ["func ", "let ", "var ", "if ", "guard ", "return ", "import ", "{", "}", "=>", "</", "<div", "class ", "const "]
        return markers.contains { trimmed.contains($0) }
    }

    static func smartQuoteReplacement(in text: String, matchRange: NSRange, quote: String) -> String {
        let nsText = text as NSString
        let previousCharacter = matchRange.location > 0 ? nsText.substring(with: NSRange(location: matchRange.location - 1, length: 1)) : ""
        let nextLocation = matchRange.location + matchRange.length
        let nextCharacter = nextLocation < nsText.length ? nsText.substring(with: NSRange(location: nextLocation, length: 1)) : ""
        let previousIsWord = previousCharacter.rangeOfCharacter(from: .alphanumerics) != nil
        let nextIsWord = nextCharacter.rangeOfCharacter(from: .alphanumerics) != nil

        switch quote {
        case "\"":
            return previousIsWord ? "”" : "“"
        case "'":
            if previousIsWord, nextIsWord { return "’" }
            return previousIsWord ? "’" : "‘"
        default:
            return quote
        }
    }

    static func primeReplacement(for quote: String) -> String {
        quote == "\"" ? "″" : "′"
    }

    static func makeInstance(
        type: CrimeType,
        range: NSRange,
        in text: String,
        suggestedFix: String,
        explanation: String
    ) -> CrimeInstance {
        CrimeInstance(
            crimeType: type,
            severity: type.defaultSeverity,
            location: location(for: range, in: text),
            contextSnippet: snippet(around: range, in: text),
            evidenceSnippet: evidenceSnippet(for: range, in: text),
            suggestedFix: suggestedFix,
            explanation: explanation
        )
    }
}

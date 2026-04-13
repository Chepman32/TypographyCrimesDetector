import CoreText
import Foundation
import TypographyDomain

#if canImport(UIKit)
import UIKit
private typealias PlatformFont = UIFont
#elseif canImport(AppKit)
import AppKit
private typealias PlatformFont = NSFont
#endif

struct WrappedLine: Sendable {
    let text: String
    let range: NSRange
}

enum WidowOrphanAnalyzer {
    static func detectWidows(in text: String) -> [CrimeInstance] {
        let paragraphs = paragraphRanges(in: text)
        return paragraphs.compactMap { paragraphRange in
            let paragraphText = (text as NSString).substring(with: paragraphRange)
            let lines = wrappedLines(for: paragraphText, globalOffset: paragraphRange.location)
            guard let last = lines.last else { return nil }
            let trimmed = last.text.trimmingCharacters(in: .whitespacesAndNewlines)
            let words = trimmed.split(whereSeparator: \.isWhitespace)
            guard words.count == 1, trimmed.count < 15 else { return nil }
            return TextAnalysisSupport.makeInstance(
                type: .widow,
                range: last.range,
                in: text,
                suggestedFix: L10n.text("engine.fix.rewrite_widow"),
                explanation: L10n.text("engine.explain.widow")
            )
        }
    }

    static func detectOrphans(in text: String) -> [CrimeInstance] {
        let paragraphs = paragraphRanges(in: text)
        guard paragraphs.count > 1 else { return [] }

        var results: [CrimeInstance] = []
        for index in paragraphs.indices.dropFirst() {
            let previous = (text as NSString).substring(with: paragraphs[index - 1])
            let currentRange = paragraphs[index]
            let current = (text as NSString).substring(with: currentRange)
            let lines = wrappedLines(for: current, globalOffset: currentRange.location)
            guard let first = lines.first else { continue }
            let trimmed = first.text.trimmingCharacters(in: .whitespacesAndNewlines)
            if previous.count > 200, trimmed.count < 8 {
                results.append(
                    TextAnalysisSupport.makeInstance(
                        type: .orphan,
                        range: first.range,
                        in: text,
                        suggestedFix: L10n.text("engine.fix.rewrite_orphan"),
                        explanation: L10n.text("engine.explain.orphan")
                    )
                )
            }
        }
        return results
    }

    private static func paragraphRanges(in text: String) -> [NSRange] {
        let nsText = text as NSString
        let wholeRange = NSRange(location: 0, length: nsText.length)
        var ranges: [NSRange] = []

        nsText.enumerateSubstrings(in: wholeRange, options: [.byParagraphs, .substringNotRequired]) { _, substringRange, _, _ in
            ranges.append(substringRange)
        }
        return ranges
    }

    private static func wrappedLines(for paragraph: String, globalOffset: Int, width: Double = 320) -> [WrappedLine] {
        guard !paragraph.isEmpty else { return [] }
        let attributed = NSAttributedString(
            string: paragraph,
            attributes: [.font: platformFont]
        )
        let typesetter = CTTypesetterCreateWithAttributedString(attributed as CFAttributedString)
        let nsParagraph = paragraph as NSString
        var index = 0
        var results: [WrappedLine] = []

        while index < nsParagraph.length {
            let count = CTTypesetterSuggestLineBreak(typesetter, index, width)
            guard count > 0 else { break }
            let range = NSRange(location: index, length: count)
            let text = nsParagraph.substring(with: range)
            results.append(
                WrappedLine(
                    text: text,
                    range: NSRange(location: globalOffset + range.location, length: range.length)
                )
            )
            index += count
        }
        return results
    }

    private static var platformFont: PlatformFont {
        #if canImport(UIKit)
        .monospacedSystemFont(ofSize: 15, weight: .regular)
        #else
        .monospacedSystemFont(ofSize: 15, weight: .regular)
        #endif
    }
}

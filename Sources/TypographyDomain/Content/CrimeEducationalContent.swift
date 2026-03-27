import Foundation

public struct CrimeEducationalArticle: Identifiable, Codable, Hashable, Sendable {
    public var id: CrimeType { crimeType }
    public var crimeType: CrimeType
    public var title: String
    public var overview: String
    public var whyItMatters: String
    public var history: String?
    public var wrongExample: String
    public var rightExample: String
    public var fixSteps: [String]

    public init(
        crimeType: CrimeType,
        title: String,
        overview: String,
        whyItMatters: String,
        history: String? = nil,
        wrongExample: String,
        rightExample: String,
        fixSteps: [String]
    ) {
        self.crimeType = crimeType
        self.title = title
        self.overview = overview
        self.whyItMatters = whyItMatters
        self.history = history
        self.wrongExample = wrongExample
        self.rightExample = rightExample
        self.fixSteps = fixSteps
    }
}

public enum CrimeEducationalContent {
    public static let all: [CrimeEducationalArticle] = [
        CrimeEducationalArticle(
            crimeType: .straightQuotes,
            title: "Straight Quotes",
            overview: "Straight quotes are relics of ASCII-era keyboards. In polished editorial text, they should become directional curly marks so opening and closing punctuation visually differ.",
            whyItMatters: "Curly quotes improve rhythm, readability, and typographic credibility. They signal that a text was carefully set rather than dumped straight from a plain-text source.",
            history: "Straight quotes survived because early character sets were small and typewriters used a single mark for both opening and closing quotes.",
            wrongExample: "\"Hello\" and 'goodbye'",
            rightExample: "“Hello” and ‘goodbye’",
            fixSteps: [
                "Enable Smart Punctuation on iOS so the keyboard automatically inserts directional quotes.",
                "When pasting text from plain sources, run a typography-aware cleanup pass before publishing.",
                "Check measurement contexts like 5′11″ separately so prime marks are not converted into apostrophes."
            ]
        ),
        CrimeEducationalArticle(
            crimeType: .fakeEllipsis,
            title: "Fake Ellipsis",
            overview: "Three periods in a row mimic an ellipsis, but they are not the same character. A true ellipsis is a single glyph with balanced spacing.",
            whyItMatters: "The ellipsis glyph maintains even rhythm inside a line of text. Three periods create awkward gaps and often wrap badly at line endings.",
            history: "Professional composition systems have supported the ellipsis character for decades, but many casual text workflows still default to typing three periods.",
            wrongExample: "Wait...",
            rightExample: "Wait…",
            fixSteps: [
                "Replace runs of three periods with the ellipsis character.",
                "Use text replacement if you frequently type ellipses on mobile.",
                "Audit pasted copy because imported marketing text often hides this error."
            ]
        ),
        CrimeEducationalArticle(
            crimeType: .hyphenAsDash,
            title: "Hyphen Abuse",
            overview: "Hyphens join compound words. They are not substitutes for em-dashes or en-dashes, and double hyphens are usually a plain-text workaround that should not survive into finished copy.",
            whyItMatters: "Dashes control sentence rhythm and meaning. Using the correct glyph prevents awkward spacing and preserves the intended editorial voice.",
            history: "Double hyphens were common in environments that lacked rich typography. Modern software no longer has that limitation.",
            wrongExample: "He paused -- dramatically.",
            rightExample: "He paused — dramatically.",
            fixSteps: [
                "On iOS, long-press the hyphen key to access en-dash and em-dash variants.",
                "Keep hyphens for compounds like well-made, not for parenthetical sentence breaks.",
                "Use one dash style consistently throughout the document."
            ]
        ),
        CrimeEducationalArticle(
            crimeType: .doubleSpace,
            title: "Double Spaces",
            overview: "Double spaces after sentence-ending punctuation are a holdover from monospaced typewriter conventions. Proportional type does not need them.",
            whyItMatters: "Extra spacing creates visible holes in paragraphs and makes justification and line wrapping less even.",
            history: "Typewriters used monospaced glyphs, so an extra space made sentence boundaries clearer. Digital typography solved that long ago.",
            wrongExample: "The case is closed.  Move on.",
            rightExample: "The case is closed. Move on.",
            fixSteps: [
                "Search for two spaces after periods, exclamation marks, and question marks.",
                "Use a find-and-replace pass before publishing.",
                "If you prefer old typewriter spacing, disable this rule in Settings rather than ignoring the report."
            ]
        ),
        CrimeEducationalArticle(
            crimeType: .widow,
            title: "Widows",
            overview: "A widow is a final line that contains only one short word. It looks stranded and weakens the shape of a paragraph.",
            whyItMatters: "Typography is visual rhythm. Widows create a ragged ending that draws attention for the wrong reason, especially in display copy or narrow columns.",
            history: "Print designers have long adjusted tracking, copy, or breaks to avoid widows in books, magazines, and posters.",
            wrongExample: "Typography is a matter of rhythm and\ncare.",
            rightExample: "Typography is a matter of rhythm\nand care.",
            fixSteps: [
                "Rewrite the sentence slightly or shorten the line above.",
                "Adjust line length when layout control is available.",
                "Treat this as a soft recommendation, especially in plain-text environments."
            ]
        ),
        CrimeEducationalArticle(
            crimeType: .orphan,
            title: "Orphans",
            overview: "An orphan is a tiny line that breaks awkwardly at the start of a new paragraph or text block. It usually signals that the preceding copy needs a small rewrite.",
            whyItMatters: "Orphans interrupt reading flow and make layouts feel accidental instead of composed.",
            history: "In editorial design, orphans are handled with copy-fitting and layout adjustments before print approval.",
            wrongExample: "A long paragraph ends and the next block begins with\na.",
            rightExample: "A long paragraph ends and the next block begins with a fuller line.",
            fixSteps: [
                "Rewrite one or two nearby words to rebalance the line break.",
                "If layout tools are available, widen the measure slightly.",
                "Treat this as a heuristic warning rather than a hard error."
            ]
        ),
        CrimeEducationalArticle(
            crimeType: .inconsistentSpacing,
            title: "Inconsistent Spacing",
            overview: "A document that mixes single and double sentence spacing feels stitched together from different sources. The inconsistency is often more distracting than either choice on its own.",
            whyItMatters: "Consistency supports trust. When sentence spacing changes midstream, readers notice the workflow instead of the writing.",
            history: nil,
            wrongExample: "First sentence. Second sentence.  Third sentence.",
            rightExample: "First sentence. Second sentence. Third sentence.",
            fixSteps: [
                "Pick one sentence-spacing style for the whole document.",
                "Normalize pasted text before publishing or sharing it.",
                "If you intentionally use double spaces, disable the detector and keep the choice consistent."
            ]
        ),
        CrimeEducationalArticle(
            crimeType: .comicSans,
            title: "Comic Sans",
            overview: "Comic Sans is not illegal, but it is culturally loaded enough to trigger an instant reaction in design-sensitive contexts. This app treats it as a dramatic felony for entertainment and clarity.",
            whyItMatters: "Fonts carry tone. Comic Sans projects a playful voice that often clashes with business, editorial, or product interfaces.",
            history: "Comic Sans was designed in 1994 for a children’s software interface. Its misuse came later, after the font escaped into every context imaginable.",
            wrongExample: "Comic Sans everywhere",
            rightExample: "Use a font suited to the document’s tone.",
            fixSteps: [
                "Swap it for a typeface aligned with the document’s purpose.",
                "Reserve casual display faces for clearly playful contexts.",
                "If the font is intentional, disable Comic Sans detection in Settings."
            ]
        ),
        CrimeEducationalArticle(
            crimeType: .primeMarks,
            title: "Prime Marks",
            overview: "Feet, inches, minutes, and seconds often require prime marks, not apostrophes or quotation marks. The shapes are similar, but the meaning is not.",
            whyItMatters: "Using the correct symbol distinguishes typography from improvised ASCII notation and avoids ambiguity in measurements.",
            history: nil,
            wrongExample: "5'11\"",
            rightExample: "5′11″",
            fixSteps: [
                "Use prime and double-prime symbols for measurements after numerals.",
                "Avoid automatic smart-quote conversion in measurement strings.",
                "Check technical specs, menus, and product dimensions carefully."
            ]
        ),
        CrimeEducationalArticle(
            crimeType: .multiplicationSign,
            title: "Multiplication Sign Abuse",
            overview: "The lowercase x is a letter. The multiplication sign is a symbol. In sizes and dimensions, using × gives text the correct typographic color.",
            whyItMatters: "Technical copy and product dimensions look cleaner and more intentional when the multiplication sign is used correctly.",
            history: nil,
            wrongExample: "1920x1080",
            rightExample: "1920×1080",
            fixSteps: [
                "Replace x between numbers with the multiplication sign.",
                "Use text replacement for common dimension formats.",
                "Review specification sheets and marketing assets for consistency."
            ]
        ),
        CrimeEducationalArticle(
            crimeType: .trademarkSymbol,
            title: "Trademark Symbol Misuse",
            overview: "Parenthetical substitutes such as (c), (r), and (tm) are fallback notation. Published text should use the proper copyright, registered, and trademark symbols.",
            whyItMatters: "The correct symbols look polished, save space, and signal that the text was prepared in a modern environment.",
            history: nil,
            wrongExample: "(c) 2026 Brand Name (tm)",
            rightExample: "© 2026 Brand Name ™",
            fixSteps: [
                "Replace fallback notation with ©, ®, and ™.",
                "Audit legal and product-marketing copy before release.",
                "Keep the symbols spaced consistently with the surrounding text."
            ]
        ),
    ]

    public static let byType = Dictionary(uniqueKeysWithValues: all.map { ($0.crimeType, $0) })
}

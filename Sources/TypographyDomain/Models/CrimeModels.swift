import Foundation

public enum CrimeCategory: String, Codable, CaseIterable, Hashable, Sendable {
    case punctuation
    case spacing
    case layout
    case font
    case symbol

    public var title: String {
        switch self {
        case .punctuation: "Punctuation Crimes"
        case .spacing: "Spacing Crimes"
        case .layout: "Layout Crimes"
        case .font: "Font Crimes"
        case .symbol: "Symbol Crimes"
        }
    }
}

public enum CrimeSeverity: String, Codable, CaseIterable, Hashable, Sendable {
    case infraction
    case misdemeanor
    case felony

    public var label: String {
        rawValue.uppercased()
    }
}

public enum Verdict: String, Codable, CaseIterable, Hashable, Sendable {
    case clean
    case infraction
    case misdemeanor
    case felony
    case capitalOffense

    public var label: String {
        switch self {
        case .clean: "CLEAN"
        case .infraction: "INFRACTION"
        case .misdemeanor: "MISDEMEANOR"
        case .felony: "FELONY"
        case .capitalOffense: "CAPITAL OFFENSE"
        }
    }

    public var iconName: String {
        switch self {
        case .clean: "checkmark.circle.fill"
        case .infraction: "exclamationmark.triangle.fill"
        case .misdemeanor: "handcuffs.fill"
        case .felony: "lights.beacon.max.fill"
        case .capitalOffense: "exclamationmark.octagon.fill"
        }
    }

    public static func from(score: Int) -> Verdict {
        switch score {
        case 0: .clean
        case 1 ... 25: .infraction
        case 26 ... 50: .misdemeanor
        case 51 ... 80: .felony
        default: .capitalOffense
        }
    }
}

public enum StrictnessMode: String, Codable, CaseIterable, Hashable, Sendable {
    case lenient
    case standard
    case strict

    public var label: String {
        rawValue.capitalized
    }

    public var multiplier: Double {
        switch self {
        case .lenient: 0.7
        case .standard: 1.0
        case .strict: 1.4
        }
    }
}

public enum AppThemePreference: String, Codable, CaseIterable, Hashable, Sendable {
    case system
    case light
    case dark

    public var label: String {
        rawValue.capitalized
    }
}

public enum DashStylePreference: String, Codable, CaseIterable, Hashable, Sendable {
    case spaced
    case closed

    public var label: String {
        switch self {
        case .spaced: "Spaced"
        case .closed: "Closed"
        }
    }

    public var replacement: String {
        switch self {
        case .spaced: " — "
        case .closed: "—"
        }
    }
}

public enum EvidenceSource: String, Codable, CaseIterable, Hashable, Sendable {
    case typed
    case pastedPlain
    case pastedRich

    public var label: String {
        switch self {
        case .typed: "Typed"
        case .pastedPlain: "Pasted"
        case .pastedRich: "Pasted Rich Text"
        }
    }
}

public enum ShareFormat: String, Codable, CaseIterable, Hashable, Sendable, Identifiable {
    case image
    case story
    case landscape
    case text
    case link

    public var id: String { rawValue }

    public var label: String {
        switch self {
        case .image: "Image"
        case .story: "Story"
        case .landscape: "Landscape"
        case .text: "Plain Text"
        case .link: "Copy Link"
        }
    }

    public var symbolName: String {
        switch self {
        case .image: "photo"
        case .story: "rectangle.portrait"
        case .landscape: "rectangle"
        case .text: "doc.text"
        case .link: "link"
        }
    }

    public var description: String {
        switch self {
        case .image: "PNG image optimized for social feeds."
        case .story: "1080×1920 story-ready report."
        case .landscape: "Wide card for article and social previews."
        case .text: "Formatted textual summary."
        case .link: "Placeholder deep link copy."
        }
    }
}

public enum CrimeType: String, Codable, CaseIterable, Hashable, Sendable, Identifiable {
    case doubleSpace
    case straightQuotes
    case hyphenAsDash
    case fakeEllipsis
    case widow
    case orphan
    case inconsistentSpacing
    case comicSans
    case primeMarks
    case multiplicationSign
    case trademarkSymbol

    public var id: String { rawValue }

    public var displayName: String {
        switch self {
        case .doubleSpace: "Double Spaces"
        case .straightQuotes: "Straight Quotes"
        case .hyphenAsDash: "Hyphen Abuse"
        case .fakeEllipsis: "Fake Ellipsis"
        case .widow: "Widows"
        case .orphan: "Orphans"
        case .inconsistentSpacing: "Inconsistent Spacing"
        case .comicSans: "Comic Sans"
        case .primeMarks: "Prime Marks"
        case .multiplicationSign: "Multiplication Sign Abuse"
        case .trademarkSymbol: "Trademark Symbol Misuse"
        }
    }

    public var shortDescription: String {
        switch self {
        case .doubleSpace: "Typewriter-era spacing still haunting modern text."
        case .straightQuotes: "ASCII quotes where proper curly punctuation belongs."
        case .hyphenAsDash: "Hyphens or double hyphens pretending to be dashes."
        case .fakeEllipsis: "Three periods standing in for a true ellipsis glyph."
        case .widow: "A lonely final-line word stranded at paragraph end."
        case .orphan: "A tiny carry-over line at the top of a new paragraph."
        case .inconsistentSpacing: "Mixed sentence-spacing styles in the same document."
        case .comicSans: "Comic Sans detected in the submitted evidence."
        case .primeMarks: "ASCII apostrophes or quotes used as prime marks."
        case .multiplicationSign: "Lowercase x used where the multiplication sign fits."
        case .trademarkSymbol: "Parenthetical substitutes used instead of proper symbols."
        }
    }

    public var category: CrimeCategory {
        switch self {
        case .straightQuotes, .hyphenAsDash, .fakeEllipsis:
            .punctuation
        case .doubleSpace, .inconsistentSpacing:
            .spacing
        case .widow, .orphan:
            .layout
        case .comicSans:
            .font
        case .primeMarks, .multiplicationSign, .trademarkSymbol:
            .symbol
        }
    }

    public var defaultSeverity: CrimeSeverity {
        switch self {
        case .straightQuotes, .hyphenAsDash:
            .misdemeanor
        case .comicSans:
            .felony
        default:
            .infraction
        }
    }

    public var baseWeight: Double {
        switch self {
        case .doubleSpace, .fakeEllipsis:
            2
        case .straightQuotes, .hyphenAsDash:
            3
        case .widow, .orphan, .inconsistentSpacing, .primeMarks, .multiplicationSign, .trademarkSymbol:
            1
        case .comicSans:
            15
        }
    }

    public var symbolName: String {
        switch self {
        case .doubleSpace: "space"
        case .straightQuotes: "quote.bubble"
        case .hyphenAsDash: "arrow.left.and.right.righttriangle.left.righttriangle.right"
        case .fakeEllipsis: "ellipsis"
        case .widow: "text.justify.left"
        case .orphan: "text.justify.right"
        case .inconsistentSpacing: "textformat"
        case .comicSans: "face.smiling"
        case .primeMarks: "ruler"
        case .multiplicationSign: "x.circle"
        case .trademarkSymbol: "centsign.circle"
        }
    }
}

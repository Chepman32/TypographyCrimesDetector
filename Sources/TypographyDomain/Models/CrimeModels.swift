import Foundation

public enum CrimeCategory: String, Codable, CaseIterable, Hashable, Sendable {
    case punctuation
    case spacing
    case layout
    case font
    case symbol

    public var title: String {
        switch self {
        case .punctuation: L10n.crimeCategoryTitle(.punctuation)
        case .spacing: L10n.crimeCategoryTitle(.spacing)
        case .layout: L10n.crimeCategoryTitle(.layout)
        case .font: L10n.crimeCategoryTitle(.font)
        case .symbol: L10n.crimeCategoryTitle(.symbol)
        }
    }
}

public enum CrimeSeverity: String, Codable, CaseIterable, Hashable, Sendable {
    case infraction
    case misdemeanor
    case felony

    public var label: String {
        switch self {
        case .infraction: L10n.text("severity.infraction")
        case .misdemeanor: L10n.text("severity.misdemeanor")
        case .felony: L10n.text("severity.felony")
        }
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
        case .clean: L10n.text("verdict.clean")
        case .infraction: L10n.text("verdict.infraction")
        case .misdemeanor: L10n.text("verdict.misdemeanor")
        case .felony: L10n.text("verdict.felony")
        case .capitalOffense: L10n.text("verdict.capital")
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
        switch self {
        case .lenient: L10n.text("strictness.lenient")
        case .standard: L10n.text("strictness.standard")
        case .strict: L10n.text("strictness.strict")
        }
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
        switch self {
        case .system: L10n.text("theme.system")
        case .light: L10n.text("theme.light")
        case .dark: L10n.text("theme.dark")
        }
    }
}

public enum DashStylePreference: String, Codable, CaseIterable, Hashable, Sendable {
    case spaced
    case closed

    public var label: String {
        switch self {
        case .spaced: L10n.text("dash.spaced")
        case .closed: L10n.text("dash.closed")
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
        case .typed: L10n.text("evidence_source.typed")
        case .pastedPlain: L10n.text("evidence_source.pasted")
        case .pastedRich: L10n.text("evidence_source.pasted_rich")
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
        case .image: L10n.text("share_format.image")
        case .story: L10n.text("share_format.story")
        case .landscape: L10n.text("share_format.landscape")
        case .text: L10n.text("share_format.text")
        case .link: L10n.text("share_format.link")
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
        case .image: L10n.text("share_format_desc.image")
        case .story: L10n.text("share_format_desc.story")
        case .landscape: L10n.text("share_format_desc.landscape")
        case .text: L10n.text("share_format_desc.text")
        case .link: L10n.text("share_format_desc.link")
        }
    }
}

public enum CrimeType: String, Codable, CaseIterable, Hashable, Sendable, Identifiable {
    case doubleSpace
    case straightQuotes
    case hyphenAsDash
    case fakeEllipsis
    case repeatedPunctuation
    case widow
    case orphan
    case inconsistentSpacing
    case comicSans
    case primeMarks
    case multiplicationSign
    case trademarkSymbol

    public var id: String { rawValue }

    public var displayName: String {
        L10n.crimeTypeTitle(self)
    }

    public var shortDescription: String {
        L10n.crimeTypeDescription(self)
    }

    public var category: CrimeCategory {
        switch self {
        case .straightQuotes, .hyphenAsDash, .fakeEllipsis, .repeatedPunctuation:
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
        case .straightQuotes, .hyphenAsDash, .repeatedPunctuation:
            .misdemeanor
        case .comicSans:
            .felony
        default:
            .infraction
        }
    }

    public var baseWeight: Double {
        switch self {
        case .doubleSpace, .fakeEllipsis, .repeatedPunctuation:
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
        case .repeatedPunctuation: "exclamationmark.2"
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

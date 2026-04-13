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
    public static var all: [CrimeEducationalArticle] {
        CrimeType.allCases.map(L10n.article(for:))
    }

    public static var byType: [CrimeType: CrimeEducationalArticle] {
        Dictionary(uniqueKeysWithValues: all.map { ($0.crimeType, $0) })
    }
}

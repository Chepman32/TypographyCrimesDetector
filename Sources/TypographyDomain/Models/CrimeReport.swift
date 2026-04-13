import Foundation

public struct CrimeLocation: Codable, Hashable, Sendable {
    public var startOffset: Int
    public var endOffset: Int
    public var line: Int
    public var column: Int

    public init(startOffset: Int, endOffset: Int, line: Int, column: Int) {
        self.startOffset = startOffset
        self.endOffset = endOffset
        self.line = line
        self.column = column
    }
}

public struct CrimeInstance: Identifiable, Codable, Hashable, Sendable {
    public var id: UUID
    public var crimeType: CrimeType
    public var severity: CrimeSeverity
    public var location: CrimeLocation
    public var contextSnippet: String
    public var evidenceSnippet: String
    public var suggestedFix: String
    public var explanation: String

    public init(
        id: UUID = UUID(),
        crimeType: CrimeType,
        severity: CrimeSeverity,
        location: CrimeLocation,
        contextSnippet: String,
        evidenceSnippet: String,
        suggestedFix: String,
        explanation: String
    ) {
        self.id = id
        self.crimeType = crimeType
        self.severity = severity
        self.location = location
        self.contextSnippet = contextSnippet
        self.evidenceSnippet = evidenceSnippet
        self.suggestedFix = suggestedFix
        self.explanation = explanation
    }
}

public struct CrimeSummary: Identifiable, Codable, Hashable, Sendable {
    public var id: CrimeType { crimeType }
    public var crimeType: CrimeType
    public var severity: CrimeSeverity
    public var count: Int
    public var instances: [CrimeInstance]

    public init(crimeType: CrimeType, severity: CrimeSeverity, count: Int, instances: [CrimeInstance]) {
        self.crimeType = crimeType
        self.severity = severity
        self.count = count
        self.instances = instances
    }
}

public struct AnalysisNote: Identifiable, Codable, Hashable, Sendable {
    public enum Kind: String, Codable, Hashable, Sendable {
        case info
        case warning
    }

    public var id: UUID
    public var kind: Kind
    public var message: String

    public init(id: UUID = UUID(), kind: Kind, message: String) {
        self.id = id
        self.kind = kind
        self.message = message
    }
}

public struct CrimeReport: Identifiable, Codable, Hashable, Sendable {
    public var id: UUID
    public var analyzedText: String
    public var createdAt: Date
    public var score: Int
    public var verdict: Verdict
    public var crimes: [CrimeInstance]
    public var groupedCrimes: [CrimeSummary]
    public var textLength: Int
    public var strictnessMode: StrictnessMode
    public var rawScore: Double
    public var notes: [AnalysisNote]

    public init(
        id: UUID = UUID(),
        analyzedText: String,
        createdAt: Date = .now,
        score: Int,
        verdict: Verdict,
        crimes: [CrimeInstance],
        groupedCrimes: [CrimeSummary],
        textLength: Int,
        strictnessMode: StrictnessMode,
        rawScore: Double,
        notes: [AnalysisNote] = []
    ) {
        self.id = id
        self.analyzedText = analyzedText
        self.createdAt = createdAt
        self.score = score
        self.verdict = verdict
        self.crimes = crimes
        self.groupedCrimes = groupedCrimes
        self.textLength = textLength
        self.strictnessMode = strictnessMode
        self.rawScore = rawScore
        self.notes = notes
    }

    public var crimeCount: Int {
        crimes.count
    }

    public var categoryCount: Int {
        Set(groupedCrimes.map(\.crimeType.category)).count
    }

    public var previewText: String {
        let trimmed = analyzedText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmed.count > 120 else { return trimmed }
        return String(trimmed.prefix(120)) + "…"
    }

    public var shareText: String {
        let topOffenses = groupedCrimes
            .sorted { lhs, rhs in
                if lhs.count == rhs.count {
                    return lhs.crimeType.displayName < rhs.crimeType.displayName
                }
                return lhs.count > rhs.count
            }
            .prefix(4)
            .map { "• \($0.crimeType.displayName): \($0.count) violation\($0.count == 1 ? "" : "s")" }
            .joined(separator: "\n")

        let offenses = topOffenses.isEmpty ? "• No crimes detected" : topOffenses
        return """
        🔍 Typography Crime Report
        Score: \(score)/100 — \(verdict.label)
        \(crimeCount) crime\(crimeCount == 1 ? "" : "s") detected

        🚨 Worst offenses:
        \(offenses)

        Analyzed with Typpo
        """
    }
}

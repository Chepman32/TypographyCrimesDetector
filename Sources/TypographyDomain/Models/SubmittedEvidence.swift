import Foundation

public struct FontRunMetadata: Codable, Hashable, Sendable {
    public var startOffset: Int
    public var endOffset: Int
    public var fontName: String
    public var pointSize: Double?

    public init(
        startOffset: Int,
        endOffset: Int,
        fontName: String,
        pointSize: Double? = nil
    ) {
        self.startOffset = startOffset
        self.endOffset = endOffset
        self.fontName = fontName
        self.pointSize = pointSize
    }
}

public struct SubmittedEvidence: Codable, Hashable, Sendable {
    public var text: String
    public var fontRuns: [FontRunMetadata]
    public var source: EvidenceSource
    public var capturedAt: Date

    public init(
        text: String,
        fontRuns: [FontRunMetadata] = [],
        source: EvidenceSource = .typed,
        capturedAt: Date = .now
    ) {
        self.text = text
        self.fontRuns = fontRuns
        self.source = source
        self.capturedAt = capturedAt
    }

    public var isWhitespaceOnly: Bool {
        text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

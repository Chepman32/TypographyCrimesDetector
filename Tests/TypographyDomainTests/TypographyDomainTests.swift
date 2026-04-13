import XCTest
@testable import TypographyDomain

final class TypographyDomainTests: XCTestCase {
    override func setUp() {
        super.setUp()
        L10n.languageOverride = .en
    }

    override func tearDown() {
        L10n.languageOverride = nil
        super.tearDown()
    }

    func testUserPreferencesToggleRoundTrip() {
        var preferences = UserPreferences.default
        XCTAssertTrue(preferences.isEnabled(.doubleSpace))
        preferences.setEnabled(false, for: .doubleSpace)
        XCTAssertFalse(preferences.isEnabled(.doubleSpace))
    }

    func testCrimeReportShareTextIncludesWorstOffenses() {
        let instance = CrimeInstance(
            crimeType: .fakeEllipsis,
            severity: .infraction,
            location: CrimeLocation(startOffset: 0, endOffset: 3, line: 1, column: 1),
            contextSnippet: "...",
            evidenceSnippet: "...",
            suggestedFix: "Replace with …",
            explanation: "Use the ellipsis glyph."
        )

        let summary = CrimeSummary(crimeType: .fakeEllipsis, severity: .infraction, count: 1, instances: [instance])
        let report = CrimeReport(
            analyzedText: "Wait...",
            score: 12,
            verdict: .infraction,
            crimes: [instance],
            groupedCrimes: [summary],
            textLength: 7,
            strictnessMode: .standard,
            rawScore: 2
        )

        XCTAssertTrue(report.shareText.contains("Score: 12/100"))
        XCTAssertTrue(report.shareText.contains("Fake Ellipsis"))
    }
}

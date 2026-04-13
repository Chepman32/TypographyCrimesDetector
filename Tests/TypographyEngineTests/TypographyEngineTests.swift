import XCTest
@testable import TypographyDomain
@testable import TypographyEngine

final class TypographyEngineTests: XCTestCase {
    override func setUp() {
        super.setUp()
        L10n.languageOverride = .en
    }

    override func tearDown() {
        L10n.languageOverride = nil
        super.tearDown()
    }

    func testDetectsDoubleSpacesAndEllipses() async {
        let engine = TypographyCrimeEngine()
        let evidence = SubmittedEvidence(text: "Wait...  Then go.")
        let report = await engine.analyze(evidence, preferences: .default)

        XCTAssertTrue(report.groupedCrimes.contains(where: { $0.crimeType == .fakeEllipsis }))
        XCTAssertTrue(report.groupedCrimes.contains(where: { $0.crimeType == .doubleSpace }))
    }

    func testPrimeMarksDoNotTriggerStraightQuotes() async {
        let engine = TypographyCrimeEngine()
        let evidence = SubmittedEvidence(text: #"He is 5'11" tall."#)
        let report = await engine.analyze(evidence, preferences: .default)

        XCTAssertTrue(report.groupedCrimes.contains(where: { $0.crimeType == .primeMarks }))
        XCTAssertFalse(report.groupedCrimes.contains(where: { $0.crimeType == .straightQuotes }))
    }

    func testComicSansAggravatorEscalatesScore() async {
        let engine = TypographyCrimeEngine()
        let evidence = SubmittedEvidence(
            text: #"He said "Hello"... "#,
            fontRuns: [FontRunMetadata(startOffset: 0, endOffset: 10, fontName: "ComicSansMS", pointSize: 14)],
            source: .pastedRich
        )
        let report = await engine.analyze(evidence, preferences: .default)

        XCTAssertTrue(report.groupedCrimes.contains(where: { $0.crimeType == .comicSans }))
        XCTAssertGreaterThanOrEqual(report.score, 40)
    }

    func testWhitespaceOnlyEvidenceReturnsCleanReportWithNote() async {
        let engine = TypographyCrimeEngine()
        let report = await engine.analyze(SubmittedEvidence(text: "   \n\t"), preferences: .default)

        XCTAssertEqual(report.score, 0)
        XCTAssertEqual(report.verdict, .clean)
        XCTAssertFalse(report.notes.isEmpty)
    }

    func testTrademarkAndMultiplicationAreDetected() async {
        let engine = TypographyCrimeEngine()
        let report = await engine.analyze(SubmittedEvidence(text: "(tm) screen is 1920x1080"), preferences: .default)

        XCTAssertTrue(report.groupedCrimes.contains(where: { $0.crimeType == .trademarkSymbol }))
        XCTAssertTrue(report.groupedCrimes.contains(where: { $0.crimeType == .multiplicationSign }))
    }

    func testHyphenSuggestionRespectsDashStylePreference() async {
        let engine = TypographyCrimeEngine()
        var preferences = UserPreferences.default
        preferences.dashStyle = .closed

        let report = await engine.analyze(SubmittedEvidence(text: "Wait -- what?"), preferences: preferences)
        let hyphenCrime = try? XCTUnwrap(report.crimes.first(where: { $0.crimeType == .hyphenAsDash }))

        XCTAssertEqual(hyphenCrime?.suggestedFix, "Replace with —")
    }

    func testNonLatinDominantTextAddsApplicabilityNote() async {
        let engine = TypographyCrimeEngine()
        let report = await engine.analyze(SubmittedEvidence(text: "こんにちは世界。これはタイポグラフィーのテストです。"), preferences: .default)

        XCTAssertTrue(report.notes.contains { $0.message.contains("Latin-script") })
    }
}

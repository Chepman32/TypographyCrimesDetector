import Foundation
import XCTest
@testable import TypographyDomain
@testable import TypographyFeatures

@MainActor
final class TypographyFeaturesTests: XCTestCase {
    override func setUp() {
        super.setUp()
        L10n.languageOverride = .en
    }

    override func tearDown() {
        L10n.languageOverride = nil
        super.tearDown()
    }

    func testAppStateUpdatesRulesAndComputesStats() {
        let repo = MockRepository()
        repo.reports = [
            CrimeReport(
                analyzedText: "Wait...",
                score: 34,
                verdict: .misdemeanor,
                crimes: [],
                groupedCrimes: [],
                textLength: 7,
                strictnessMode: .standard,
                rawScore: 12
            )
        ]

        let prefsStore = MockPreferencesStore()
        let state = TypographyAppState(repository: repo, preferencesStore: prefsStore, platform: MockPlatform())

        state.refreshReports()
        XCTAssertEqual(state.reports.count, 1)
        XCTAssertEqual(state.averageVerdictAbbreviation, "Msd.")

        state.updateRule(.doubleSpace, enabled: false)
        XCTAssertFalse(state.preferences.isEnabled(.doubleSpace))
        XCTAssertEqual(prefsStore.savedPreferences?.isEnabled(.doubleSpace), false)
    }

    func testAverageVerdictUsesAverageScoreInsteadOfWorstCase() {
        let repo = MockRepository()
        repo.reports = [
            CrimeReport(
                analyzedText: "Low",
                score: 10,
                verdict: .infraction,
                crimes: [],
                groupedCrimes: [],
                textLength: 3,
                strictnessMode: .standard,
                rawScore: 4
            ),
            CrimeReport(
                analyzedText: "High",
                score: 80,
                verdict: .felony,
                crimes: [],
                groupedCrimes: [],
                textLength: 4,
                strictnessMode: .standard,
                rawScore: 52
            ),
        ]

        let state = TypographyAppState(repository: repo, preferencesStore: MockPreferencesStore(), platform: MockPlatform())
        state.refreshReports()

        XCTAssertEqual(state.averageVerdictAbbreviation, "Msd.")
    }

    func testAppStatePersistsManualLanguageSelection() {
        let prefsStore = MockPreferencesStore()
        let state = TypographyAppState(repository: MockRepository(), preferencesStore: prefsStore, platform: MockPlatform())

        state.updateLanguage(.fr)

        XCTAssertEqual(state.preferences.language, .fr)
        XCTAssertEqual(prefsStore.savedPreferences?.language, .fr)
        XCTAssertEqual(L10n.languageOverride, .fr)

        state.updateLanguage(nil)

        XCTAssertNil(state.preferences.language)
        XCTAssertNil(prefsStore.savedPreferences?.language)
        XCTAssertNil(L10n.languageOverride)
    }
}

@MainActor
private final class MockRepository: CrimeReportRepository {
    var reports: [CrimeReport] = []

    func fetchReports() throws -> [CrimeReport] { reports }
    func save(report: CrimeReport) throws { reports.append(report) }
    func delete(reportIDs: [UUID]) throws { reports.removeAll { reportIDs.contains($0.id) } }
    func clearAll() throws { reports.removeAll() }
    func exportAllReports() throws -> Data { Data() }
}

@MainActor
private final class MockPreferencesStore: UserPreferencesStore {
    var preferences = UserPreferences.default
    var savedPreferences: UserPreferences?

    func load() -> UserPreferences { preferences }
    func save(_ preferences: UserPreferences) {
        self.preferences = preferences
        savedPreferences = preferences
    }
}

@MainActor
private final class MockPlatform: PlatformBridge {
    func readClipboard() -> ClipboardSnapshot? { nil }
    func copyText(_ text: String) {}
    func copyPNG(_ data: Data) {}
    func share(_ payload: SharePayload) {}
    func saveImageToPhotos(_ data: Data) async throws {}
    func emitHaptic(_ event: HapticEvent) {}
    func playSound(_ cue: SoundCue) {}
    func openURL(_ url: URL) {}
    func openSettings() {}
    func requestReview() {}
}

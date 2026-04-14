import Foundation
import Observation
import TypographyDomain
import TypographyEngine

@MainActor
@Observable
public final class TypographyAppState {
    public private(set) var reports: [CrimeReport] = []
    public var preferences: UserPreferences
    public var selectedTab: AppTab = .crimeLab
    public var launchPhase: LaunchPhase = .splash
    public var toast: ToastMessage?
    public var activeSheet: ActiveSheet?

    public let repository: any CrimeReportRepository
    public let preferencesStore: any UserPreferencesStore
    public let platform: any PlatformBridge
    public let releaseConfig: AppReleaseConfig
    public let engine = TypographyCrimeEngine()

    private var hasBootstrapped = false

    public init(
        repository: any CrimeReportRepository,
        preferencesStore: any UserPreferencesStore,
        platform: any PlatformBridge,
        releaseConfig: AppReleaseConfig = .placeholder
    ) {
        self.repository = repository
        self.preferencesStore = preferencesStore
        self.platform = platform
        self.releaseConfig = releaseConfig
        self.preferences = preferencesStore.load()
    }

    public enum ActiveSheet: Identifiable, Sendable {
        case about

        public var id: String {
            switch self {
            case .about: "about"
            }
        }
    }

    public var interfaceLocale: Locale {
        preferences.language?.locale ?? .autoupdatingCurrent
    }

    public func applyLanguagePreference() {
        L10n.setLanguageOverride(preferences.language)
    }

    public func bootstrap() {
        guard !hasBootstrapped else { return }
        hasBootstrapped = true
        applyLanguagePreference()
        refreshReports()

        Task {
            try? await Task.sleep(for: .seconds(1.8))
            launchPhase = preferences.hasCompletedOnboarding ? .main : .onboarding
        }
    }

    public func applyOnboardingSelections(_ selections: OnboardingSelections) {
        preferences.strictnessMode = selections.strictness
        preferences.theme = selections.theme
    }

    public func completeOnboarding() {
        preferences.hasCompletedOnboarding = true
        persistPreferences()
        launchPhase = .main
    }

    public func refreshReports() {
        do {
            reports = try repository.fetchReports().sorted { $0.createdAt > $1.createdAt }
        } catch {
            postToast(.init(symbolName: "exclamationmark.triangle.fill", message: L10n.text("toast.load_failed"), tone: .warning))
        }
    }

    public func save(report: CrimeReport) {
        do {
            try repository.save(report: report)
            refreshReports()
        } catch {
            postToast(.init(symbolName: "exclamationmark.triangle.fill", message: L10n.text("toast.save_failed"), tone: .warning))
        }
    }

    public func delete(reportIDs: [UUID]) {
        do {
            try repository.delete(reportIDs: reportIDs)
            refreshReports()
        } catch {
            postToast(.init(symbolName: "exclamationmark.triangle.fill", message: L10n.text("toast.delete_failed"), tone: .warning))
        }
    }

    public func clearReports() {
        do {
            try repository.clearAll()
            refreshReports()
            postToast(.init(symbolName: "trash", message: L10n.text("toast.cleared"), tone: .success))
        } catch {
            postToast(.init(symbolName: "exclamationmark.triangle.fill", message: L10n.text("toast.clear_failed"), tone: .warning))
        }
    }

    public func exportAllReports() {
        do {
            let data = try repository.exportAllReports()
            platform.share(SharePayload(items: [.jsonData(data, filename: "typography-crimes-reports.json")]))
        } catch {
            postToast(.init(symbolName: "exclamationmark.triangle.fill", message: L10n.text("toast.export_failed"), tone: .warning))
        }
    }

    public func persistPreferences() {
        preferencesStore.save(preferences)
    }

    public func updateLanguage(_ language: AppLanguage?) {
        preferences.language = language
        L10n.setLanguageOverride(language)
        persistPreferences()
    }

    public func updateRule(_ type: CrimeType, enabled: Bool) {
        preferences.setEnabled(enabled, for: type)
        persistPreferences()
    }

    public func postToast(_ toast: ToastMessage) {
        self.toast = toast
        Task {
            try? await Task.sleep(for: .seconds(2.5))
            if self.toast?.id == toast.id {
                self.toast = nil
            }
        }
    }

    public var totalCrimeCount: Int {
        reports.reduce(0) { $0 + $1.crimeCount }
    }

    public var averageVerdictAbbreviation: String {
        guard !reports.isEmpty else { return "—" }
        let averageScore = Int((Double(reports.reduce(0) { $0 + $1.score }) / Double(reports.count)).rounded())
        return L10n.verdictShortLabel(Verdict.from(score: averageScore))
    }
}

import Foundation
import TypographyDomain

public enum AppTab: String, CaseIterable, Hashable, Identifiable, Sendable {
    case crimeLab
    case caseFiles
    case learn
    case settings

    public var id: String { rawValue }

    public var title: String {
        switch self {
        case .crimeLab: L10n.text("app.tab.crime_lab")
        case .caseFiles: L10n.text("app.tab.case_files")
        case .learn: L10n.text("app.tab.learn")
        case .settings: L10n.text("app.tab.settings")
        }
    }

    public var systemName: String {
        switch self {
        case .crimeLab: "magnifyingglass"
        case .caseFiles: "clock.arrow.circlepath"
        case .learn: "book.closed"
        case .settings: "gearshape"
        }
    }
}

public enum LaunchPhase: Sendable {
    case splash
    case onboarding
    case main
}

public struct ToastMessage: Identifiable, Hashable, Sendable {
    public enum Tone: Sendable {
        case success
        case warning
        case neutral
    }

    public let id: UUID
    public let symbolName: String
    public let message: String
    public let tone: Tone

    public init(id: UUID = UUID(), symbolName: String, message: String, tone: Tone = .neutral) {
        self.id = id
        self.symbolName = symbolName
        self.message = message
        self.tone = tone
    }
}

public struct ClipboardSnapshot: Sendable {
    public var text: String
    public var fontRuns: [FontRunMetadata]
    public var source: EvidenceSource

    public init(text: String, fontRuns: [FontRunMetadata] = [], source: EvidenceSource = .pastedPlain) {
        self.text = text
        self.fontRuns = fontRuns
        self.source = source
    }
}

public enum SharePayloadItem: Sendable {
    case text(String)
    case url(URL)
    case pngData(Data, filename: String)
    case jsonData(Data, filename: String)
}

public struct SharePayload: Sendable {
    public var items: [SharePayloadItem]

    public init(items: [SharePayloadItem]) {
        self.items = items
    }
}

public enum HapticEvent: Sendable {
    case primary
    case secondary
    case card
    case tabSwitch
    case paste
    case analysisComplete
    case verdictReveal(Verdict)
    case warning
    case success
}

public enum SoundCue: Sendable {
    case analysisStart
    case analysisComplete
    case paste
    case share
    case mugshot
}

public enum PhotosSaveError: Error, Sendable {
    case permissionDenied
    case invalidImageData
    case writeFailed
}

@MainActor
public protocol CrimeReportRepository: AnyObject {
    func fetchReports() throws -> [CrimeReport]
    func save(report: CrimeReport) throws
    func delete(reportIDs: [UUID]) throws
    func clearAll() throws
    func exportAllReports() throws -> Data
}

@MainActor
public protocol UserPreferencesStore: AnyObject {
    func load() -> UserPreferences
    func save(_ preferences: UserPreferences)
}

@MainActor
public protocol PlatformBridge: AnyObject {
    func readClipboard() -> ClipboardSnapshot?
    func copyText(_ text: String)
    func copyPNG(_ data: Data)
    func share(_ payload: SharePayload)
    func saveImageToPhotos(_ data: Data) async throws
    func emitHaptic(_ event: HapticEvent)
    func playSound(_ cue: SoundCue)
    func openURL(_ url: URL)
    func openSettings()
    func requestReview()
}

public struct AppReleaseConfig: Hashable, Sendable {
    public var privacyPolicyURL: URL
    public var feedbackEmail: String
    public var appStoreURL: URL
    public var appWebsiteURL: URL
    public var deepLinkBaseURL: URL

    public init(
        privacyPolicyURL: URL,
        feedbackEmail: String,
        appStoreURL: URL,
        appWebsiteURL: URL,
        deepLinkBaseURL: URL
    ) {
        self.privacyPolicyURL = privacyPolicyURL
        self.feedbackEmail = feedbackEmail
        self.appStoreURL = appStoreURL
        self.appWebsiteURL = appWebsiteURL
        self.deepLinkBaseURL = deepLinkBaseURL
    }

    public static let placeholder = AppReleaseConfig(
        privacyPolicyURL: URL(string: "https://example.com/typography-crimes/privacy")!,
        feedbackEmail: "feedback@example.com",
        appStoreURL: URL(string: "https://apps.apple.com/app/id0000000000")!,
        appWebsiteURL: URL(string: "https://typocrimesapp.example.com")!,
        deepLinkBaseURL: URL(string: "https://typocrimesapp.example.com/reports")!
    )
}

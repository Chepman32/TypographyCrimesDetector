import AVFoundation
import Photos
import StoreKit
import SwiftData
import SwiftUI
import TypographyDomain
import TypographyFeatures
import UniformTypeIdentifiers
import UIKit

@main
struct TypographyCrimesDetectorApp: App {
    private let modelContainer: ModelContainer
    @State private var appState: TypographyAppState

    init() {
        FontRegistration.bootstrap()

        let container = try! ModelContainer(
            for: StoredCrimeReport.self,
            StoredCrimeInstance.self,
            configurations: ModelConfiguration("TypographyCrimesDetector")
        )

        let preferencesStore = LivePreferencesStore()
        let platform = LivePlatformBridge(preferencesStore: preferencesStore)
        let repository = SwiftDataCrimeReportRepository(modelContext: container.mainContext)

        self.modelContainer = container
        _appState = State(
            initialValue: TypographyAppState(
                repository: repository,
                preferencesStore: preferencesStore,
                platform: platform,
                releaseConfig: .placeholder
            )
        )
    }

    var body: some Scene {
        WindowGroup {
            TypographyCrimesRootView(appState: appState)
                .preferredColorScheme(colorScheme(for: appState.preferences.theme))
        }
        .modelContainer(modelContainer)
    }

    private func colorScheme(for theme: AppThemePreference) -> ColorScheme? {
        switch theme {
        case .system: nil
        case .light: .light
        case .dark: .dark
        }
    }
}

@Model
final class StoredCrimeReport {
    @Attribute(.unique) var id: UUID
    var analyzedText: String
    var createdAt: Date
    var score: Int
    var verdictRawValue: String
    var textLength: Int
    var strictnessRawValue: String
    var rawScore: Double
    var notesData: Data
    @Relationship(deleteRule: .cascade, inverse: \StoredCrimeInstance.report) var crimes: [StoredCrimeInstance]

    init(report: CrimeReport) {
        self.id = report.id
        self.analyzedText = report.analyzedText
        self.createdAt = report.createdAt
        self.score = report.score
        self.verdictRawValue = report.verdict.rawValue
        self.textLength = report.textLength
        self.strictnessRawValue = report.strictnessMode.rawValue
        self.rawScore = report.rawScore
        self.notesData = (try? JSONEncoder().encode(report.notes)) ?? Data()
        self.crimes = report.crimes.map(StoredCrimeInstance.init(instance:))
        for crime in crimes {
            crime.report = self
        }
    }

    func makeDomainModel() -> CrimeReport {
        let domainCrimes = crimes.map(\.domainModel).sorted { $0.location.startOffset < $1.location.startOffset }
        let grouped = Dictionary(grouping: domainCrimes, by: \.crimeType)
            .map { crimeType, matches in
                CrimeSummary(
                    crimeType: crimeType,
                    severity: crimeType.defaultSeverity,
                    count: matches.count,
                    instances: matches.sorted { $0.location.startOffset < $1.location.startOffset }
                )
            }
            .sorted { $0.count > $1.count }

        return CrimeReport(
            id: id,
            analyzedText: analyzedText,
            createdAt: createdAt,
            score: score,
            verdict: Verdict(rawValue: verdictRawValue) ?? .clean,
            crimes: domainCrimes,
            groupedCrimes: grouped,
            textLength: textLength,
            strictnessMode: StrictnessMode(rawValue: strictnessRawValue) ?? .standard,
            rawScore: rawScore,
            notes: (try? JSONDecoder().decode([AnalysisNote].self, from: notesData)) ?? []
        )
    }
}

@Model
final class StoredCrimeInstance {
    @Attribute(.unique) var id: UUID
    var crimeTypeRawValue: String
    var severityRawValue: String
    var startOffset: Int
    var endOffset: Int
    var line: Int
    var column: Int
    var contextSnippet: String
    var evidenceSnippet: String
    var suggestedFix: String
    var explanation: String
    var report: StoredCrimeReport?

    init(instance: CrimeInstance) {
        self.id = instance.id
        self.crimeTypeRawValue = instance.crimeType.rawValue
        self.severityRawValue = instance.severity.rawValue
        self.startOffset = instance.location.startOffset
        self.endOffset = instance.location.endOffset
        self.line = instance.location.line
        self.column = instance.location.column
        self.contextSnippet = instance.contextSnippet
        self.evidenceSnippet = instance.evidenceSnippet
        self.suggestedFix = instance.suggestedFix
        self.explanation = instance.explanation
    }

    var domainModel: CrimeInstance {
        CrimeInstance(
            id: id,
            crimeType: CrimeType(rawValue: crimeTypeRawValue) ?? .doubleSpace,
            severity: CrimeSeverity(rawValue: severityRawValue) ?? .infraction,
            location: CrimeLocation(startOffset: startOffset, endOffset: endOffset, line: line, column: column),
            contextSnippet: contextSnippet,
            evidenceSnippet: evidenceSnippet,
            suggestedFix: suggestedFix,
            explanation: explanation
        )
    }
}

@MainActor
final class SwiftDataCrimeReportRepository: CrimeReportRepository {
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func fetchReports() throws -> [CrimeReport] {
        let descriptor = FetchDescriptor<StoredCrimeReport>(sortBy: [SortDescriptor(\.createdAt, order: .reverse)])
        return try modelContext.fetch(descriptor).map { $0.makeDomainModel() }
    }

    func save(report: CrimeReport) throws {
        let existing = try modelContext.fetch(
            FetchDescriptor<StoredCrimeReport>(
                predicate: #Predicate { $0.id == report.id }
            )
        )
        existing.forEach(modelContext.delete(_:))
        modelContext.insert(StoredCrimeReport(report: report))
        try trimHistoryIfNeeded()
        try modelContext.save()
    }

    func delete(reportIDs: [UUID]) throws {
        let descriptor = FetchDescriptor<StoredCrimeReport>(
            predicate: #Predicate { reportIDs.contains($0.id) }
        )
        try modelContext.fetch(descriptor).forEach(modelContext.delete(_:))
        try modelContext.save()
    }

    func clearAll() throws {
        try modelContext.fetch(FetchDescriptor<StoredCrimeReport>()).forEach(modelContext.delete(_:))
        try modelContext.save()
    }

    func exportAllReports() throws -> Data {
        let reports = try fetchReports()
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(reports)
    }

    private func trimHistoryIfNeeded() throws {
        let descriptor = FetchDescriptor<StoredCrimeReport>(sortBy: [SortDescriptor(\.createdAt, order: .forward)])
        let reports = try modelContext.fetch(descriptor)
        guard reports.count > 500 else { return }
        let overflow = reports.count - 500
        reports.prefix(overflow).forEach(modelContext.delete(_:))
    }
}

@MainActor
final class LivePreferencesStore: UserPreferencesStore {
    private let defaults: UserDefaults
    private let storageKey = "TypographyCrimesDetector.userPreferences"

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    func load() -> UserPreferences {
        guard let data = defaults.data(forKey: storageKey) else { return .default }
        return (try? JSONDecoder().decode(UserPreferences.self, from: data)) ?? .default
    }

    func save(_ preferences: UserPreferences) {
        if let data = try? JSONEncoder().encode(preferences) {
            defaults.set(data, forKey: storageKey)
        }
    }
}

@MainActor
final class LivePlatformBridge: PlatformBridge {
    private let preferencesStore: LivePreferencesStore
    private var audioPlayer: AVAudioPlayer?

    init(preferencesStore: LivePreferencesStore) {
        self.preferencesStore = preferencesStore
    }

    func readClipboard() -> ClipboardSnapshot? {
        if let rich = richClipboardSnapshot() {
            return rich
        }

        guard let string = UIPasteboard.general.string else { return nil }
        return ClipboardSnapshot(text: string, source: .pastedPlain)
    }

    func copyText(_ text: String) {
        UIPasteboard.general.string = text
    }

    func copyPNG(_ data: Data) {
        UIPasteboard.general.setData(data, forPasteboardType: UTType.png.identifier)
    }

    func share(_ payload: SharePayload) {
        let items = payload.items.compactMap(convertShareItem(_:))
        guard !items.isEmpty, let controller = topViewController() else { return }
        let activity = UIActivityViewController(activityItems: items, applicationActivities: nil)
        controller.present(activity, animated: true)
    }

    func saveImageToPhotos(_ data: Data) async throws {
        let status = await PHPhotoLibrary.requestAuthorization(for: .addOnly)
        guard status == .authorized || status == .limited else {
            throw PhotosSaveError.permissionDenied
        }

        guard let image = UIImage(data: data) else {
            throw PhotosSaveError.invalidImageData
        }

        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            }) { success, error in
                if let error {
                    continuation.resume(throwing: error)
                } else if success {
                    continuation.resume()
                } else {
                    continuation.resume(throwing: PhotosSaveError.writeFailed)
                }
            }
        }
    }

    func emitHaptic(_ event: HapticEvent) {
        guard preferencesStore.load().hapticsEnabled else { return }
        switch event {
        case .primary, .paste:
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .secondary, .card, .tabSwitch:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .analysisComplete:
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        case let .verdictReveal(verdict):
            switch verdict {
            case .clean: UINotificationFeedbackGenerator().notificationOccurred(.success)
            case .infraction, .misdemeanor: UINotificationFeedbackGenerator().notificationOccurred(.warning)
            case .felony, .capitalOffense: UINotificationFeedbackGenerator().notificationOccurred(.error)
            }
        case .warning:
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
        case .success:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        }
    }

    func playSound(_ cue: SoundCue) {
        guard preferencesStore.load().soundsEnabled else { return }
        guard let url = Bundle.main.url(forResource: cue.resourceName, withExtension: "caf") else { return }
        guard let player = try? AVAudioPlayer(contentsOf: url) else { return }
        player.prepareToPlay()
        audioPlayer = player
        player.play()
    }

    func openURL(_ url: URL) {
        UIApplication.shared.open(url)
    }

    func openSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(url)
    }

    func requestReview() {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        SKStoreReviewController.requestReview(in: scene)
    }

    private func richClipboardSnapshot() -> ClipboardSnapshot? {
        let pasteboard = UIPasteboard.general
        let types = [UTType.rtf.identifier, UTType.flatRTFD.identifier, UTType.html.identifier]
        for type in types {
            guard let data = pasteboard.data(forPasteboardType: type) else { continue }

            let options: [NSAttributedString.DocumentReadingOptionKey: Any]
            switch type {
            case UTType.html.identifier:
                options = [.documentType: NSAttributedString.DocumentType.html]
            default:
                options = [.documentType: NSAttributedString.DocumentType.rtf]
            }

            if let attributed = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
                var runs: [FontRunMetadata] = []
                attributed.enumerateAttribute(.font, in: NSRange(location: 0, length: attributed.length)) { value, range, _ in
                    guard let font = value as? UIFont else { return }
                    runs.append(
                        FontRunMetadata(
                            startOffset: range.location,
                            endOffset: range.location + range.length,
                            fontName: font.fontName,
                            pointSize: font.pointSize
                        )
                    )
                }
                return ClipboardSnapshot(text: attributed.string, fontRuns: runs, source: .pastedRich)
            }
        }
        return nil
    }

    private func convertShareItem(_ item: SharePayloadItem) -> Any? {
        switch item {
        case let .text(text):
            return text
        case let .url(url):
            return url
        case let .pngData(data, _):
            return UIImage(data: data)
        case let .jsonData(data, filename):
            let url = FileManager.default.temporaryDirectory.appendingPathComponent(filename)
            try? data.write(to: url)
            return url
        }
    }

    private func topViewController(
        base: UIViewController? = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first(where: \.isKeyWindow)?
            .rootViewController
    ) -> UIViewController? {
        if let navigation = base as? UINavigationController {
            return topViewController(base: navigation.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return topViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}

private extension SoundCue {
    var resourceName: String {
        switch self {
        case .analysisStart: "analysis-start"
        case .analysisComplete: "analysis-complete"
        case .paste: "paste"
        case .share: "share"
        case .mugshot: "mugshot"
        }
    }
}

private enum FontRegistration {
    static func bootstrap() {
        let expectedFamilies = ["Instrument Serif", "Geist", "IBM Plex Mono"]
        let available = Set(UIFont.familyNames)
        let missing = expectedFamilies.filter { !available.contains($0) }
        if !missing.isEmpty {
            print("TypographyCrimesDetector font fallback active for: \(missing.joined(separator: ", "))")
        }
    }
}

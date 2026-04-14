import Foundation

public struct UserPreferences: Codable, Hashable, Sendable {
    public var ruleToggles: [CrimeType: Bool]
    public var strictnessMode: StrictnessMode
    public var theme: AppThemePreference
    public var language: AppLanguage?
    public var hapticsEnabled: Bool
    public var soundsEnabled: Bool
    public var dashStyle: DashStylePreference
    public var hasCompletedOnboarding: Bool

    public init(
        ruleToggles: [CrimeType: Bool] = [:],
        strictnessMode: StrictnessMode = .standard,
        theme: AppThemePreference = .system,
        language: AppLanguage? = nil,
        hapticsEnabled: Bool = true,
        soundsEnabled: Bool = true,
        dashStyle: DashStylePreference = .spaced,
        hasCompletedOnboarding: Bool = false
    ) {
        self.ruleToggles = ruleToggles
        self.strictnessMode = strictnessMode
        self.theme = theme
        self.language = language
        self.hapticsEnabled = hapticsEnabled
        self.soundsEnabled = soundsEnabled
        self.dashStyle = dashStyle
        self.hasCompletedOnboarding = hasCompletedOnboarding
    }

    public func isEnabled(_ crimeType: CrimeType) -> Bool {
        ruleToggles[crimeType] ?? true
    }

    public mutating func setEnabled(_ enabled: Bool, for crimeType: CrimeType) {
        ruleToggles[crimeType] = enabled
    }

    public static let `default` = UserPreferences()
}

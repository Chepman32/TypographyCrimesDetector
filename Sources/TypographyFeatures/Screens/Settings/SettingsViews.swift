import SwiftUI
import TypographyDesignSystem
import TypographyDomain

public struct SettingsContainer: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            SettingsView()
        }
    }
}

public struct SettingsView: View {
    @Environment(TypographyAppState.self) private var appState
    @State private var showClearConfirmation = false

    public init() {}

    public var body: some View {
        List {
            Section(L10n.text("settings.detection_rules")) {
                ForEach(CrimeType.allCases, id: \.self) { crime in
                    Toggle(isOn: Binding(
                        get: { appState.preferences.isEnabled(crime) },
                        set: { appState.updateRule(crime, enabled: $0) }
                    )) {
                        HStack(spacing: 12) {
                            Image(systemName: crime.symbolName)
                                .foregroundStyle(AppColors.textSecondary)
                            Text(crime.displayName)
                                .appTextStyle(.bodyLarge)
                        }
                    }
                    .tint(AppColors.accentCrimson)
                }
            }

            Section(L10n.text("settings.scoring")) {
                Picker(L10n.text("settings.strictness"), selection: Binding(
                    get: { appState.preferences.strictnessMode },
                    set: {
                        appState.preferences.strictnessMode = $0
                        appState.persistPreferences()
                    }
                )) {
                    ForEach(StrictnessMode.allCases, id: \.self) { mode in
                        Text(mode.label).tag(mode)
                    }
                }
                .pickerStyle(.segmented)

                Picker(L10n.text("settings.dash_style"), selection: Binding(
                    get: { appState.preferences.dashStyle },
                    set: {
                        appState.preferences.dashStyle = $0
                        appState.persistPreferences()
                    }
                )) {
                    ForEach(DashStylePreference.allCases, id: \.self) { style in
                        Text(style.label).tag(style)
                    }
                }
                .pickerStyle(.segmented)
            }

            Section(L10n.text("settings.appearance")) {
                Picker(L10n.text("settings.theme"), selection: Binding(
                    get: { appState.preferences.theme },
                    set: {
                        appState.preferences.theme = $0
                        appState.persistPreferences()
                    }
                )) {
                    ForEach(AppThemePreference.allCases, id: \.self) { theme in
                        Text(theme.label).tag(theme)
                    }
                }
                .pickerStyle(.segmented)

                Picker(L10n.text("settings.language"), selection: Binding(
                    get: { appState.preferences.language },
                    set: { appState.updateLanguage($0) }
                )) {
                    Text(L10n.text("settings.language.system"))
                        .tag(Optional<AppLanguage>.none)

                    ForEach(AppLanguage.allCases, id: \.self) { language in
                        Text(language.displayName)
                            .tag(Optional(language))
                    }
                }
                .pickerStyle(.menu)

                Toggle(L10n.text("settings.haptics"), isOn: Binding(
                    get: { appState.preferences.hapticsEnabled },
                    set: {
                        appState.preferences.hapticsEnabled = $0
                        appState.persistPreferences()
                    }
                ))
                .tint(AppColors.accentCrimson)

                Toggle(L10n.text("settings.sounds"), isOn: Binding(
                    get: { appState.preferences.soundsEnabled },
                    set: {
                        appState.preferences.soundsEnabled = $0
                        appState.persistPreferences()
                    }
                ))
                .tint(AppColors.accentCrimson)
            }

            Section(L10n.text("settings.data")) {
                Button(L10n.text("settings.clear_all"), role: .destructive) {
                    showClearConfirmation = true
                }
                Button(L10n.text("settings.export_all")) {
                    appState.exportAllReports()
                }
            }

            Section(L10n.text("settings.about")) {
                LabeledContent(L10n.text("settings.version"), value: "1.0.0 (Build 1)")
                Button(L10n.text("settings.typpo")) {
                    appState.activeSheet = .about
                }
                Button(L10n.text("settings.rate_app")) {
                    appState.platform.requestReview()
                    appState.platform.openURL(appState.releaseConfig.appStoreURL)
                }
                Button(L10n.text("settings.send_feedback")) {
                    if let mailURL = URL(string: "mailto:\(appState.releaseConfig.feedbackEmail)") {
                        appState.platform.openURL(mailURL)
                    }
                }
                Button(L10n.text("settings.privacy")) {
                    appState.platform.openURL(appState.releaseConfig.privacyPolicyURL)
                }
            }

            Text(L10n.text("settings.footer"))
                .appTextStyle(.bodySmall, color: AppColors.textTertiary)
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowBackground(Color.clear)
        }
        .navigationTitle(L10n.text("settings.title"))
        .confirmationDialog(L10n.text("settings.clear_confirm_title"), isPresented: $showClearConfirmation) {
            Button(L10n.text("settings.delete_all"), role: .destructive) {
                appState.clearReports()
            }
            Button(L10n.text("general.cancel"), role: .cancel) {}
        } message: {
            Text(L10n.text("settings.clear_confirm_message"))
        }
        .sheet(item: Binding(get: { appState.activeSheet }, set: { appState.activeSheet = $0 })) { sheet in
            switch sheet {
            case .about:
                AboutView()
                    .environment(appState)
            }
        }
    }
}

private struct AboutView: View {
    @Environment(TypographyAppState.self) private var appState

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text(L10n.text("settings.typpo"))
                        .appTextStyle(.displayMedium)
                    Text(L10n.text("settings.about_body"))
                        .appTextStyle(.bodyLarge)
                    Text(L10n.text("settings.about_placeholder"))
                        .appTextStyle(.bodyMedium, color: AppColors.textSecondary)
                    Text(L10n.format("settings.about_website", appState.releaseConfig.appWebsiteURL.absoluteString))
                        .appTextStyle(.monoSmall, color: AppColors.textSecondary)
                }
                .padding(24)
            }
            .background(AppColors.surfaceBase.ignoresSafeArea())
        }
    }
}

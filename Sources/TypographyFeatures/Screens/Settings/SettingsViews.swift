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
            Section("Detection Rules") {
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

            Section("Scoring") {
                Picker("Scoring Strictness", selection: Binding(
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

                Picker("Em-dash Style", selection: Binding(
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

            Section("Appearance") {
                Picker("Theme", selection: Binding(
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

                Toggle("Haptic Feedback", isOn: Binding(
                    get: { appState.preferences.hapticsEnabled },
                    set: {
                        appState.preferences.hapticsEnabled = $0
                        appState.persistPreferences()
                    }
                ))
                .tint(AppColors.accentCrimson)

                Toggle("Sound Effects", isOn: Binding(
                    get: { appState.preferences.soundsEnabled },
                    set: {
                        appState.preferences.soundsEnabled = $0
                        appState.persistPreferences()
                    }
                ))
                .tint(AppColors.accentCrimson)
            }

            Section("Data") {
                Button("Clear All Case Files", role: .destructive) {
                    showClearConfirmation = true
                }
                Button("Export All Reports") {
                    appState.exportAllReports()
                }
            }

            Section("About") {
                LabeledContent("Version", value: "1.0.0 (Build 1)")
                Button("Typography Crimes Detector") {
                    appState.activeSheet = .about
                }
                Button("Rate on App Store") {
                    appState.platform.requestReview()
                    appState.platform.openURL(appState.releaseConfig.appStoreURL)
                }
                Button("Send Feedback") {
                    if let mailURL = URL(string: "mailto:\(appState.releaseConfig.feedbackEmail)") {
                        appState.platform.openURL(mailURL)
                    }
                }
                Button("Privacy Policy") {
                    appState.platform.openURL(appState.releaseConfig.privacyPolicyURL)
                }
            }

            Text("Made with ♥ and proper curly quotes.")
                .appTextStyle(.bodySmall, color: AppColors.textTertiary)
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowBackground(Color.clear)
        }
        .navigationTitle("Settings")
        .confirmationDialog("Clear all case files?", isPresented: $showClearConfirmation) {
            Button("Delete All", role: .destructive) {
                appState.clearReports()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This action cannot be undone.")
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
                    Text("Typography Crimes Detector")
                        .appTextStyle(.displayMedium)
                    Text("Forensic analysis for your text. Paste any text. Get your Crime Score. Share the verdict.")
                        .appTextStyle(.bodyLarge)
                    Text("This build is fully offline and uses placeholder production wiring for web, policy, and store destinations until release values are replaced.")
                        .appTextStyle(.bodyMedium, color: AppColors.textSecondary)
                    Text("Website: \(appState.releaseConfig.appWebsiteURL.absoluteString)")
                        .appTextStyle(.monoSmall, color: AppColors.textSecondary)
                }
                .padding(24)
            }
            .background(AppColors.surfaceBase.ignoresSafeArea())
        }
    }
}

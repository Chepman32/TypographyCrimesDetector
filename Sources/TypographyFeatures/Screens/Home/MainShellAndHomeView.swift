import SwiftUI
import TypographyDesignSystem
import TypographyDomain

public struct MainShellView: View {
    @Environment(TypographyAppState.self) private var appState

    public init() {}

    public var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                CrimeLabContainer()
                    .opacity(appState.selectedTab == .crimeLab ? 1 : 0)
                    .accessibilityHidden(appState.selectedTab != .crimeLab)
                CaseFilesContainer()
                    .opacity(appState.selectedTab == .caseFiles ? 1 : 0)
                    .accessibilityHidden(appState.selectedTab != .caseFiles)
                LawLibraryContainer()
                    .opacity(appState.selectedTab == .learn ? 1 : 0)
                    .accessibilityHidden(appState.selectedTab != .learn)
                SettingsContainer()
                    .opacity(appState.selectedTab == .settings ? 1 : 0)
                    .accessibilityHidden(appState.selectedTab != .settings)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            CustomTabBar(
                items: AppTab.allCases.map { .init(id: $0.id, title: $0.title, systemName: $0.systemName) },
                selectedID: appState.selectedTab.id
            ) { selectedID in
                if let tab = AppTab(rawValue: selectedID) {
                    appState.selectedTab = tab
                    appState.platform.emitHaptic(.tabSwitch)
                }
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

private enum CrimeLabRoute: Hashable {
    case submitEvidence
    case report(CrimeReport)
}

public struct CrimeLabContainer: View {
    @State private var path = NavigationPath()

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            CrimeLabHomeView(openNewScan: { path.append(CrimeLabRoute.submitEvidence) }, openReport: { report in
                path.append(CrimeLabRoute.report(report))
            })
            .navigationDestination(for: CrimeLabRoute.self) { route in
                switch route {
                case .submitEvidence:
                    SubmitEvidenceView()
                case let .report(report):
                    CrimeReportScreen(report: report, allowsNewScan: false)
                }
            }
        }
    }
}

public struct CrimeLabHomeView: View {
    @Environment(TypographyAppState.self) private var appState
    public let openNewScan: () -> Void
    public let openReport: (CrimeReport) -> Void

    public init(openNewScan: @escaping () -> Void, openReport: @escaping (CrimeReport) -> Void) {
        self.openNewScan = openNewScan
        self.openReport = openReport
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HeroActionCard(
                    title: L10n.text("home.new_investigation"),
                    subtitle: L10n.text("home.new_investigation_subtitle"),
                    badgeText: L10n.text("home.new_investigation_badge")
                ) {
                    appState.platform.emitHaptic(.primary)
                    openNewScan()
                }

                statsBar

                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text(L10n.text("home.recent_cases"))
                            .appTextStyle(.titleSmall)
                        Spacer()
                        Button(L10n.text("home.see_all")) {
                            appState.selectedTab = .caseFiles
                        }
                        .appTextStyle(.labelMedium, color: AppColors.accentCrimson)
                    }

                    if appState.reports.isEmpty {
                        EmptyStateView(
                            symbolName: "magnifyingglass",
                            title: L10n.text("home.empty_title"),
                            subtitle: L10n.text("home.empty_subtitle"),
                            buttonTitle: L10n.text("home.begin_investigation"),
                            action: openNewScan
                        )
                    } else {
                        ForEach(appState.reports.prefix(5), id: \.id) { report in
                            Button {
                                openReport(report)
                            } label: {
                                CrimeReportCardView(report: report)
                            }
                            .buttonStyle(PressScaleButtonStyle(scale: 0.98))
                        }
                    }
                }
                .padding(.top, 12)

                Spacer(minLength: 100)
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.top, 12)
            .padding(.bottom, 90)
        }
        .background(AppColors.surfaceBase.ignoresSafeArea())
        .navigationTitle(L10n.text("app.tab.crime_lab"))
        .toolbar {
            ToolbarItem(placement: .appPrimaryAction) {
                Button {
                    appState.selectedTab = .settings
                } label: {
                    Image(systemName: "gearshape")
                        .foregroundStyle(AppColors.textSecondary)
                }
            }
        }
    }

    private var statsBar: some View {
        ViewThatFits {
            HStack(spacing: 12) {
                statCapsule(symbol: "magnifyingglass", number: "\(appState.reports.count)", label: L10n.text("home.stat.scans"))
                statCapsule(symbol: "handcuffs.fill", number: "\(appState.totalCrimeCount)", label: L10n.text("home.stat.crimes"))
                statCapsule(symbol: "chart.bar.fill", number: appState.averageVerdictAbbreviation, label: L10n.text("home.stat.avg"))
            }
            VStack(spacing: 12) {
                statCapsule(symbol: "magnifyingglass", number: "\(appState.reports.count)", label: L10n.text("home.stat.scans"))
                statCapsule(symbol: "handcuffs.fill", number: "\(appState.totalCrimeCount)", label: L10n.text("home.stat.crimes"))
                statCapsule(symbol: "chart.bar.fill", number: appState.averageVerdictAbbreviation, label: L10n.text("home.stat.avg"))
            }
        }
    }

    private func statCapsule(symbol: String, number: String, label: String) -> some View {
        HStack(spacing: 6) {
            Image(systemName: symbol)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(appState.reports.isEmpty ? AppColors.textTertiary : AppColors.textSecondary)
            Text(number)
                .appTextStyle(.monoBadge, color: appState.reports.isEmpty ? AppColors.textTertiary : AppColors.textPrimary)
            Text(label)
                .appTextStyle(.bodySmall, color: appState.reports.isEmpty ? AppColors.textTertiary : AppColors.textSecondary)
        }
        .padding(.horizontal, 12)
        .frame(height: 44)
        .frame(maxWidth: .infinity)
        .appCardStyle(cornerRadius: 12)
    }
}

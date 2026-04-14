import SwiftUI
import TypographyDesignSystem

public struct TypographyCrimesRootView: View {
    @State private var splashDismissed = false
    @State private var appState: TypographyAppState

    public init(appState: TypographyAppState) {
        _appState = State(initialValue: appState)
    }

    public var body: some View {
        ZStack(alignment: .top) {
            Group {
                switch appState.launchPhase {
                case .splash:
                    SplashView {
                        appState.launchPhase = appState.preferences.hasCompletedOnboarding ? .main : .onboarding
                    }
                case .onboarding:
                    OnboardingFlowView(
                        onThemeChange: { theme in
                            appState.previewOnboardingTheme(theme)
                        }
                    ) { selections in
                        appState.applyOnboardingSelections(selections)
                        appState.completeOnboarding()
                    }
                case .main:
                    MainShellView()
                        .environment(appState)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(AppColors.surfaceBase.ignoresSafeArea())

            if let toast = appState.toast, appState.launchPhase == .main {
                ToastView(symbolName: toast.symbolName, message: toast.message)
                    .padding(.top, 12)
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .animation(AppMotion.standard, value: appState.launchPhase)
        .animation(AppMotion.standard, value: appState.toast?.id)
        .environment(appState)
        .task {
            appState.bootstrap()
        }
    }
}

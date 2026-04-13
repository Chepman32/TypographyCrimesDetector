import SwiftUI
import TypographyDesignSystem
import TypographyDomain

public struct SplashView: View {
    public let onComplete: () -> Void
    @State private var reveal = false

    public init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }

    public var body: some View {
        ZStack {
            AppColors.surfaceReport.ignoresSafeArea()
            VStack(spacing: 20) {
                ZStack {
                    if reveal {
                        Circle()
                            .fill(AppGradients.scanPulse)
                            .frame(width: 220, height: 220)
                    }
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 68, weight: .bold))
                        .foregroundStyle(AppColors.textInverse.opacity(reveal ? 1 : 0.5))
                        .scaleEffect(reveal ? 1 : 0.85)
                }

                Text(L10n.text("brand.wordmark"))
                    .appTextStyle(.displayLarge, color: AppColors.textInverse)
                    .tracking(3)
                    .opacity(reveal ? 1 : 0)
                    .offset(y: reveal ? 0 : 12)

                Rectangle()
                    .fill(AppColors.accentCrimson.opacity(0.6))
                    .frame(width: 120, height: 1)
                    .opacity(reveal ? 1 : 0)

                Text(L10n.text("onboarding.splash_tagline"))
                    .appTextStyle(.bodyMedium, color: AppColors.textInverse.opacity(0.72))
                    .opacity(reveal ? 1 : 0)
            }
            .padding(24)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onComplete()
        }
        .task {
            withAnimation(AppMotion.gentle) { reveal = true }
            try? await Task.sleep(for: .seconds(1.8))
            onComplete()
        }
    }
}

public struct OnboardingFlowView: View {
    public let onComplete: () -> Void
    @State private var page = 0

    public init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }

    public var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $page) {
                OnboardingPage(
                    title: L10n.text("onboarding.page1.title"),
                    bodyText: L10n.text("onboarding.page1.body"),
                    background: LinearGradient(colors: [AppColors.surfaceReport, AppColors.surfaceBase], startPoint: .top, endPoint: .bottom),
                    artwork: AnyView(
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(AppColors.accentGold)
                                .frame(height: 34)
                                .rotationEffect(.degrees(-6))
                                .overlay(
                                    Text(L10n.text("brand.scene_tape_full"))
                                        .appTextStyle(.monoSmall, color: AppColors.surfaceReport)
                                )
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 60, weight: .bold))
                                .foregroundStyle(AppColors.textInverse)
                                .offset(y: 54)
                        }
                    )
                )
                .tag(0)

                OnboardingPage(
                    title: L10n.text("onboarding.page2.title"),
                    bodyText: L10n.text("onboarding.page2.body"),
                    background: LinearGradient(colors: [AppColors.surfaceBase, AppColors.surfaceBase], startPoint: .top, endPoint: .bottom),
                    artwork: AnyView(OnboardingEvidenceDemo())
                )
                .tag(1)

                OnboardingPage(
                    title: L10n.text("onboarding.page3.title"),
                    bodyText: L10n.text("onboarding.page3.body"),
                    background: LinearGradient(colors: [AppColors.surfaceBase, AppColors.surfaceBase], startPoint: .top, endPoint: .bottom),
                    artwork: AnyView(OnboardingVerdictDemo())
                )
                .tag(2)

                OnboardingPage(
                    title: L10n.text("onboarding.page4.title"),
                    bodyText: L10n.text("onboarding.page4.body"),
                    background: LinearGradient(colors: [AppColors.surfaceBase, AppColors.surfaceBase], startPoint: .top, endPoint: .bottom),
                    artwork: AnyView(OnboardingLibraryDemo())
                )
                .tag(3)
            }
            .appPagedTabView()

            VStack(spacing: 24) {
                HStack(spacing: 12) {
                    ForEach(0..<4, id: \.self) { index in
                        Capsule()
                            .fill(index == page ? AppColors.accentCrimson : AppColors.textTertiary.opacity(0.35))
                            .frame(width: index == page ? 28 : 8, height: 8)
                    }
                }

                Button(page == 3 ? L10n.text("onboarding.start") : L10n.text("general.next")) {
                    if page == 3 {
                        onComplete()
                    } else {
                        withAnimation(AppMotion.standard) {
                            page += 1
                        }
                    }
                }
                .appTextStyle(.labelLarge, color: AppColors.textInverse)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(AppColors.accentCrimson, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                .buttonStyle(PressScaleButtonStyle(scale: 0.96))
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.bottom, 32)
        }
        .overlay(alignment: .topTrailing) {
            Button(L10n.text("general.skip")) {
                onComplete()
            }
            .appTextStyle(.labelMedium, color: AppColors.textSecondary)
            .padding(.top, 20)
            .padding(.trailing, 20)
        }
    }
}

private struct OnboardingPage: View {
    let title: String
    let bodyText: String
    let background: LinearGradient
    let artwork: AnyView

    var body: some View {
        ZStack {
            background.ignoresSafeArea()
            VStack(spacing: 24) {
                Spacer()
                artwork
                    .frame(maxWidth: .infinity)
                    .frame(height: 260)
                Spacer()
                VStack(spacing: 16) {
                    Text(title)
                        .appTextStyle(.displayMedium)
                        .multilineTextAlignment(.center)
                    Text(bodyText)
                        .appTextStyle(.bodyLarge, color: AppColors.textSecondary)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 300)
                }
                Spacer()
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.top, AppSpacing.xxxl)
            .padding(.bottom, AppSpacing.cover + AppSpacing.xl)
        }
    }
}

private struct OnboardingEvidenceDemo: View {
    @State private var revealIndex = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(L10n.text("onboarding.demo_sentence"))
                .appTextStyle(.monoBody)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(AppColors.surfaceSecondary, in: RoundedRectangle(cornerRadius: 14, style: .continuous))

            VStack(alignment: .leading, spacing: 8) {
                ForEach(Array([CrimeType.straightQuotes.displayName, CrimeType.fakeEllipsis.displayName, L10n.text("onboarding.sample.not_em_dash")].enumerated()), id: \.offset) { index, label in
                    HStack {
                        Circle()
                            .fill(AppColors.accentCrimson)
                            .frame(width: 8, height: 8)
                        Text(label)
                            .appTextStyle(.bodySmall)
                    }
                    .opacity(revealIndex >= index ? 1 : 0.15)
                }
            }
        }
        .padding(16)
        .appCardStyle(cornerRadius: 18)
        .task {
            guard !AppMotion.isReduced else {
                revealIndex = 2
                return
            }
            for index in 0..<3 {
                try? await Task.sleep(for: .seconds(0.5))
                withAnimation(AppMotion.standard) { revealIndex = index }
            }
        }
    }
}

private struct OnboardingVerdictDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            ScoreRingView(score: 47, verdict: .misdemeanor)
                .frame(width: 150, height: 150)
            SeverityBadgeView(verdict: .misdemeanor)
            Text(L10n.crimeCountSummary(crimes: 7, categories: 3))
                .appTextStyle(.bodyMedium, color: AppColors.textInverse.opacity(0.75))
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(AppGradients.reportBackground, in: RoundedRectangle(cornerRadius: 24, style: .continuous))
        .appShadow(AppShadow.high)
    }
}

private struct OnboardingLibraryDemo: View {
    @State private var flipped = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(AppColors.surfaceSecondary)
            VStack(spacing: 20) {
                Image(systemName: flipped ? "magnifyingglass" : "book.closed")
                    .font(.system(size: 64, weight: .bold))
                    .foregroundStyle(AppColors.accentCrimson)
                Text(flipped ? L10n.text("onboarding.library.investigate") : L10n.text("onboarding.library.study"))
                    .appTextStyle(.titleLarge)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .task {
            guard !AppMotion.isReduced else { return }
            while true {
                try? await Task.sleep(for: .seconds(1.5))
                withAnimation(AppMotion.standard) { flipped.toggle() }
            }
        }
    }
}

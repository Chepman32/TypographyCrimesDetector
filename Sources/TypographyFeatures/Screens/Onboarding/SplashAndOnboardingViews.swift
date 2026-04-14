import SwiftUI
import TypographyDesignSystem
import TypographyDomain
import TypographyEngine

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

// MARK: - Onboarding Questionnaire

public struct OnboardingFlowView: View {
    public let onComplete: (OnboardingSelections) -> Void
    @State private var page = 0
    @State private var selections = OnboardingSelections()
    @State private var direction: TransitionDirection = .forward
    @State private var demoReport: CrimeReport?
    @State private var isAnalyzing = false

    private let totalPages = 8

    public init(onComplete: @escaping (OnboardingSelections) -> Void) {
        self.onComplete = onComplete
    }

    public var body: some View {
        ZStack {
            AppColors.surfaceBase.ignoresSafeArea()

            VStack(spacing: 0) {
                // Progress bar
                OnboardingProgressBar(current: page, total: totalPages)
                    .padding(.top, 8)

                // Content
                Group {
                    switch page {
                    case 0: welcomeScreen
                    case 1: roleScreen
                    case 2: painPointScreen
                    case 3: socialProofScreen
                    case 4: strictnessScreen
                    case 5: themeScreen
                    case 6: demoScreen
                    case 7: readyScreen
                    default: EmptyView()
                    }
                }
                .transition(direction == .forward
                    ? .asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity),
                                  removal: .move(edge: .leading).combined(with: .opacity))
                    : .asymmetric(insertion: .move(edge: .leading).combined(with: .opacity),
                                  removal: .move(edge: .trailing).combined(with: .opacity)))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .overlay(alignment: .topLeading) {
            if page > 0 && page < totalPages - 1 {
                Button {
                    goBack()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(AppColors.textSecondary)
                        .frame(width: 44, height: 44)
                }
                .padding(.top, 12)
                .padding(.leading, 12)
            }
        }
        .overlay(alignment: .topTrailing) {
            if page > 0 && page < totalPages - 1 {
                Button(L10n.text("general.skip")) {
                    onComplete(selections)
                }
                .appTextStyle(.labelMedium, color: AppColors.textSecondary)
                .padding(.top, 20)
                .padding(.trailing, 20)
            }
        }
    }

    // MARK: - Screen 1: Welcome

    private var welcomeScreen: some View {
        VStack(spacing: 0) {
            Spacer()

            OnboardingWelcomeArtwork()
                .frame(height: 240)

            Spacer().frame(height: AppSpacing.xxl)

            VStack(spacing: AppSpacing.base) {
                Text(L10n.text("onboarding.welcome.title"))
                    .appTextStyle(.displayLarge)
                    .multilineTextAlignment(.center)

                Text(L10n.text("onboarding.welcome.subtitle"))
                    .appTextStyle(.bodyLarge, color: AppColors.textSecondary)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
            }

            Spacer()

            OnboardingPrimaryButton(title: L10n.text("onboarding.welcome.cta")) {
                goForward()
            }
            .padding(.bottom, AppSpacing.xxl)
        }
        .padding(.horizontal, AppSpacing.lg)
    }

    // MARK: - Screen 2: Role

    private var roleScreen: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: AppSpacing.hero)

            Text(L10n.text("onboarding.role.title"))
                .appTextStyle(.displayMedium)
                .multilineTextAlignment(.center)
                .padding(.horizontal, AppSpacing.lg)

            Text(L10n.text("onboarding.role.subtitle"))
                .appTextStyle(.bodyLarge, color: AppColors.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.top, AppSpacing.sm)
                .padding(.horizontal, AppSpacing.lg)

            Spacer().frame(height: AppSpacing.xxl)

            VStack(spacing: AppSpacing.md) {
                ForEach(OnboardingRole.allCases, id: \.self) { role in
                    OnboardingChipButton(
                        icon: role.icon,
                        title: role.title,
                        subtitle: role.subtitle,
                        isSelected: selections.role == role
                    ) {
                        withAnimation(AppMotion.snappy) {
                            selections.role = role
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            goForward()
                        }
                    }
                }
            }
            .padding(.horizontal, AppSpacing.lg)

            Spacer()
        }
    }

    // MARK: - Screen 3: Pain Points

    private var painPointScreen: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: AppSpacing.hero)

            Text(L10n.text("onboarding.crimes.title"))
                .appTextStyle(.displayMedium)
                .multilineTextAlignment(.center)
                .padding(.horizontal, AppSpacing.lg)

            Text(L10n.text("onboarding.crimes.subtitle"))
                .appTextStyle(.bodyMedium, color: AppColors.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.top, AppSpacing.sm)
                .padding(.horizontal, AppSpacing.lg)

            Spacer().frame(height: AppSpacing.xl)

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: AppSpacing.sm) {
                    ForEach(OnboardingCrimeChoice.allCases, id: \.self) { choice in
                        OnboardingCrimeCard(
                            choice: choice,
                            isSelected: selections.selectedCrimes.contains(choice)
                        ) {
                            withAnimation(AppMotion.snappy) {
                                if selections.selectedCrimes.contains(choice) {
                                    selections.selectedCrimes.remove(choice)
                                } else {
                                    selections.selectedCrimes.insert(choice)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, AppSpacing.lg)
            }

            Spacer().frame(height: AppSpacing.base)

            OnboardingPrimaryButton(
                title: selections.selectedCrimes.isEmpty
                    ? L10n.text("onboarding.crimes.skip")
                    : L10n.text("general.next")
            ) {
                goForward()
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.bottom, AppSpacing.xxl)
        }
    }

    // MARK: - Screen 4: Social Proof

    private var socialProofScreen: some View {
        VStack(spacing: 0) {
            Spacer()

            VStack(spacing: AppSpacing.xl) {
                Image(systemName: "person.3.fill")
                    .font(.system(size: 48))
                    .foregroundStyle(AppColors.accentCrimson)

                Text(L10n.text("onboarding.social.title"))
                    .appTextStyle(.displayMedium)
                    .multilineTextAlignment(.center)

                Text(L10n.text("onboarding.social.subtitle"))
                    .appTextStyle(.bodyLarge, color: AppColors.textSecondary)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
            }
            .padding(.horizontal, AppSpacing.lg)

            Spacer().frame(height: AppSpacing.xxxl)

            VStack(spacing: AppSpacing.md) {
                OnboardingTestimonialCard(
                    quote: L10n.text("onboarding.social.quote1"),
                    author: L10n.text("onboarding.social.author1")
                )
                OnboardingTestimonialCard(
                    quote: L10n.text("onboarding.social.quote2"),
                    author: L10n.text("onboarding.social.author2")
                )
            }
            .padding(.horizontal, AppSpacing.lg)

            Spacer()

            OnboardingPrimaryButton(title: L10n.text("general.next")) {
                goForward()
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.bottom, AppSpacing.xxl)
        }
    }

    // MARK: - Screen 5: Strictness

    private var strictnessScreen: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: AppSpacing.hero)

            Text(L10n.text("onboarding.strictness.title"))
                .appTextStyle(.displayMedium)
                .multilineTextAlignment(.center)
                .padding(.horizontal, AppSpacing.lg)

            Text(L10n.text("onboarding.strictness.subtitle"))
                .appTextStyle(.bodyLarge, color: AppColors.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.top, AppSpacing.sm)
                .padding(.horizontal, AppSpacing.lg)

            Spacer().frame(height: AppSpacing.xxxl)

            VStack(spacing: AppSpacing.md) {
                ForEach(StrictnessMode.allCases, id: \.self) { mode in
                    OnboardingStrictnessCard(
                        mode: mode,
                        isSelected: selections.strictness == mode
                    ) {
                        withAnimation(AppMotion.snappy) {
                            selections.strictness = mode
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            goForward()
                        }
                    }
                }
            }
            .padding(.horizontal, AppSpacing.lg)

            Spacer()
        }
    }

    // MARK: - Screen 6: Theme

    private var themeScreen: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: AppSpacing.hero)

            Text(L10n.text("onboarding.theme.title"))
                .appTextStyle(.displayMedium)
                .multilineTextAlignment(.center)
                .padding(.horizontal, AppSpacing.lg)

            Spacer().frame(height: AppSpacing.xxxl)

            HStack(spacing: AppSpacing.md) {
                ForEach(AppThemePreference.allCases, id: \.self) { theme in
                    OnboardingThemeCard(
                        theme: theme,
                        isSelected: selections.theme == theme
                    ) {
                        withAnimation(AppMotion.snappy) {
                            selections.theme = theme
                        }
                    }
                }
            }
            .padding(.horizontal, AppSpacing.lg)

            Spacer()

            OnboardingPrimaryButton(title: L10n.text("general.next")) {
                goForward()
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.bottom, AppSpacing.xxl)
        }
    }

    // MARK: - Screen 7: Demo

    private var demoScreen: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: AppSpacing.xxxl)

            if let report = demoReport {
                // Show results
                VStack(spacing: AppSpacing.xl) {
                    Text(L10n.text("onboarding.demo.results_title"))
                        .appTextStyle(.displayMedium)
                        .multilineTextAlignment(.center)

                    VStack(spacing: AppSpacing.lg) {
                        ScoreRingView(score: report.score, verdict: report.verdict)
                            .frame(width: 130, height: 130)

                        SeverityBadgeView(verdict: report.verdict)

                        Text(L10n.crimeCountSummary(crimes: report.crimeCount, categories: report.categoryCount))
                            .appTextStyle(.bodyMedium, color: AppColors.textSecondary)
                    }
                    .padding(AppSpacing.xl)
                    .frame(maxWidth: .infinity)
                    .background(AppGradients.reportBackground, in: RoundedRectangle(cornerRadius: 24, style: .continuous))
                    .appShadow(AppShadow.high)

                    if let firstCrime = report.crimes.first {
                        VStack(alignment: .leading, spacing: AppSpacing.sm) {
                            HStack {
                                Circle()
                                    .fill(AppColors.accentCrimson)
                                    .frame(width: 8, height: 8)
                                Text(firstCrime.crimeType.displayName)
                                    .appTextStyle(.labelMedium)
                            }
                            Text(firstCrime.contextSnippet)
                                .appTextStyle(.monoSmall, color: AppColors.textSecondary)
                                .lineLimit(2)
                        }
                        .padding(AppSpacing.base)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .appCardStyle(cornerRadius: 14)
                    }

                    Text(L10n.text("onboarding.demo.results_body"))
                        .appTextStyle(.bodyMedium, color: AppColors.textSecondary)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 280)
                }
                .padding(.horizontal, AppSpacing.lg)
            } else {
                // Input state
                VStack(spacing: AppSpacing.xl) {
                    Text(L10n.text("onboarding.demo.title"))
                        .appTextStyle(.displayMedium)
                        .multilineTextAlignment(.center)

                    Text(L10n.text("onboarding.demo.subtitle"))
                        .appTextStyle(.bodyLarge, color: AppColors.textSecondary)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 300)

                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(AppColors.surfaceSecondary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .stroke(AppColors.borderSubtle, lineWidth: 1)
                            )

                        if selections.demoText.isEmpty {
                            Text(L10n.text("onboarding.demo.placeholder"))
                                .appTextStyle(.bodyMedium, color: AppColors.textTertiary)
                                .padding(AppSpacing.base)
                        }

                        TextEditor(text: $selections.demoText)
                            .scrollContentBackground(.hidden)
                            .appTextStyle(.monoBody)
                            .padding(AppSpacing.md)
                    }
                    .frame(height: 160)

                    Button(L10n.text("onboarding.demo.use_sample")) {
                        withAnimation(AppMotion.snappy) {
                            selections.demoText = L10n.text("onboarding.demo_sentence")
                        }
                    }
                    .appTextStyle(.labelMedium, color: AppColors.accentCrimson)
                    .buttonStyle(PressScaleButtonStyle())
                }
                .padding(.horizontal, AppSpacing.lg)
            }

            Spacer()

            if isAnalyzing {
                ProgressView()
                    .tint(AppColors.accentCrimson)
                    .padding(.bottom, AppSpacing.xxl)
            } else {
                OnboardingPrimaryButton(
                    title: demoReport != nil ? L10n.text("general.next") : L10n.text("onboarding.demo.analyze")
                ) {
                    if demoReport != nil {
                        goForward()
                    } else {
                        runDemo()
                    }
                }
                .padding(.horizontal, AppSpacing.lg)
                .padding(.bottom, AppSpacing.xxl)
                .opacity(selections.demoText.isEmpty && demoReport == nil ? 0.5 : 1)
                .disabled(selections.demoText.isEmpty && demoReport == nil)
            }
        }
    }

    // MARK: - Screen 8: Ready

    private var readyScreen: some View {
        VStack(spacing: 0) {
            Spacer()

            VStack(spacing: AppSpacing.xl) {
                ZStack {
                    Circle()
                        .fill(AppGradients.scanPulse)
                        .frame(width: 200, height: 200)

                    Image(systemName: "shield.checkered")
                        .font(.system(size: 72, weight: .bold))
                        .foregroundStyle(AppColors.accentCrimson)
                }

                Text(L10n.text("onboarding.ready.title"))
                    .appTextStyle(.displayLarge)
                    .multilineTextAlignment(.center)

                Text(L10n.text("onboarding.ready.subtitle"))
                    .appTextStyle(.bodyLarge, color: AppColors.textSecondary)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)

                // Summary pills
                VStack(spacing: AppSpacing.sm) {
                    if let role = selections.role {
                        OnboardingSummaryPill(
                            icon: role.icon,
                            text: role.title
                        )
                    }
                    OnboardingSummaryPill(
                        icon: strictnessIcon(selections.strictness),
                        text: selections.strictness.label
                    )
                }
            }
            .padding(.horizontal, AppSpacing.lg)

            Spacer()

            OnboardingPrimaryButton(title: L10n.text("onboarding.ready.cta")) {
                onComplete(selections)
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.bottom, AppSpacing.xxl)
        }
    }

    // MARK: - Navigation

    private func goForward() {
        direction = .forward
        withAnimation(AppMotion.standard) {
            page = min(page + 1, totalPages - 1)
        }
    }

    private func goBack() {
        direction = .backward
        withAnimation(AppMotion.standard) {
            page = max(page - 1, 0)
        }
    }

    private func runDemo() {
        guard !selections.demoText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        isAnalyzing = true
        let engine = TypographyCrimeEngine()
        let evidence = SubmittedEvidence(text: selections.demoText, source: .typed)
        let prefs = UserPreferences()
        Task {
            let report = await engine.analyze(evidence, preferences: prefs)
            withAnimation(AppMotion.standard) {
                demoReport = report
                isAnalyzing = false
            }
        }
    }

    private func strictnessIcon(_ mode: StrictnessMode) -> String {
        switch mode {
        case .lenient: "gauge.with.dots.needle.0percent"
        case .standard: "gauge.with.dots.needle.50percent"
        case .strict: "gauge.with.dots.needle.100percent"
        }
    }
}

// MARK: - Data Models

private enum TransitionDirection {
    case forward, backward
}

public struct OnboardingSelections {
    public var role: OnboardingRole?
    public var selectedCrimes: Set<OnboardingCrimeChoice> = []
    public var strictness: StrictnessMode = .standard
    public var theme: AppThemePreference = .system
    public var demoText: String = ""
}

public enum OnboardingRole: String, CaseIterable {
    case designer, writer, developer, student, other

    var icon: String {
        switch self {
        case .designer: "paintbrush.pointed"
        case .writer: "pencil.line"
        case .developer: "chevron.left.forwardslash.chevron.right"
        case .student: "book"
        case .other: "sparkles"
        }
    }

    var title: String {
        L10n.text("onboarding.role.\(rawValue)")
    }

    var subtitle: String {
        L10n.text("onboarding.role.\(rawValue).sub")
    }
}

public enum OnboardingCrimeChoice: String, CaseIterable, Hashable {
    case straightQuotes, fakeEllipsis, doubleSpace, hyphenAsDash, comicSans

    var crimeType: CrimeType {
        switch self {
        case .straightQuotes: .straightQuotes
        case .fakeEllipsis: .fakeEllipsis
        case .doubleSpace: .doubleSpace
        case .hyphenAsDash: .hyphenAsDash
        case .comicSans: .comicSans
        }
    }

    var wrongExample: String {
        switch self {
        case .straightQuotes: L10n.text("onboarding.choice.straight_quotes.wrong")
        case .fakeEllipsis: "..."
        case .doubleSpace: L10n.text("onboarding.choice.double_space.wrong")
        case .hyphenAsDash: "2020-2024"
        case .comicSans: "Comic Sans"
        }
    }

    var rightExample: String {
        switch self {
        case .straightQuotes: L10n.text("onboarding.choice.straight_quotes.right")
        case .fakeEllipsis: "\u{2026}"
        case .doubleSpace: L10n.text("onboarding.choice.double_space.right")
        case .hyphenAsDash: "2020\u{2013}2024"
        case .comicSans: L10n.text("onboarding.choice.comic_sans.right")
        }
    }
}

// MARK: - Reusable Components

private struct OnboardingProgressBar: View {
    let current: Int
    let total: Int

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(AppColors.surfaceSecondary)
                    .frame(height: 4)

                Capsule()
                    .fill(AppColors.accentCrimson)
                    .frame(width: geo.size.width * CGFloat(current + 1) / CGFloat(total), height: 4)
                    .animation(AppMotion.standard, value: current)
            }
        }
        .frame(height: 4)
        .padding(.horizontal, AppSpacing.lg)
    }
}

private struct OnboardingPrimaryButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .appTextStyle(.labelLarge, color: AppColors.textInverse)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(AppColors.accentCrimson, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
        .buttonStyle(PressScaleButtonStyle(scale: 0.96))
    }
}

private struct OnboardingChipButton: View {
    let icon: String
    let title: String
    let subtitle: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.base) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundStyle(isSelected ? AppColors.accentCrimson : AppColors.textSecondary)
                    .frame(width: 32)

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .appTextStyle(.labelMedium)
                    Text(subtitle)
                        .appTextStyle(.bodySmall, color: AppColors.textTertiary)
                }

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(AppColors.accentCrimson)
                        .font(.system(size: 20))
                }
            }
            .padding(.horizontal, AppSpacing.base)
            .padding(.vertical, AppSpacing.md)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(isSelected ? AppColors.accentCrimson.opacity(0.08) : AppColors.surfacePrimary)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(isSelected ? AppColors.accentCrimson.opacity(0.4) : AppColors.borderSubtle, lineWidth: 1)
            )
        }
        .buttonStyle(PressScaleButtonStyle())
    }
}

private struct OnboardingCrimeCard: View {
    let choice: OnboardingCrimeChoice
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.base) {
                Image(systemName: choice.crimeType.symbolName)
                    .font(.system(size: 18))
                    .foregroundStyle(isSelected ? AppColors.accentCrimson : AppColors.textSecondary)
                    .frame(width: 28)

                VStack(alignment: .leading, spacing: 4) {
                    Text(choice.crimeType.displayName)
                        .appTextStyle(.labelMedium)

                    HStack(spacing: AppSpacing.xs) {
                        Text(choice.wrongExample)
                            .appTextStyle(.monoSmall, color: AppColors.accentCrimson.opacity(0.8))
                            .strikethrough(color: AppColors.accentCrimson.opacity(0.5))
                        Image(systemName: "arrow.right")
                            .font(.system(size: 10))
                            .foregroundStyle(AppColors.textTertiary)
                        Text(choice.rightExample)
                            .appTextStyle(.monoSmall, color: AppColors.verdict(.clean))
                    }
                }

                Spacer()

                Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                    .foregroundStyle(isSelected ? AppColors.accentCrimson : AppColors.textTertiary)
                    .font(.system(size: 20))
            }
            .padding(.horizontal, AppSpacing.base)
            .padding(.vertical, AppSpacing.md)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(isSelected ? AppColors.accentCrimson.opacity(0.06) : AppColors.surfacePrimary)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(isSelected ? AppColors.accentCrimson.opacity(0.35) : AppColors.borderSubtle, lineWidth: 1)
            )
        }
        .buttonStyle(PressScaleButtonStyle())
    }
}

private struct OnboardingTestimonialCard: View {
    let quote: String
    let author: String

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.sm) {
            Text("\u{201C}\(quote)\u{201D}")
                .appTextStyle(.bodyMedium)
                .italic()
            Text("— \(author)")
                .appTextStyle(.labelSmall, color: AppColors.textTertiary)
        }
        .padding(AppSpacing.base)
        .frame(maxWidth: .infinity, alignment: .leading)
        .appCardStyle(cornerRadius: 14)
    }
}

private struct OnboardingStrictnessCard: View {
    let mode: StrictnessMode
    let isSelected: Bool
    let action: () -> Void

    private var icon: String {
        switch mode {
        case .lenient: "gauge.with.dots.needle.0percent"
        case .standard: "gauge.with.dots.needle.50percent"
        case .strict: "gauge.with.dots.needle.100percent"
        }
    }

    private var color: Color {
        switch mode {
        case .lenient: AppColors.verdict(.clean)
        case .standard: AppColors.accentGold
        case .strict: AppColors.accentCrimson
        }
    }

    private var tagline: String {
        L10n.text("onboarding.strictness.\(mode.rawValue).tag")
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.base) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundStyle(color)
                    .frame(width: 36)

                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: AppSpacing.sm) {
                        Text(mode.label)
                            .appTextStyle(.labelMedium)
                        if mode == .standard {
                            Text(L10n.text("onboarding.strictness.recommended"))
                                .appTextStyle(.monoBadge, color: AppColors.accentGold)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 2)
                                .background(AppColors.accentGold.opacity(0.12), in: Capsule())
                        }
                    }
                    Text(tagline)
                        .appTextStyle(.bodySmall, color: AppColors.textTertiary)
                }

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(color)
                        .font(.system(size: 20))
                }
            }
            .padding(.horizontal, AppSpacing.base)
            .padding(.vertical, AppSpacing.lg)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(isSelected ? color.opacity(0.08) : AppColors.surfacePrimary)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(isSelected ? color.opacity(0.4) : AppColors.borderSubtle, lineWidth: 1)
            )
        }
        .buttonStyle(PressScaleButtonStyle())
    }
}

private struct OnboardingThemeCard: View {
    let theme: AppThemePreference
    let isSelected: Bool
    let action: () -> Void

    private var icon: String {
        switch theme {
        case .system: "circle.lefthalf.filled"
        case .light: "sun.max.fill"
        case .dark: "moon.fill"
        }
    }

    var body: some View {
        Button(action: action) {
            VStack(spacing: AppSpacing.md) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(themePreviewBackground)
                        .frame(height: 100)
                        .overlay(
                            VStack(spacing: 6) {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(themePreviewText)
                                    .frame(width: 40, height: 6)
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(themePreviewText.opacity(0.5))
                                    .frame(width: 30, height: 4)
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(AppColors.accentCrimson)
                                    .frame(width: 36, height: 20)
                            }
                        )
                }

                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundStyle(isSelected ? AppColors.accentCrimson : AppColors.textSecondary)

                Text(theme.label)
                    .appTextStyle(.labelSmall)
            }
            .padding(AppSpacing.md)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(isSelected ? AppColors.accentCrimson.opacity(0.06) : AppColors.surfacePrimary)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(isSelected ? AppColors.accentCrimson.opacity(0.4) : AppColors.borderSubtle, lineWidth: 1)
            )
        }
        .buttonStyle(PressScaleButtonStyle())
    }

    private var themePreviewBackground: Color {
        switch theme {
        case .system: Color(hex: 0x1C1C21)
        case .light: Color(hex: 0xF7F7F8)
        case .dark: Color(hex: 0x101014)
        }
    }

    private var themePreviewText: Color {
        switch theme {
        case .system: Color(hex: 0xF0F0F4)
        case .light: Color(hex: 0x18181B)
        case .dark: Color(hex: 0xF0F0F4)
        }
    }
}

private struct OnboardingSummaryPill: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: AppSpacing.sm) {
            Image(systemName: icon)
                .font(.system(size: 14))
                .foregroundStyle(AppColors.accentCrimson)
            Text(text)
                .appTextStyle(.labelMedium)
        }
        .padding(.horizontal, AppSpacing.base)
        .padding(.vertical, AppSpacing.sm)
        .background(AppColors.surfaceSecondary, in: Capsule())
    }
}

private struct OnboardingWelcomeArtwork: View {
    @State private var scanning = false
    @State private var revealCrimes = false

    var body: some View {
        ZStack {
            // Background pulse
            Circle()
                .fill(AppGradients.scanPulse)
                .frame(width: 240, height: 240)
                .scaleEffect(scanning ? 1.1 : 0.9)

            VStack(spacing: 12) {
                // Sample text with underlines
                VStack(alignment: .leading, spacing: 8) {
                    markedTextRow("onboarding.welcome.artwork.line1", showCrime: revealCrimes)
                    markedTextRow("onboarding.welcome.artwork.line2", showCrime: revealCrimes)
                }
                .padding(16)
                .background(AppColors.surfaceSecondary, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(AppColors.borderSubtle, lineWidth: 1)
                )

                // Magnifying glass
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 44, weight: .bold))
                    .foregroundStyle(AppColors.accentCrimson)
                    .offset(x: scanning ? 30 : -30)
            }
        }
        .task {
            guard !AppMotion.isReduced else {
                scanning = true
                revealCrimes = true
                return
            }
            withAnimation(AppMotion.gentle.repeatForever(autoreverses: true)) {
                scanning = true
            }
            try? await Task.sleep(for: .seconds(0.6))
            withAnimation(AppMotion.standard) {
                revealCrimes = true
            }
        }
    }

    private func textRow(_ text: String, crimeAt: ClosedRange<Int>, showCrime: Bool) -> some View {
        HStack(spacing: 0) {
            Text(text)
                .appTextStyle(.monoSmall)
        }
        .overlay(alignment: .bottom) {
            if showCrime {
                let width = CGFloat(crimeAt.count) * 7.5
                let offset = CGFloat(crimeAt.lowerBound) * 7.5
                Rectangle()
                    .fill(AppColors.accentCrimson)
                    .frame(width: width, height: 2)
                    .offset(x: offset - CGFloat(text.count) * 3.75 + width / 2, y: 2)
                    .transition(.opacity)
            }
        }
    }

    private func markedTextRow(_ key: String, showCrime: Bool) -> some View {
        let markedText = L10n.text(key)
        let startMarker = "[["
        let endMarker = "]]"

        guard
            let start = markedText.range(of: startMarker),
            let end = markedText.range(of: endMarker),
            start.upperBound <= end.lowerBound
        else {
            return AnyView(textRow(markedText, crimeAt: 0...0, showCrime: false))
        }

        let prefix = String(markedText[..<start.lowerBound])
        let highlighted = String(markedText[start.upperBound..<end.lowerBound])
        let suffix = String(markedText[end.upperBound...])
        let displayText = prefix + highlighted + suffix

        let lowerBound = prefix.count
        let upperBound = max(lowerBound, lowerBound + highlighted.count - 1)

        return AnyView(textRow(displayText, crimeAt: lowerBound...upperBound, showCrime: showCrime))
    }
}

import SwiftUI
import TypographyDomain

public struct HeroActionCard: View {
    public let title: String
    public let subtitle: String
    public let badgeText: String
    public let action: () -> Void
    @State private var shimmerOffset: CGFloat = -220

    public init(title: String, subtitle: String, badgeText: String, action: @escaping () -> Void) {
        self.title = title
        self.subtitle = subtitle
        self.badgeText = badgeText
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(AppGradients.heroCard)

                GeometryReader { proxy in
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [.clear, .white.opacity(0.1), .clear],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: 90)
                        .rotationEffect(.degrees(-35))
                        .offset(x: shimmerOffset)
                        .onAppear {
                            guard !AppMotion.isReduced else { return }
                            withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: false)) {
                                shimmerOffset = proxy.size.width + 240
                            }
                        }
                }
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))

                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(AppColors.textInverse)
                        Text(title)
                            .appTextStyle(.titleLarge, color: AppColors.textInverse)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(AppColors.textInverse.opacity(0.55))
                    }

                    Text(subtitle)
                        .appTextStyle(.bodyMedium, color: AppColors.textInverse.opacity(0.8))

                    Spacer()

                    HStack {
                        Spacer()
                        Text(badgeText)
                            .appTextStyle(.labelSmall, color: AppColors.textInverse.opacity(0.75))
                            .padding(.horizontal, 12)
                            .frame(height: 20)
                            .overlay(Capsule().stroke(AppColors.textInverse.opacity(0.2), lineWidth: 1))
                    }
                }
                .padding(24)
            }
            .frame(height: 188)
        }
        .buttonStyle(PressScaleButtonStyle(scale: 0.975))
    }
}

public struct ScoreRingView: View {
    public let score: Int
    public let verdict: Verdict
    @State private var animatedScore: Int = 0
    @State private var progress: CGFloat = 0

    public init(score: Int, verdict: Verdict) {
        self.score = score
        self.verdict = verdict
    }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(AppColors.textInverse.opacity(0.12), lineWidth: 6)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(AppColors.verdict(verdict), style: StrokeStyle(lineWidth: 6, lineCap: .round))
                .rotationEffect(.degrees(-90))
            VStack(spacing: 2) {
                Text("\(animatedScore)")
                    .appTextStyle(.displayHero, color: AppColors.textInverse)
                    .monospacedDigit()
                Text("/100")
                    .appTextStyle(.bodySmall, color: AppColors.textInverse.opacity(0.55))
            }
        }
        .onAppear {
            guard !AppMotion.isReduced else {
                animatedScore = score
                progress = CGFloat(score) / 100
                return
            }
            withAnimation(.easeInOut(duration: 1.2)) {
                progress = CGFloat(score) / 100
            }
            let steps = max(score, 1)
            let interval = 1.0 / Double(steps)
            for step in 0 ... steps {
                DispatchQueue.main.asyncAfter(deadline: .now() + interval * Double(step)) {
                    animatedScore = min(step, score)
                }
            }
        }
    }
}

public struct CustomTabItem: Identifiable, Hashable {
    public let id: String
    public let title: String
    public let systemName: String

    public init(id: String, title: String, systemName: String) {
        self.id = id
        self.title = title
        self.systemName = systemName
    }
}

public struct CustomTabBar: View {
    public let items: [CustomTabItem]
    public let selectedID: String
    public let onSelect: (String) -> Void

    public init(items: [CustomTabItem], selectedID: String, onSelect: @escaping (String) -> Void) {
        self.items = items
        self.selectedID = selectedID
        self.onSelect = onSelect
    }

    public var body: some View {
        HStack {
            ForEach(items) { item in
                let active = item.id == selectedID
                Button {
                    onSelect(item.id)
                } label: {
                    VStack(spacing: 2) {
                        Image(systemName: item.systemName)
                            .font(.system(size: 22, weight: .medium))
                        Text(item.title.uppercased())
                            .appTextStyle(.labelSmall, color: active ? AppColors.accentCrimson : AppColors.textTertiary)
                        Circle()
                            .fill(AppColors.accentCrimson)
                            .frame(width: 4, height: 4)
                            .scaleEffect(active ? 1 : 0.001)
                            .opacity(active ? 1 : 0)
                    }
                    .foregroundStyle(active ? AppColors.accentCrimson : AppColors.textTertiary)
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(PressScaleButtonStyle(scale: 0.94))
            }
        }
        .padding(.horizontal, 12)
        .padding(.top, 10)
        .padding(.bottom, 6)
        .background(.ultraThinMaterial)
        .overlay(Rectangle().fill(AppColors.borderSubtle).frame(height: 0.5), alignment: .top)
    }
}

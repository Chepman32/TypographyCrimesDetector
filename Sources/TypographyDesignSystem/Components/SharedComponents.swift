import SwiftUI
import TypographyDomain

public struct SeverityBadgeView: View {
    private let label: String
    private let color: Color

    public init(verdict: Verdict) {
        self.label = verdict.label
        self.color = AppColors.verdict(verdict)
    }

    public init(severity: CrimeSeverity) {
        self.label = severity.label
        self.color = AppColors.severity(severity)
    }

    public var body: some View {
        Text(label)
            .appTextStyle(.labelSmall, color: color)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(color.opacity(0.15), in: Capsule())
            .overlay(Capsule().stroke(color.opacity(0.4), lineWidth: 1))
    }
}

public struct EmptyStateView: View {
    public let symbolName: String
    public let title: String
    public let subtitle: String
    public let buttonTitle: String?
    public let action: (() -> Void)?

    public init(
        symbolName: String,
        title: String,
        subtitle: String,
        buttonTitle: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.symbolName = symbolName
        self.title = title
        self.subtitle = subtitle
        self.buttonTitle = buttonTitle
        self.action = action
    }

    public var body: some View {
        VStack(spacing: 12) {
            Image(systemName: symbolName)
                .font(.system(size: 48, weight: .medium))
                .foregroundStyle(AppColors.textTertiary.opacity(0.45))

            Text(title)
                .appTextStyle(.titleMedium, color: AppColors.textTertiary)

            Text(subtitle)
                .appTextStyle(.bodyMedium, color: AppColors.textTertiary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 280)

            if let buttonTitle, let action {
                Button(buttonTitle, action: action)
                    .appTextStyle(.labelLarge, color: AppColors.accentCrimson)
                    .padding(.horizontal, 22)
                    .frame(height: 44)
                    .overlay(Capsule().stroke(AppColors.accentCrimson, lineWidth: 1))
                    .buttonStyle(PressScaleButtonStyle())
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity)
    }
}

public struct EvidenceSnippetView: View {
    public let instance: CrimeInstance

    public init(instance: CrimeInstance) {
        self.instance = instance
    }

    public var body: some View {
        Text(instance.contextSnippet)
            .appTextStyle(.monoBody)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            .background(AppColors.surfaceEvidence, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(AppColors.accentCrimson.opacity(0.2), lineWidth: 1)
            )
    }
}

public struct FixSuggestionView: View {
    public let suggestion: String
    public let action: (() -> Void)?

    public init(suggestion: String, action: (() -> Void)? = nil) {
        self.suggestion = suggestion
        self.action = action
    }

    public var body: some View {
        Group {
            if let action {
                Button(action: action) {
                    content
                }
                .buttonStyle(PressScaleButtonStyle(scale: 0.98))
                .accessibilityHint(L10n.text("report.copy_fixed_hint"))
            } else {
                content
            }
        }
    }

    private var content: some View {
        HStack(spacing: 8) {
            Image(systemName: "arrow.right")
                .foregroundStyle(AppColors.accentTeal)

            Text(suggestion)
                .appTextStyle(.monoBody, color: AppColors.accentTeal)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(8)
        .background(AppColors.accentTeal.opacity(0.08), in: RoundedRectangle(cornerRadius: 8, style: .continuous))
        .contentShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

public struct GlassCircleButton: View {
    public let systemName: String
    public let action: () -> Void

    public init(systemName: String, action: @escaping () -> Void) {
        self.systemName = systemName
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(AppColors.textPrimary)
                .frame(width: 36, height: 36)
                .background(.ultraThinMaterial, in: Circle())
                .overlay(Circle().stroke(AppColors.borderSubtle.opacity(0.35), lineWidth: 1))
        }
        .buttonStyle(PressScaleButtonStyle(scale: 0.94))
    }
}

public struct ToastView: View {
    public let symbolName: String
    public let message: String

    public init(symbolName: String, message: String) {
        self.symbolName = symbolName
        self.message = message
    }

    public var body: some View {
        HStack(spacing: 8) {
            Image(systemName: symbolName)
                .foregroundStyle(AppColors.textInverse)
            Text(message)
                .appTextStyle(.bodyMedium, color: AppColors.textInverse)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background(AppColors.surfaceReport, in: Capsule())
        .appShadow(AppShadow.high)
    }
}

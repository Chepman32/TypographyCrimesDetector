import SwiftUI
import TypographyDesignSystem
import TypographyDomain

public struct CrimeReportScreen: View {
    @Environment(TypographyAppState.self) private var appState
    @Environment(\.dismiss) private var dismiss

    public let report: CrimeReport
    public let allowsNewScan: Bool
    @State private var expandedTypes: Set<CrimeType> = []
    @State private var sharePresented = false

    public init(report: CrimeReport, allowsNewScan: Bool) {
        self.report = report
        self.allowsNewScan = allowsNewScan
    }

    public var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                reportHeader

                VStack(alignment: .leading, spacing: 16) {
                    if report.score == 0 {
                        cleanState
                    } else {
                        Text("Crime Breakdown")
                            .appTextStyle(.titleLarge)
                        ForEach(report.groupedCrimes, id: \.crimeType) { summary in
                            CrimeBreakdownCard(
                                summary: summary,
                                expanded: expandedTypes.contains(summary.crimeType),
                                onToggle: {
                                    withAnimation(AppMotion.standard) {
                                        if expandedTypes.contains(summary.crimeType) {
                                            expandedTypes.remove(summary.crimeType)
                                        } else {
                                            expandedTypes.insert(summary.crimeType)
                                        }
                                    }
                                }
                            )
                        }
                    }

                    if !report.notes.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(report.notes) { note in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: note.kind == .warning ? "info.circle.fill" : "checkmark.circle")
                                        .foregroundStyle(note.kind == .warning ? AppColors.accentGold : AppColors.accentTeal)
                                    Text(note.message)
                                        .appTextStyle(.bodySmall, color: AppColors.textSecondary)
                                }
                            }
                        }
                        .padding(16)
                        .appCardStyle(cornerRadius: 14)
                    }
                }
                .padding(.horizontal, AppSpacing.lg)
                .padding(.top, 24)
                .padding(.bottom, 120)
                .background(AppColors.surfaceBase)
            }
        }
        .background(AppColors.surfaceBase.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .appHiddenNavigationBar()
        .safeAreaInset(edge: .bottom) {
            HStack(spacing: 12) {
                Button {
                    sharePresented = true
                } label: {
                    Label("Share Report", systemImage: "square.and.arrow.up")
                        .appTextStyle(.labelLarge, color: AppColors.textInverse)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(AppColors.accentCrimson, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
                .buttonStyle(PressScaleButtonStyle())

                Button {
                    dismiss()
                } label: {
                    Label(allowsNewScan ? "New Scan" : "Close Report", systemImage: allowsNewScan ? "magnifyingglass" : "xmark")
                        .appTextStyle(.labelLarge)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(AppColors.surfaceSecondary, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
                .buttonStyle(PressScaleButtonStyle())
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.top, 12)
            .padding(.bottom, 8)
            .background(.ultraThinMaterial)
        }
        .sheet(isPresented: $sharePresented) {
            ReportShareSheet(report: report)
        }
    }

    private var reportHeader: some View {
        ZStack(alignment: .top) {
            AppGradients.reportBackground
                .frame(height: 420)
                .overlay(alignment: .top) {
                    HStack {
                        GlassCircleButton(systemName: "xmark") { dismiss() }
                        Spacer()
                        GlassCircleButton(systemName: "square.and.arrow.up") { sharePresented = true }
                    }
                    .padding(.horizontal, AppSpacing.lg)
                    .padding(.top, 12)
                }

            VStack(spacing: 20) {
                Spacer().frame(height: 72)
                ScoreRingView(score: report.score, verdict: report.verdict)
                    .frame(width: 140, height: 140)
                SeverityBadgeView(verdict: report.verdict)
                Text("\(report.crimeCount) crimes detected across \(report.categoryCount) categories")
                    .appTextStyle(.bodyMedium, color: AppColors.textInverse.opacity(0.72))
                Text(report.previewText)
                    .appTextStyle(.monoSmall, color: AppColors.textInverse.opacity(0.52))
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .background(AppColors.textInverse.opacity(0.06), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .padding(.horizontal, 24)
            }
            .frame(maxWidth: .infinity)
        }
    }

    private var cleanState: some View {
        VStack(spacing: 12) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 56))
                .foregroundStyle(AppColors.accentTeal)
            Text("Spotless")
                .appTextStyle(.displayLarge, color: AppColors.accentTeal)
            Text(report.notes.first?.message ?? "No typographic crimes were detected. This text is a model citizen.")
                .appTextStyle(.bodyLarge, color: AppColors.textSecondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
    }
}

private struct CrimeBreakdownCard: View {
    let summary: CrimeSummary
    let expanded: Bool
    let onToggle: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: onToggle) {
                HStack(spacing: 12) {
                    Image(systemName: summary.crimeType.symbolName)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(AppColors.severity(summary.severity))
                        .frame(width: 24)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(summary.crimeType.displayName)
                            .appTextStyle(.titleMedium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(summary.count) violation\(summary.count == 1 ? "" : "s")")
                            .appTextStyle(.bodySmall, color: AppColors.textSecondary)
                    }
                    SeverityBadgeView(severity: summary.severity)
                    Image(systemName: expanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(AppColors.textTertiary)
                }
                .padding(16)
            }
            .buttonStyle(.plain)

            if expanded {
                Divider().overlay(AppColors.borderSubtle)
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(summary.instances) { instance in
                        VStack(alignment: .leading, spacing: 8) {
                            EvidenceSnippetView(instance: instance)
                            HStack {
                                Text("line \(instance.location.line), col \(instance.location.column)")
                                    .appTextStyle(.monoSmall, color: AppColors.textTertiary)
                                Spacer()
                            }
                            FixSuggestionView(suggestion: instance.suggestedFix)
                        }
                    }

                    NavigationLink {
                        CrimeDetailView(crimeType: summary.crimeType)
                    } label: {
                        Text("Learn more about this crime →")
                            .appTextStyle(.labelMedium, color: AppColors.accentCrimson)
                    }
                }
                .padding(16)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .appCardStyle(cornerRadius: 14)
    }
}

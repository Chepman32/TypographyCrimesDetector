import SwiftUI
import TypographyDesignSystem
import TypographyDomain

public struct CrimeReportScreen: View {
    @Environment(TypographyAppState.self) private var appState
    @Environment(\.dismiss) private var dismiss

    public let allowsNewScan: Bool
    @State private var currentReport: CrimeReport
    @State private var expandedTypes: Set<CrimeType> = []
    @State private var sharePresented = false
    @State private var applyingFixID: UUID?
    @State private var dismissingInstanceIDs: Set<UUID> = []

    public init(report: CrimeReport, allowsNewScan: Bool) {
        self.allowsNewScan = allowsNewScan
        _currentReport = State(initialValue: report)
    }

    public var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                reportHeader

                VStack(alignment: .leading, spacing: 16) {
                    if currentReport.score == 0 {
                        cleanState
                    } else {
                        Text(L10n.text("report.breakdown"))
                            .appTextStyle(.titleLarge)
                        ForEach(currentReport.groupedCrimes, id: \.crimeType) { summary in
                            CrimeBreakdownCard(
                                summary: summary,
                                expanded: expandedTypes.contains(summary.crimeType),
                                applyingFixID: applyingFixID,
                                dismissingInstanceIDs: dismissingInstanceIDs,
                                suggestionText: suggestionText(for:),
                                onApplyFix: { instance in
                                    Task { await applyFix(for: instance) }
                                },
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

                    if !currentReport.notes.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(currentReport.notes) { note in
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
                    Label(L10n.text("report.share"), systemImage: "square.and.arrow.up")
                        .appTextStyle(.labelLarge, color: AppColors.textInverse)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(AppColors.accentCrimson, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
                .buttonStyle(PressScaleButtonStyle())

                Button {
                    dismiss()
                } label: {
                    Label(allowsNewScan ? L10n.text("report.new_scan") : L10n.text("report.close"), systemImage: allowsNewScan ? "magnifyingglass" : "xmark")
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
            ReportShareSheet(report: currentReport)
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
                ScoreRingView(score: currentReport.score, verdict: currentReport.verdict)
                    .frame(width: 140, height: 140)
                SeverityBadgeView(verdict: currentReport.verdict)
                Text(L10n.crimeCountSummary(crimes: currentReport.crimeCount, categories: currentReport.categoryCount))
                    .appTextStyle(.bodyMedium, color: AppColors.textInverse.opacity(0.72))
                Text(currentReport.previewText)
                    .appTextStyle(.monoSmall, color: AppColors.textInverse.opacity(0.52))
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .background(AppColors.textInverse.opacity(0.06), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .padding(.horizontal, 24)

                Button(action: copyFixedText) {
                    Label(L10n.text("report.copy_fixed"), systemImage: "doc.on.doc")
                        .appTextStyle(.labelLarge, color: AppColors.textInverse)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(AppColors.textInverse.opacity(0.08), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .stroke(AppColors.textInverse.opacity(0.14), lineWidth: 1)
                        )
                }
                .buttonStyle(PressScaleButtonStyle(scale: 0.97))
                .padding(.horizontal, 24)
                .accessibilityHint(L10n.text("report.copy_fixed_hint"))
            }
            .frame(maxWidth: .infinity)
        }
    }

    private var cleanState: some View {
        VStack(spacing: 12) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 56))
                .foregroundStyle(AppColors.accentTeal)
            Text(L10n.text("report.clean_title"))
                .appTextStyle(.displayLarge, color: AppColors.accentTeal)
            Text(currentReport.notes.first?.message ?? L10n.text("report.clean_body"))
                .appTextStyle(.bodyLarge, color: AppColors.textSecondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
    }

    private func suggestionText(for instance: CrimeInstance) -> String {
        switch instance.crimeType {
        case .doubleSpace:
            L10n.text("report.replace_single_space")
        case .inconsistentSpacing:
            L10n.text("report.replace_single_space")
        default:
            instance.suggestedFix
        }
    }

    private func replacementText(for instance: CrimeInstance) -> String? {
        switch instance.crimeType {
        case .doubleSpace, .inconsistentSpacing:
            return " "
        case .straightQuotes, .fakeEllipsis, .primeMarks, .multiplicationSign, .trademarkSymbol, .repeatedPunctuation:
            return replacementToken(from: instance.suggestedFix)
        case .hyphenAsDash:
            return replacementToken(from: instance.suggestedFix)?.trimmingCharacters(in: .whitespacesAndNewlines)
        case .widow, .orphan, .comicSans:
            return nil
        }
    }

    private func replacementToken(from suggestion: String) -> String? {
        L10n.replacementToken(from: suggestion)
    }

    private func copyFixedText() {
        appState.platform.copyText(currentReport.analyzedText)
        appState.platform.emitHaptic(.success)
        appState.postToast(
            .init(
                symbolName: "doc.on.doc",
                message: L10n.text("report.fixed_text_copied"),
                tone: .success
            )
        )
    }

    @MainActor
    private func applyFix(for instance: CrimeInstance) async {
        guard applyingFixID == nil else { return }
        guard let replacement = replacementText(for: instance) else {
            appState.postToast(
                .init(
                    symbolName: "exclamationmark.triangle.fill",
                    message: L10n.text("report.manual_rewrite"),
                    tone: .warning
                )
            )
            return
        }

        let range = NSRange(
            location: instance.location.startOffset,
            length: max(0, instance.location.endOffset - instance.location.startOffset)
        )

        let mutableText = NSMutableString(string: currentReport.analyzedText)
        let safeRange = normalized(range: range, maxLength: mutableText.length)
        guard safeRange.length > 0 || instance.crimeType == .doubleSpace || instance.crimeType == .inconsistentSpacing else {
            appState.postToast(
                .init(
                    symbolName: "exclamationmark.triangle.fill",
                    message: L10n.text("report.apply_failed"),
                    tone: .warning
                )
            )
            return
        }

        applyingFixID = instance.id
        _ = withAnimation(AppMotion.dismissive) {
            dismissingInstanceIDs.insert(instance.id)
        }
        try? await Task.sleep(for: .milliseconds(240))
        mutableText.replaceCharacters(in: safeRange, with: replacement)

        var updatedReport = await appState.engine.analyze(
            SubmittedEvidence(text: mutableText as String),
            preferences: appState.preferences
        )
        updatedReport.id = currentReport.id
        updatedReport.createdAt = currentReport.createdAt

        appState.save(report: updatedReport)
        withAnimation(AppMotion.dismissive) {
            currentReport = updatedReport
            expandedTypes.formIntersection(Set(updatedReport.groupedCrimes.map(\.crimeType)))
            dismissingInstanceIDs.removeAll()
        }
        applyingFixID = nil
        appState.platform.emitHaptic(.success)
        appState.postToast(
            .init(
                symbolName: "checkmark.circle.fill",
                message: L10n.text("report.issue_fixed"),
                tone: .success
            )
        )
    }

    private func normalized(range: NSRange, maxLength: Int) -> NSRange {
        let location = max(0, min(range.location, maxLength))
        let upperBound = max(location, min(range.location + range.length, maxLength))
        return NSRange(location: location, length: upperBound - location)
    }
}

private struct CrimeBreakdownCard: View {
    let summary: CrimeSummary
    let expanded: Bool
    let applyingFixID: UUID?
    let dismissingInstanceIDs: Set<UUID>
    let suggestionText: (CrimeInstance) -> String
    let onApplyFix: (CrimeInstance) -> Void
    let onToggle: () -> Void

    private var visibleInstances: [CrimeInstance] {
        summary.instances.filter { !dismissingInstanceIDs.contains($0.id) }
    }

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
                        Text(L10n.violationCountSummary(visibleInstances.count))
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
                    ForEach(visibleInstances) { instance in
                        CrimeInstanceRow(
                            instance: instance,
                            suggestion: suggestionText(instance),
                            isBusy: applyingFixID != nil && applyingFixID != instance.id,
                            onApplyFix: L10n.replacementToken(from: instance.suggestedFix) != nil || instance.crimeType == .doubleSpace || instance.crimeType == .inconsistentSpacing
                                ? { onApplyFix(instance) }
                                : nil
                        )
                        .id(instance.id)
                        .transition(
                            .asymmetric(
                                insertion: .opacity.combined(with: .scale(scale: 0.98)),
                                removal: .move(edge: .trailing)
                                    .combined(with: .opacity)
                                    .combined(with: .scale(scale: 0.9))
                            )
                        )
                    }

                    NavigationLink {
                        CrimeDetailView(crimeType: summary.crimeType)
                    } label: {
                        Text(L10n.text("report.learn_more"))
                            .appTextStyle(.labelMedium, color: AppColors.accentCrimson)
                    }
                }
                .padding(16)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .appCardStyle(cornerRadius: 14)
        .animation(AppMotion.dismissive, value: visibleInstances.map(\.id))
        .transition(
            .asymmetric(
                insertion: .opacity.combined(with: .move(edge: .bottom)),
                removal: .move(edge: .trailing).combined(with: .opacity)
            )
        )
    }
}

private struct CrimeInstanceRow: View {
    let instance: CrimeInstance
    let suggestion: String
    let isBusy: Bool
    let onApplyFix: (() -> Void)?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            EvidenceSnippetView(instance: instance)
            HStack {
                Text(L10n.lineColumnSummary(line: instance.location.line, column: instance.location.column))
                    .appTextStyle(.monoSmall, color: AppColors.textTertiary)
                Spacer()
            }
            FixSuggestionView(suggestion: suggestion, action: onApplyFix)
                .opacity(isBusy ? 0.6 : 1)
                .allowsHitTesting(!isBusy)
        }
    }
}

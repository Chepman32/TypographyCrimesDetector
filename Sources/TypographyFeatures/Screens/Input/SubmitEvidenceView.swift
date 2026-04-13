import SwiftUI
import TypographyDesignSystem
import TypographyDomain

private struct AnalysisRequest: Identifiable, Hashable {
    let id = UUID()
    let evidence: SubmittedEvidence
}

public struct SubmitEvidenceView: View {
    @Environment(TypographyAppState.self) private var appState
    @FocusState private var isEditorFocused: Bool
    @State private var text = ""
    @State private var method: InputMethod = .paste
    @State private var cameraSheetVisible = false
    @State private var analysisRequest: AnalysisRequest?
    @State private var pastedFontRuns: [FontRunMetadata] = []
    @State private var pastedSource: EvidenceSource = .typed

    public init() {}

    public enum InputMethod: String, CaseIterable, Identifiable {
        case paste
        case camera

        public var id: String { rawValue }
        var label: String {
            switch self {
            case .paste: L10n.text("input.method.paste")
            case .camera: L10n.text("input.method.camera")
            }
        }
    }

    public var body: some View {
        ZStack(alignment: .top) {
            AppColors.surfaceBase.ignoresSafeArea()

            VStack(spacing: 16) {
                Picker(L10n.text("input.method"), selection: $method) {
                    ForEach(InputMethod.allCases) { item in
                        Text(item.label).tag(item)
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: method) { _, newValue in
                    if newValue == .camera {
                        method = .paste
                        cameraSheetVisible = true
                    }
                }

                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(AppColors.surfaceSecondary)

                    TextEditor(text: $text)
                        .scrollContentBackground(.hidden)
                        .padding(12)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.clear)
                        .appTextStyle(.monoBody)
                        .focused($isEditorFocused)
                        .overlay(alignment: .topLeading) {
                            if text.isEmpty {
                                Text(L10n.text("input.placeholder"))
                                    .appTextStyle(.bodyLarge, color: AppColors.textTertiary.opacity(0.55))
                                    .padding(.top, 20)
                                    .padding(.leading, 18)
                                    .allowsHitTesting(false)
                            }
                        }
                        .overlay(alignment: .bottomTrailing) {
                            Text(L10n.characterCountSummary(text.count))
                                .appTextStyle(
                                    .monoSmall,
                                    color: text.count > 100_000 ? AppColors.accentCrimson : (text.count > 50_000 ? AppColors.accentGold : AppColors.textTertiary)
                                )
                                .padding(16)
                        }

                    if text.isEmpty {
                        Button {
                            pasteFromClipboard()
                        } label: {
                            HStack(spacing: 8) {
                                Image(systemName: "doc.on.clipboard")
                                Text(L10n.text("input.paste_from_clipboard"))
                            }
                            .appTextStyle(.labelLarge, color: AppColors.textInverse)
                            .padding(.horizontal, 24)
                            .frame(height: 48)
                            .background(AppColors.accentCrimson, in: Capsule())
                            .appShadow(AppShadow.medium)
                        }
                        .buttonStyle(PressScaleButtonStyle(scale: 0.96))
                        .padding(.top, 28)
                    }
                }
                .frame(maxHeight: .infinity)
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.top, 12)
        }
        .navigationTitle(L10n.text("input.title"))
        .appInlineNavigationTitle()
        .toolbar {
            ToolbarItem(placement: .appPrimaryAction) {
                Button(L10n.text("input.analyze")) {
                    startAnalysis()
                }
                .disabled(text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                .foregroundStyle(text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? AppColors.textTertiary : AppColors.accentCrimson)
            }

            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button(L10n.text("general.done")) {
                    isEditorFocused = false
                }
                .foregroundStyle(AppColors.accentCrimson)
            }
        }
        .safeAreaInset(edge: .bottom) {
            Button {
                startAnalysis()
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                    Text(L10n.text("input.analyze_evidence"))
                }
                .appTextStyle(.labelLarge, color: canAnalyze ? AppColors.textInverse : AppColors.textTertiary)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(canAnalyze ? AppColors.accentCrimson : AppColors.surfaceTertiary, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            }
            .buttonStyle(PressScaleButtonStyle())
            .padding(.horizontal, AppSpacing.lg)
            .padding(.top, 12)
            .padding(.bottom, 8)
            .background(.ultraThinMaterial)
        }
        .sheet(isPresented: $cameraSheetVisible) {
            NavigationStack {
                VStack(spacing: 18) {
                    Image(systemName: "camera.viewfinder")
                        .font(.system(size: 40, weight: .medium))
                        .foregroundStyle(AppColors.textTertiary)
                    Text(L10n.text("general.coming_soon"))
                        .appTextStyle(.titleMedium)
                    Text(L10n.text("input.camera_message"))
                        .appTextStyle(.bodyMedium, color: AppColors.textSecondary)
                        .multilineTextAlignment(.center)
                    Button(L10n.text("general.got_it")) { cameraSheetVisible = false }
                        .appTextStyle(.labelLarge, color: AppColors.textInverse)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(AppColors.accentCrimson, in: Capsule())
                }
                .padding(24)
                .presentationDetents([.medium])
            }
        }
        .navigationDestination(item: $analysisRequest) { request in
            AnalysisSessionView(evidence: request.evidence)
        }
        .onChange(of: text) { _, newValue in
            if newValue.count > 100_000 {
                text = String(newValue.prefix(100_000))
                appState.postToast(.init(symbolName: "exclamationmark.triangle.fill", message: L10n.text("input.trimmed_warning"), tone: .warning))
            }
        }
    }

    private var canAnalyze: Bool {
        !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    private func pasteFromClipboard() {
        guard let snapshot = appState.platform.readClipboard(), !snapshot.text.isEmpty else {
            appState.postToast(.init(symbolName: "doc.on.clipboard", message: L10n.text("input.clipboard_empty"), tone: .warning))
            return
        }
        text = snapshot.text
        pastedFontRuns = snapshot.fontRuns
        pastedSource = snapshot.source
        appState.platform.emitHaptic(.paste)
        appState.platform.playSound(.paste)
    }

    private func startAnalysis() {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            appState.postToast(.init(symbolName: "exclamationmark.triangle.fill", message: L10n.text("input.no_text"), tone: .warning))
            return
        }

        analysisRequest = AnalysisRequest(
            evidence: SubmittedEvidence(
                text: text,
                fontRuns: pastedFontRuns,
                source: pastedSource == .typed ? .typed : pastedSource
            )
        )
    }
}

import SwiftUI
import TypographyDesignSystem
import TypographyDomain
import TypographyEngine

public struct AnalysisSessionView: View {
    @Environment(TypographyAppState.self) private var appState
    let evidence: SubmittedEvidence
    @State private var state: SessionState = .loading
    @State private var progressValue: Double = 0.05
    @State private var statusMessage = "Scanning for typographic evidence…"
    @State private var errorMessage: String?

    public init(evidence: SubmittedEvidence) {
        self.evidence = evidence
    }

    private enum SessionState {
        case loading
        case mugshot(CrimeReport)
        case report(CrimeReport)
        case failed
    }

    public var body: some View {
        Group {
            switch state {
            case .loading:
                ForensicScanView(
                    statusMessage: statusMessage,
                    characterCount: evidence.text.count,
                    progressValue: evidence.text.count > 10_000 ? progressValue : nil
                )
            case let .mugshot(report):
                ComicSansMugshotView {
                    withAnimation(AppMotion.standard) {
                        state = .report(report)
                    }
                }
            case let .report(report):
                CrimeReportScreen(report: report, allowsNewScan: true)
            case .failed:
                analysisFailure
            }
        }
        .navigationBarBackButtonHidden(true)
        .task {
            guard case .loading = state else { return }
            await runAnalysis()
        }
    }

    private var analysisFailure: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 48))
                .foregroundStyle(AppColors.accentGold)
            Text("Analysis Failed")
                .appTextStyle(.titleLarge)
            Text(errorMessage ?? "Something went wrong during the forensic scan. Please try again.")
                .appTextStyle(.bodyMedium, color: AppColors.textSecondary)
                .multilineTextAlignment(.center)
            Button("Retry") {
                state = .loading
                Task { await runAnalysis() }
            }
            .appTextStyle(.labelLarge, color: AppColors.textInverse)
            .frame(maxWidth: 260)
            .frame(height: 48)
            .background(AppColors.accentCrimson, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.surfaceBase.ignoresSafeArea())
    }

    private func runAnalysis() async {
        appState.platform.playSound(.analysisStart)
        let statusMessages = [
            "Scanning for typographic evidence…",
            "Analyzing quotation mark integrity…",
            "Checking dash authenticity…",
            "Inspecting ellipsis legitimacy…",
            "Measuring spatial consistency…",
            "Hunting for widows and orphans…",
            "Running Comic Sans facial recognition…",
            "Compiling crime report…",
        ]

        var messageIndex = 0

        let report = await appState.engine.analyze(evidence, preferences: appState.preferences) { progress in
            Task { @MainActor in
                switch progress {
                case let .preparing(total):
                    progressValue = total > 0 ? 0.05 : 0.8
                case let .detectorFinished(index, total, _):
                    progressValue = total > 0 ? Double(index) / Double(total) : 0.85
                    messageIndex = min(messageIndex + 1, statusMessages.count - 2)
                    statusMessage = statusMessages[messageIndex]
                case .compiling:
                    progressValue = 0.96
                    statusMessage = statusMessages.last ?? "Compiling crime report…"
                }
            }
        }

        appState.save(report: report)
        appState.platform.emitHaptic(.analysisComplete)
        appState.platform.playSound(.analysisComplete)

        let hasComicSans = report.groupedCrimes.contains(where: { $0.crimeType == .comicSans })
        if hasComicSans && appState.preferences.isEnabled(.comicSans) {
            withAnimation(AppMotion.gentle) {
                state = .mugshot(report)
            }
        } else {
            withAnimation(AppMotion.gentle) {
                state = .report(report)
            }
        }
    }
}

public struct ForensicScanView: View {
    let statusMessage: String
    let characterCount: Int
    let progressValue: Double?
    @State private var spin = false
    @State private var pulse = false

    public init(statusMessage: String, characterCount: Int, progressValue: Double?) {
        self.statusMessage = statusMessage
        self.characterCount = characterCount
        self.progressValue = progressValue
    }

    public var body: some View {
        ZStack {
            AppColors.surfaceReport.ignoresSafeArea()
            VStack(spacing: 40) {
                ZStack {
                    Circle()
                        .trim(from: 0.08, to: 0.82)
                        .stroke(AppColors.accentCrimson.opacity(0.4), style: StrokeStyle(lineWidth: 3, lineCap: .round))
                        .frame(width: 160, height: 160)
                        .rotationEffect(.degrees(spin ? 360 : 0))
                    Circle()
                        .stroke(AppColors.accentCrimson.opacity(pulse ? 0.08 : 0.2), lineWidth: 2)
                        .frame(width: 120, height: 120)
                        .scaleEffect(pulse ? 1.08 : 0.92)
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundStyle(AppColors.textInverse)
                        .offset(y: pulse ? -3 : 3)
                }

                VStack(spacing: 8) {
                    Text(statusMessage)
                        .appTextStyle(.bodyLarge, color: AppColors.textInverse.opacity(0.82))
                    Text("Examining \(characterCount.formatted()) characters")
                        .appTextStyle(.monoSmall, color: AppColors.textInverse.opacity(0.45))
                }

                if let progressValue {
                    VStack(spacing: 12) {
                        ProgressView(value: progressValue)
                            .tint(AppColors.accentCrimson)
                            .frame(width: 220)
                        Text("\(Int(progressValue * 100))%")
                            .appTextStyle(.monoSmall, color: AppColors.textInverse.opacity(0.5))
                    }
                }
            }
            .padding(24)
        }
        .task {
            guard !AppMotion.isReduced else { return }
            withAnimation(.linear(duration: 1.8).repeatForever(autoreverses: false)) { spin = true }
            withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) { pulse = true }
        }
    }
}

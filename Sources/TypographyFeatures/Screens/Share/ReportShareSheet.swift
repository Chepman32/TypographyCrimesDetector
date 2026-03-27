import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import TypographyDesignSystem
import TypographyDomain

public struct ReportShareSheet: View {
    @Environment(TypographyAppState.self) private var appState
    let report: CrimeReport
    @State private var format: ShareFormat = .image
    @State private var showPhotosPermissionAlert = false

    public init(report: CrimeReport) {
        self.report = report
    }

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(AppColors.textTertiary.opacity(0.35))
                        .frame(width: 36, height: 5)
                        .padding(.top, 8)

                    Text("Share Crime Report")
                        .appTextStyle(.titleLarge)

                    SharePreviewCard(
                        report: report,
                        format: format,
                        websiteHost: websiteHost
                    )
                        .frame(maxWidth: .infinity)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(ShareFormat.allCases, id: \.id) { item in
                                Button {
                                    format = item
                                } label: {
                                    VStack(spacing: 8) {
                                        Image(systemName: item.symbolName)
                                            .font(.system(size: 24, weight: .medium))
                                        Text(item.label)
                                            .appTextStyle(.bodySmall, color: format == item ? AppColors.accentCrimson : AppColors.textSecondary)
                                            .multilineTextAlignment(.center)
                                    }
                                    .padding(12)
                                    .frame(width: 88, height: 88)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                                            .fill(format == item ? AppColors.accentCrimson.opacity(0.08) : AppColors.surfaceSecondary)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                                            .stroke(format == item ? AppColors.accentCrimson : AppColors.borderSubtle, lineWidth: format == item ? 1.5 : 1)
                                    )
                                }
                                .buttonStyle(PressScaleButtonStyle())
                            }
                        }
                        .padding(.horizontal, AppSpacing.lg)
                    }

                    Button {
                        Task { await shareSelected() }
                    } label: {
                        Label(primaryActionTitle, systemImage: primaryActionSymbol)
                            .appTextStyle(.labelLarge, color: AppColors.textInverse)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(AppColors.accentCrimson, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    }
                    .buttonStyle(PressScaleButtonStyle())

                    VStack(spacing: 12) {
                        secondaryAction(title: "Copy Report Image", systemName: "doc.on.doc") {
                            Task { await copyImage() }
                        }
                        secondaryAction(title: "Save to Photos", systemName: "photo.on.rectangle") {
                            Task { await saveImage() }
                        }
                        secondaryAction(title: "Copy Report Text", systemName: "doc.text") {
                            appState.platform.copyText(report.shareText)
                            appState.postToast(.init(symbolName: "doc.on.doc", message: "Copied to clipboard ✓", tone: .success))
                        }
                    }
                }
                .padding(.horizontal, AppSpacing.lg)
                .padding(.bottom, 32)
            }
            .background(AppColors.surfaceBase.ignoresSafeArea())
        }
        .alert("Photos Access Needed", isPresented: $showPhotosPermissionAlert) {
            Button("Open Settings") {
                appState.platform.openSettings()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Photos access is needed to save the report image. Open Settings to grant access.")
        }
    }

    private func secondaryAction(title: String, systemName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Label(title, systemImage: systemName)
                    .appTextStyle(.bodyMedium)
                Spacer()
            }
            .padding(.horizontal, 12)
            .frame(height: 48)
            .background(AppColors.surfaceSecondary, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
        .buttonStyle(PressScaleButtonStyle())
    }

    private var websiteHost: String {
        appState.releaseConfig.appWebsiteURL.host ?? appState.releaseConfig.appWebsiteURL.absoluteString
    }

    private var primaryActionTitle: String {
        switch format {
        case .text:
            "Share Text"
        case .link:
            "Copy Link"
        default:
            "Share"
        }
    }

    private var primaryActionSymbol: String {
        format == .link ? "link" : "square.and.arrow.up"
    }

    private var exportReadyFormat: ShareFormat {
        switch format {
        case .text, .link:
            .image
        default:
            format
        }
    }

    @MainActor
    private func shareSelected() async {
        appState.platform.playSound(.share)
        switch format {
        case .text:
            appState.platform.share(SharePayload(items: [.text(report.shareText)]))
        case .link:
            let url = appState.releaseConfig.deepLinkBaseURL.appending(path: report.id.uuidString)
            appState.platform.copyText(url.absoluteString)
            appState.postToast(.init(symbolName: "link", message: "Deep link copied ✓", tone: .success))
        default:
            if let data = renderPNG(format: format) {
                appState.platform.share(SharePayload(items: [.pngData(data, filename: "typography-crime-report-\(format.rawValue).png")]))
            }
        }
    }

    @MainActor
    private func copyImage() async {
        guard let data = renderPNG(format: exportReadyFormat) else {
            appState.postToast(.init(symbolName: "exclamationmark.triangle.fill", message: "Could not render the report image.", tone: .warning))
            return
        }
        appState.platform.copyPNG(data)
        appState.postToast(.init(symbolName: "doc.on.doc", message: "Copied to clipboard ✓", tone: .success))
    }

    @MainActor
    private func saveImage() async {
        guard let data = renderPNG(format: exportReadyFormat) else {
            appState.postToast(.init(symbolName: "exclamationmark.triangle.fill", message: "Could not render the report image.", tone: .warning))
            return
        }
        do {
            try await appState.platform.saveImageToPhotos(data)
            appState.postToast(.init(symbolName: "photo.on.rectangle", message: "Saved to Photos ✓", tone: .success))
        } catch PhotosSaveError.permissionDenied {
            showPhotosPermissionAlert = true
        } catch {
            appState.postToast(.init(symbolName: "exclamationmark.triangle.fill", message: "Could not save the report image.", tone: .warning))
        }
    }

    @MainActor
    private func renderPNG(format: ShareFormat) -> Data? {
        #if canImport(UIKit)
        let size = shareCanvasSize(for: format)
        let renderer = ImageRenderer(
            content: ShareExportCanvas(
                report: report,
                format: format,
                websiteHost: websiteHost,
                deepLinkURL: appState.releaseConfig.deepLinkBaseURL.appending(path: report.id.uuidString),
                canvasSize: size
            )
            .frame(width: size.width, height: size.height)
        )
        renderer.scale = 1
        return renderer.uiImage?.pngData()
        #else
        nil
        #endif
    }

    private func shareCanvasSize(for format: ShareFormat) -> CGSize {
        switch format {
        case .story:
            CGSize(width: 1080, height: 1920)
        case .landscape:
            CGSize(width: 1200, height: 628)
        default:
            CGSize(width: 1080, height: 1080)
        }
    }
}

private struct SharePreviewCard: View {
    let report: CrimeReport
    let format: ShareFormat
    let websiteHost: String

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            AppGradients.reportBackground
            VStack(spacing: 28) {
                ScoreRingView(score: report.score, verdict: report.verdict)
                    .frame(width: format == .story ? 300 : 200, height: format == .story ? 300 : 200)

                SeverityBadgeView(verdict: report.verdict)

                Text("\(report.crimeCount) crimes across \(report.categoryCount) categories")
                    .appTextStyle(.titleMedium, color: AppColors.textInverse.opacity(0.82))

                Text(report.previewText)
                    .appTextStyle(.monoBody, color: AppColors.textInverse.opacity(0.6))
                    .multilineTextAlignment(.center)
                    .padding(16)
                    .frame(maxWidth: min(900, format == .story ? 880 : 760))
                    .background(AppColors.textInverse.opacity(0.06), in: RoundedRectangle(cornerRadius: 16, style: .continuous))

                if format != .text {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 2), spacing: 12) {
                        ForEach(Array(report.groupedCrimes.prefix(4)), id: \.crimeType) { summary in
                            HStack {
                                Image(systemName: summary.crimeType.symbolName)
                                Text("\(summary.count)")
                            }
                            .appTextStyle(.monoBadge, color: AppColors.textInverse)
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(AppColors.textInverse.opacity(0.08), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        }
                    }
                    .padding(.horizontal, 32)
                }
            }
            .padding(.horizontal, format == .story ? 80 : 36)
            .padding(.vertical, format == .story ? 120 : 52)

            VStack(alignment: .trailing, spacing: 4) {
                Text("TYPO CRIMES")
                    .appTextStyle(.labelMedium, color: AppColors.textInverse.opacity(0.22))
                Text(websiteHost)
                    .appTextStyle(.bodySmall, color: AppColors.textInverse.opacity(0.16))
            }
            .padding(24)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .frame(height: format == .story ? 460 : 360)
        .appShadow(AppShadow.high)
    }
}

private struct ShareExportCanvas: View {
    let report: CrimeReport
    let format: ShareFormat
    let websiteHost: String
    let deepLinkURL: URL
    let canvasSize: CGSize

    private var isStory: Bool { format == .story }
    private var isLandscape: Bool { format == .landscape }
    private var ringSize: CGFloat { isStory ? 300 : (isLandscape ? 220 : 260) }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            AppGradients.reportBackground
                .ignoresSafeArea()

            if isLandscape {
                landscapeLayout
            } else {
                verticalLayout
            }

            decorativeTape

            VStack(alignment: .trailing, spacing: 6) {
                Text("TYPO CRIMES")
                    .appTextStyle(.labelLarge, color: AppColors.textInverse.opacity(0.2))
                Text(websiteHost)
                    .appTextStyle(.bodyMedium, color: AppColors.textInverse.opacity(0.14))
            }
            .padding(isStory ? 48 : 36)
        }
        .frame(width: canvasSize.width, height: canvasSize.height)
    }

    private var verticalLayout: some View {
        VStack(spacing: isStory ? 44 : 30) {
            Spacer(minLength: isStory ? 120 : 72)

            ScoreRingView(score: report.score, verdict: report.verdict)
                .frame(width: ringSize, height: ringSize)

            SeverityBadgeView(verdict: report.verdict)

            Text("\(report.crimeCount) crimes across \(report.categoryCount) categories")
                .appTextStyle(.titleLarge, color: AppColors.textInverse.opacity(0.82))

            Text(report.previewText)
                .appTextStyle(.monoBody, color: AppColors.textInverse.opacity(0.68))
                .multilineTextAlignment(.center)
                .padding(isStory ? 26 : 20)
                .frame(maxWidth: min(canvasSize.width - (isStory ? 160 : 120), 760))
                .background(AppColors.textInverse.opacity(0.06), in: RoundedRectangle(cornerRadius: 18, style: .continuous))

            crimeGrid
                .padding(.horizontal, isStory ? 108 : 72)

            if isStory {
                Spacer(minLength: 32)

                HStack(alignment: .bottom, spacing: 28) {
                    QRCodeBadgeView(url: deepLinkURL)
                        .frame(width: 160, height: 160)
                        .padding(16)
                        .background(AppColors.textInverse.opacity(0.08), in: RoundedRectangle(cornerRadius: 24, style: .continuous))

                    Text("SWIPE UP TO ANALYZE YOUR OWN TEXT")
                        .appTextStyle(.titleLarge, color: AppColors.textInverse)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 72)
                .padding(.bottom, 180)
            } else {
                Spacer(minLength: 150)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private var landscapeLayout: some View {
        HStack(spacing: 48) {
            Spacer(minLength: 56)

            ScoreRingView(score: report.score, verdict: report.verdict)
                .frame(width: ringSize, height: ringSize)

            VStack(alignment: .leading, spacing: 22) {
                SeverityBadgeView(verdict: report.verdict)

                Text("\(report.crimeCount) crimes across \(report.categoryCount) categories")
                    .appTextStyle(.titleLarge, color: AppColors.textInverse.opacity(0.84))

                Text(report.previewText)
                    .appTextStyle(.monoBody, color: AppColors.textInverse.opacity(0.68))
                    .padding(18)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(AppColors.textInverse.opacity(0.06), in: RoundedRectangle(cornerRadius: 18, style: .continuous))

                crimeGrid
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer(minLength: 56)
        }
        .padding(.vertical, 64)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private var crimeGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
            ForEach(Array(report.groupedCrimes.prefix(4)), id: \.crimeType) { summary in
                HStack(spacing: 10) {
                    Image(systemName: summary.crimeType.symbolName)
                    Text(summary.crimeType.displayName)
                        .lineLimit(1)
                    Spacer()
                    Text("\(summary.count)")
                }
                .appTextStyle(.monoBadge, color: AppColors.textInverse)
                .padding(.horizontal, 18)
                .frame(height: 52)
                .background(AppColors.textInverse.opacity(0.08), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            }
        }
    }

    private var decorativeTape: some View {
        Text("TYPO CRIME SCENE")
            .appTextStyle(.labelMedium, color: AppColors.surfaceReport)
            .padding(.horizontal, 24)
            .frame(height: 36)
            .background(AppColors.accentGold, in: Capsule())
            .rotationEffect(.degrees(-10))
            .padding(.trailing, isStory ? 120 : 72)
            .padding(.bottom, isStory ? 120 : 72)
    }
}

private struct QRCodeBadgeView: View {
    let url: URL
    private let context = CIContext()

    var body: some View {
        Group {
            if let code = qrImage {
                Image(decorative: code, scale: 1)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .padding(12)
                    .background(Color.white, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            } else {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white)
                    .overlay {
                        Image(systemName: "qrcode")
                            .font(.system(size: 44, weight: .medium))
                            .foregroundStyle(AppColors.surfaceReport)
                    }
            }
        }
    }

    private var qrImage: CGImage? {
        let filter = CIFilter.qrCodeGenerator()
        filter.message = Data(url.absoluteString.utf8)
        filter.correctionLevel = "M"

        guard let output = filter.outputImage?.transformed(by: CGAffineTransform(scaleX: 14, y: 14)) else {
            return nil
        }
        return context.createCGImage(output, from: output.extent)
    }
}

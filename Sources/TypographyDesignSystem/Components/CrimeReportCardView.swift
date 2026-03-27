import SwiftUI
import TypographyDomain

public struct CrimeReportCardView: View {
    public let report: CrimeReport
    public let showTimestamp: Bool

    public init(report: CrimeReport, showTimestamp: Bool = true) {
        self.report = report
        self.showTimestamp = showTimestamp
    }

    public var body: some View {
        HStack(spacing: 14) {
            VStack(alignment: .leading, spacing: 4) {
                Text(report.previewText)
                    .appTextStyle(.monoSmall, color: AppColors.textSecondary)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("\(report.crimeCount) crimes · \(report.verdict.label)")
                    .appTextStyle(.bodySmall, color: AppColors.textSecondary)

                if showTimestamp {
                    Text(report.createdAt, style: .relative)
                        .appTextStyle(.bodySmall, color: AppColors.textTertiary)
                }
            }

            VStack {
                let color = AppColors.verdict(report.verdict)
                ZStack {
                    Circle()
                        .fill(color.opacity(0.15))
                    Text("\(report.score)")
                        .appTextStyle(.titleMedium, color: color)
                }
                .frame(width: 48, height: 48)
            }
        }
        .padding(16)
        .appCardStyle(cornerRadius: 14)
    }
}

import SwiftUI
import TypographyDesignSystem

public struct ComicSansMugshotView: View {
    public let onContinue: () -> Void

    public init(onContinue: @escaping () -> Void) {
        self.onContinue = onContinue
    }

    public var body: some View {
        ZStack {
            AppColors.surfaceReport.ignoresSafeArea()
            VStack(spacing: 24) {
                VStack(spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(AppColors.textInverse.opacity(0.82), lineWidth: 3)
                        HStack {
                            VStack(spacing: 16) {
                                ForEach(0..<8, id: \.self) { _ in
                                    Rectangle().fill(AppColors.textInverse.opacity(0.35)).frame(width: 14, height: 1)
                                }
                            }
                            Spacer()
                        }
                        Text("Aa")
                            .font(.custom("Comic Sans MS", size: 72))
                            .foregroundStyle(AppColors.textInverse)
                        VStack {
                            Spacer()
                            Rectangle()
                                .fill(Color.white.opacity(0.85))
                                .frame(height: 30)
                                .overlay(Text("COMIC SANS").appTextStyle(.monoBadge, color: AppColors.surfaceReport))
                        }
                    }
                    .frame(width: 200, height: 240)
                }

                Text("WANTED FOR TYPOGRAPHIC CRIMES")
                    .appTextStyle(.titleLarge, color: AppColors.accentCrimson)
                    .multilineTextAlignment(.center)

                Text("Comic Sans was spotted in the submitted evidence. This font, originally designed for a children’s UI in 1994, has been flagged as a repeat offender across countless documents worldwide.")
                    .appTextStyle(.bodyMedium, color: AppColors.textInverse.opacity(0.72))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)

                Button("Proceed to Full Report →") {
                    onContinue()
                }
                .appTextStyle(.labelLarge, color: AppColors.accentCrimson)
            }
            .padding(24)
        }
    }
}

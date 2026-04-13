import SwiftUI
import TypographyDesignSystem
import TypographyDomain

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

                Text(L10n.text("mugshot.title"))
                    .appTextStyle(.titleLarge, color: AppColors.accentCrimson)
                    .multilineTextAlignment(.center)

                Text(L10n.text("mugshot.body"))
                    .appTextStyle(.bodyMedium, color: AppColors.textInverse.opacity(0.72))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)

                Button(L10n.text("mugshot.continue")) {
                    onContinue()
                }
                .appTextStyle(.labelLarge, color: AppColors.accentCrimson)
            }
            .padding(24)
        }
    }
}

import SwiftUI
import TypographyDomain

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public enum AppColors {
    public static let surfaceBase = Color(hex: 0x101014, lightHex: 0xF7F7F8)
    public static let surfacePrimary = Color(hex: 0x1C1C21, lightHex: 0xFFFFFF)
    public static let surfaceSecondary = Color(hex: 0x26262C, lightHex: 0xF0F0F4)
    public static let surfaceTertiary = Color(hex: 0x32323A, lightHex: 0xE8E8EE)
    public static let surfaceEvidence = Color(hex: 0x2A2418, lightHex: 0xFFF9E6)
    public static let surfaceReport = Color(hex: 0x0F1318)

    public static let textPrimary = Color(hex: 0xF0F0F4, lightHex: 0x18181B)
    public static let textSecondary = Color(hex: 0xA1A1AA, lightHex: 0x52525B)
    public static let textTertiary = Color(hex: 0x52525B, lightHex: 0xA1A1AA)
    public static let textInverse = Color.white
    public static let textEvidence = Color(hex: 0xFCD34D, lightHex: 0x92400E)

    public static let accentCrimson = Color(hex: 0xEF4444, lightHex: 0xB91C1C)
    public static let accentGold = Color(hex: 0xF59E0B, lightHex: 0xB45309)
    public static let accentTeal = Color(hex: 0x2DD4BF, lightHex: 0x0F766E)
    public static let accentSlate = Color(hex: 0x94A3B8, lightHex: 0x334155)
    public static let accentNavy = Color(hex: 0xCBD5E1, lightHex: 0x0F172A)
    public static let borderSubtle = Color(hex: 0x2C2C34, lightHex: 0xE4E4E9)

    public static func verdict(_ verdict: Verdict) -> Color {
        switch verdict {
        case .clean: Color(hex: 0x34D399, lightHex: 0x059669)
        case .infraction: Color(hex: 0xFBBF24, lightHex: 0xD97706)
        case .misdemeanor: Color(hex: 0xFB923C, lightHex: 0xEA580C)
        case .felony: Color(hex: 0xF87171, lightHex: 0xDC2626)
        case .capitalOffense: Color(hex: 0xFCA5A5, lightHex: 0x7F1D1D)
        }
    }

    public static func severity(_ severity: CrimeSeverity) -> Color {
        switch severity {
        case .infraction: verdict(.infraction)
        case .misdemeanor: verdict(.misdemeanor)
        case .felony: verdict(.felony)
        }
    }
}

public enum AppGradients {
    public static let heroCard = LinearGradient(
        colors: [AppColors.accentNavy, AppColors.accentCrimson],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    public static let reportBackground = LinearGradient(
        colors: [Color(hex: 0x0F1318), Color(hex: 0x1E1B2E)],
        startPoint: .top,
        endPoint: .bottom
    )

    public static let scanPulse = RadialGradient(
        colors: [
            AppColors.accentCrimson.opacity(0.18),
            AppColors.accentCrimson.opacity(0.1),
            .clear,
        ],
        center: .center,
        startRadius: 0,
        endRadius: 140
    )
}

public enum AppSpacing {
    public static let xxs: CGFloat = 2
    public static let xs: CGFloat = 4
    public static let sm: CGFloat = 8
    public static let md: CGFloat = 12
    public static let base: CGFloat = 16
    public static let lg: CGFloat = 20
    public static let xl: CGFloat = 24
    public static let xxl: CGFloat = 32
    public static let xxxl: CGFloat = 48
    public static let hero: CGFloat = 64
    public static let cover: CGFloat = 96
}

public enum AppShadow {
    public static let low = ShadowStyle(color: .black.opacity(0.08), radius: 6, x: 0, y: 2)
    public static let medium = ShadowStyle(color: .black.opacity(0.12), radius: 12, x: 0, y: 4)
    public static let high = ShadowStyle(color: .black.opacity(0.18), radius: 24, x: 0, y: 10)
}

public struct ShadowStyle: Sendable {
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat

    public init(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}

public enum AppTypography {
    case displayHero
    case displayLarge
    case displayMedium
    case titleLarge
    case titleMedium
    case titleSmall
    case bodyLarge
    case bodyMedium
    case bodySmall
    case labelLarge
    case labelMedium
    case labelSmall
    case monoBody
    case monoSmall
    case monoBadge

    public var font: Font {
        switch self {
        case .displayHero: .custom("InstrumentSerif-Regular", size: 64, relativeTo: .largeTitle)
        case .displayLarge: .custom("InstrumentSerif-Regular", size: 40, relativeTo: .title)
        case .displayMedium: .custom("InstrumentSerif-Italic", size: 28, relativeTo: .title2)
        case .titleLarge: .custom("Geist-SemiBold", size: 22, relativeTo: .title3)
        case .titleMedium: .custom("Geist-SemiBold", size: 18, relativeTo: .headline)
        case .titleSmall: .custom("Geist-Medium", size: 16, relativeTo: .headline)
        case .bodyLarge: .custom("Geist-Regular", size: 17, relativeTo: .body)
        case .bodyMedium: .custom("Geist-Regular", size: 15, relativeTo: .subheadline)
        case .bodySmall: .custom("Geist-Regular", size: 13, relativeTo: .caption)
        case .labelLarge: .custom("Geist-SemiBold", size: 16, relativeTo: .headline)
        case .labelMedium: .custom("Geist-Medium", size: 14, relativeTo: .subheadline)
        case .labelSmall: .custom("Geist-SemiBold", size: 11, relativeTo: .caption2)
        case .monoBody: .custom("IBMPlexMono-Regular", size: 15, relativeTo: .body)
        case .monoSmall: .custom("IBMPlexMono-Regular", size: 12, relativeTo: .caption)
        case .monoBadge: .custom("IBMPlexMono-SemiBold", size: 13, relativeTo: .caption)
        }
    }

    public var tracking: CGFloat {
        switch self {
        case .displayHero: -1.9
        case .displayLarge: -0.8
        case .displayMedium: -0.3
        case .labelLarge, .labelMedium: 0.3
        case .labelSmall: 0.6
        case .monoSmall, .monoBadge: 0.3
        default: 0
        }
    }
}

public extension View {
    func appTextStyle(_ style: AppTypography, color: Color? = nil) -> some View {
        self
            .font(style.font)
            .tracking(style.tracking)
            .foregroundStyle(color ?? AppColors.textPrimary)
    }

    func appCardStyle(cornerRadius: CGFloat = 16) -> some View {
        self
            .background(AppColors.surfacePrimary, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(AppColors.borderSubtle, lineWidth: 1)
            )
            .shadow(color: AppShadow.low.color, radius: AppShadow.low.radius, x: AppShadow.low.x, y: AppShadow.low.y)
    }

    func appShadow(_ shadow: ShadowStyle) -> some View {
        self.shadow(color: shadow.color, radius: shadow.radius, x: shadow.x, y: shadow.y)
    }
}

public extension Color {
    init(hex darkHex: UInt32, lightHex: UInt32? = nil) {
        #if canImport(UIKit)
        if let lightHex {
            self = Color(
                UIColor { trait in
                    if trait.userInterfaceStyle == .light {
                        return UIColor(hex: lightHex)
                    }
                    return UIColor(hex: darkHex)
                }
            )
        } else {
            self = Color(UIColor(hex: darkHex))
        }
        #elseif canImport(AppKit)
        self = Color(nsColor: NSColor(hex: lightHex ?? darkHex))
        #else
        let value = lightHex ?? darkHex
        let red = Double((value & 0xFF0000) >> 16) / 255
        let green = Double((value & 0x00FF00) >> 8) / 255
        let blue = Double(value & 0x0000FF) / 255
        self = Color(.sRGB, red: red, green: green, blue: blue, opacity: 1)
        #endif
    }
}

#if canImport(UIKit)
extension UIColor {
    convenience init(hex: UInt32) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255
        let blue = CGFloat(hex & 0x0000FF) / 255
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
#endif

#if canImport(AppKit)
extension NSColor {
    convenience init(hex: UInt32) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255
        let blue = CGFloat(hex & 0x0000FF) / 255
        self.init(calibratedRed: red, green: green, blue: blue, alpha: 1)
    }
}
#endif

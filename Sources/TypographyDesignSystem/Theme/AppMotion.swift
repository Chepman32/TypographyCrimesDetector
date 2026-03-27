import SwiftUI

@MainActor
public enum AppMotion {
    public static var isReduced: Bool {
        #if canImport(UIKit)
        UIAccessibility.isReduceMotionEnabled
        #else
        false
        #endif
    }

    public static var snappy: Animation { isReduced ? .easeInOut(duration: 0.2) : .spring(response: 0.25, dampingFraction: 0.7) }
    public static var standard: Animation { isReduced ? .easeInOut(duration: 0.2) : .spring(response: 0.4, dampingFraction: 0.75) }
    public static var gentle: Animation { isReduced ? .easeInOut(duration: 0.2) : .spring(response: 0.55, dampingFraction: 0.8) }
    public static var bouncy: Animation { isReduced ? .easeInOut(duration: 0.2) : .spring(response: 0.4, dampingFraction: 0.55) }
}

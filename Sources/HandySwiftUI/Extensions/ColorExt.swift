import SwiftUI

#if canImport(AppKit)
import AppKit
#elseif canImport(UIKit)
import UIKit
#endif

// MARK: - Apple-provided colors
extension Color {
    // MARK: - UI Element Colors (https://developer.apple.com/documentation/uikit/uicolor/ui_element_colors)
    // MARK: Label Colors
    /// The color for text labels that contain primary content.
    public static var label: Color {
        #if os(macOS)
        return Color(NSColor.labelColor)
        #else
        return Color(UIColor.label)
        #endif
    }

    /// The color for text labels that contain secondary content.
    public static var secondaryLabel: Color {
        #if os(macOS)
        return Color(NSColor.secondaryLabelColor)
        #else
        return Color(UIColor.secondaryLabel)
        #endif
    }

    /// The color for text labels that contain tertiary content.
    public static var tertiaryLabel: Color {
        #if os(macOS)
        return Color(NSColor.tertiaryLabelColor)
        #else
        return Color(UIColor.tertiaryLabel)
        #endif
    }

    /// The color for text labels that contain quaternary content.
    public static var quaternaryLabel: Color {
        #if os(macOS)
        return Color(NSColor.quaternaryLabelColor)
        #else
        return Color(UIColor.quaternaryLabel)
        #endif
    }

    // MARK: Fill Colors
    /// An overlay fill color for thin and small shapes.
    public static var systemFill: Color {
        #if os(macOS)
        return Color(NSColor.windowFrameTextColor)
        #else
        return Color(UIColor.systemFill)
        #endif
    }

    /// An overlay fill color for medium-size shapes.
    public static var secondarySystemFill: Color {
        #if os(macOS)
        return Color(NSColor.windowFrameTextColor)
        #else
        return Color(UIColor.secondarySystemFill)
        #endif
    }

    /// An overlay fill color for large shapes.
    public static var tertiarySystemFill: Color {
        #if os(macOS)
        return Color(NSColor.windowFrameTextColor)
        #else
        return Color(UIColor.tertiarySystemFill)
        #endif
    }

    /// An overlay fill color for large areas that contain complex content.
    public static var quaternarySystemFill: Color {
        #if os(macOS)
        return Color(NSColor.windowFrameTextColor)
        #else
        return Color(UIColor.quaternarySystemFill)
        #endif
    }

    // MARK: Text Colors
    /// The color for placeholder text in controls or text views.
    public static var placeholderText: Color {
        #if os(macOS)
        return Color(NSColor.placeholderTextColor)
        #else
        return Color(UIColor.placeholderText)
        #endif
    }

    // MARK: Standard Content Background Colors
    /// The color for the main background of your interface.
    public static var systemBackground: Color {
        #if os(macOS)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color(UIColor.systemBackground)
        #endif
    }

    /// The color for content layered on top of the main background.
    public static var secondarySystemBackground: Color {
        #if os(macOS)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color(UIColor.secondarySystemBackground)
        #endif
    }

    /// The color for content layered on top of secondary backgrounds.
    public static var tertiarySystemBackground: Color {
        #if os(macOS)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color(UIColor.tertiarySystemBackground)
        #endif
    }

    // MARK: Grouped Content Background Colors
    /// The color for the main background of your grouped interface.
    public static var systemGroupedBackground: Color {
        #if os(macOS)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color(UIColor.systemGroupedBackground)
        #endif
    }

    /// The color for content layered on top of the main background of your grouped interface.
    public static var secondarySystemGroupedBackground: Color {
        #if os(macOS)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color(UIColor.secondarySystemGroupedBackground)
        #endif
    }

    /// The color for content layered on top of secondary backgrounds of your grouped interface.
    public static var tertiarySystemGroupedBackground: Color {
        #if os(macOS)
        return Color(NSColor.windowBackgroundColor)
        #else
        return Color(UIColor.tertiarySystemGroupedBackground)
        #endif
    }

    // MARK: Separator Colors
    /// The color for thin borders or divider lines that allows some underlying content to be visible.
    public static var separator: Color {
        #if os(macOS)
        return Color(NSColor.separatorColor)
        #else
        return Color(UIColor.separator)
        #endif
    }

    /// The color for borders or divider lines that hides any underlying content.
    public static var opaqueSeparator: Color {
        #if os(macOS)
        return Color(NSColor.separatorColor).opacity(1)
        #else
        return Color(UIColor.opaqueSeparator)
        #endif
    }

    // MARK: Link Color
    /// The color for links.
    public static var link: Color {
        #if os(macOS)
        return Color(NSColor.linkColor)
        #else
        return Color(UIColor.link)
        #endif
    }

    // MARK: - Standard Colors (https://developer.apple.com/documentation/uikit/uicolor/standard_colors)
    // MARK: Adaptable Colors
    public static var systemBlue: Color {
        #if os(macOS)
        return Color(NSColor.systemBlue)
        #else
        return Color(UIColor.systemBlue)
        #endif
    }

    public static var systemGreen: Color {
        #if os(macOS)
        return Color(NSColor.systemGreen)
        #else
        return Color(UIColor.systemGreen)
        #endif
    }

    public static var systemIndigo: Color {
        #if os(macOS)
        return Color(NSColor.systemIndigo)
        #else
        return Color(UIColor.systemIndigo)
        #endif
    }

    public static var systemOrange: Color {
        #if os(macOS)
        return Color(NSColor.systemOrange)
        #else
        return Color(UIColor.systemOrange)
        #endif
    }

    public static var systemPink: Color {
        #if os(macOS)
        return Color(NSColor.systemPink)
        #else
        return Color(UIColor.systemPink)
        #endif
    }

    public static var systemPurple: Color {
        #if os(macOS)
        return Color(NSColor.systemPurple)
        #else
        return Color(UIColor.systemPurple)
        #endif
    }

    public static var systemRed: Color {
        #if os(macOS)
        return Color(NSColor.systemRed)
        #else
        return Color(UIColor.systemRed)
        #endif
    }

    public static var systemTeal: Color {
        #if os(macOS)
        return Color(NSColor.systemTeal)
        #else
        return Color(UIColor.systemTeal)
        #endif
    }

    public static var systemYellow: Color {
        #if os(macOS)
        return Color(NSColor.systemYellow)
        #else
        return Color(UIColor.systemYellow)
        #endif
    }

    // MARK: Adaptable Gray Colors
    public static var systemGray: Color {
        #if os(macOS)
        return Color(NSColor.systemGray)
        #else
        return Color(UIColor.systemGray)
        #endif
    }

    public static var systemGray2: Color {
        #if os(macOS)
        return Color(NSColor.systemGray)
        #else
        return Color(UIColor.systemGray2)
        #endif
    }

    public static var systemGray3: Color {
        #if os(macOS)
        return Color(NSColor.systemGray)
        #else
        return Color(UIColor.systemGray3)
        #endif
    }

    public static var systemGray4: Color {
        #if os(macOS)
        return Color(NSColor.systemGray)
        #else
        return Color(UIColor.systemGray4)
        #endif
    }

    public static var systemGray5: Color {
        #if os(macOS)
        return Color(NSColor.systemGray)
        #else
        return Color(UIColor.systemGray5)
        #endif
    }

    public static var systemGray6: Color {
        #if os(macOS)
        return Color(NSColor.systemGray)
        #else
        return Color(UIColor.systemGray6)
        #endif
    }
}

// MARK: - Color Spaces
extension Color {
    #if canImport(UIKit)
    typealias NativeColor = UIColor
    #elseif canImport(AppKit)
    typealias NativeColor = NSColor
    #endif

    /// A list of changeable attributes of the Color.
    ///
    /// - Red:
    /// - Green:
    /// - Blue:
    /// - Alpha:
    /// - Hue:
    /// - Saturation:
    /// - Brightness:
    ///
    public enum ChangeableAttribute {
        /// The red color part of RGB.
        case red
        /// The green color part of RGB.
        case green
        /// The blue color part of RGB.
        case blue
        /// The hue color part of HSB.
        case hueHSB
        /// The saturation color part of HSB.
        case saturation
        /// The brightness color part of HSB.
        case brightness
        /// The hue color part of HLC.
        case hueHLC
        /// The luminance color part of HLC.
        case luminance
        /// The chroma color part of HLC.
        case chroma
        /// The alpha color part of RGB / HSB / HLC.
        case alpha
    }

    // MARK: - Computed Properties
    /// The HLC & alpha attributes of the `Color` instance.
    public var hlca: (hue: CGFloat, luminance: CGFloat, chroma: CGFloat, alpha: CGFloat) { // swiftlint:disable:this large_tuple
        let lch = rgbColor().toLCH()
        return (hue: lch.h / 360, luminance: lch.l / 100, chroma: lch.c / 128, alpha: lch.alpha)
    }

    /// The HSB & alpha attributes of the `Color` instance.
    public var hsba: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) { // swiftlint:disable:this large_tuple
        var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
        NativeColor(self).getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)

        return (hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }

    /// The RGB & alpha attributes of the `Color` instance.
    public var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) { // swiftlint:disable:this large_tuple
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        NativeColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red: red, green: green, blue: blue, alpha: alpha)
    }

    /// Initializes and returns a color with the given HLCA values.
    ///
    /// - Parameters:
    ///   - hue:        The hue. A value between 0 and 1.
    ///   - luminance:  The luminance. A value between 0 and 1.
    ///   - chroma:     The chroma. A value between 0 and 1.
    ///   - alpha:      The alpha. A value between 0 and 1.
    public init(hue: CGFloat, luminance: CGFloat, chroma: CGFloat, alpha: CGFloat) {
        let rgb = LCHColor(l: luminance * 100, c: chroma * 128, h: hue * 360, alpha: alpha).toRGB()
        self.init(NativeColor(red: rgb.r, green: rgb.g, blue: rgb.b, alpha: rgb.alpha))
    }

    // MARK: - Methods
    /// Creates a new `Color` object with a single attribute changed by a given difference using addition.
    ///
    /// - Parameters:
    ///   - attribute: The attribute to change.
    ///   - by: The addition to be added to the current value of the attribute.
    /// - Returns: The resulting new `Color` with the specified change applied.
    public func change(_ attribute: ChangeableAttribute, by addition: CGFloat) -> Self {
        switch attribute {
        case .red:
            return change(attribute, to: rgba.red + addition)

        case .green:
            return change(attribute, to: rgba.green + addition)

        case .blue:
            return change(attribute, to: rgba.blue + addition)

        case .hueHSB:
            return change(attribute, to: hsba.hue + addition)

        case .saturation:
            return change(attribute, to: hsba.saturation + addition)

        case .brightness:
            return change(attribute, to: hsba.brightness + addition)

        case .hueHLC:
            return change(attribute, to: hlca.hue + addition)

        case .luminance:
            return change(attribute, to: hlca.luminance + addition)

        case .chroma:
            return change(attribute, to: hlca.chroma + addition)

        case .alpha:
            return change(attribute, to: hlca.alpha + addition)
        }
    }

    /// Creates a new `Color` object with the value of a single attribute set to a given value.
    ///
    /// - Parameters:
    ///   - attribute: The attribute to change.
    ///   - to: The new value to be set for the attribute.
    /// - Returns: The resulting new `Color` with the specified change applied.
    public func change(_ attribute: ChangeableAttribute, to newValue: CGFloat) -> Self {
        switch attribute {
        case .red, .green, .blue:
            return newRgbaColor(attribute, newValue)

        case .hueHSB, .saturation, .brightness:
            return newHsbaColor(attribute, newValue)

        case .hueHLC, .luminance, .chroma, .alpha:
            return newHlcaColor(attribute, newValue)
        }
    }

    private func newHlcaColor(_ attribute: Self.ChangeableAttribute, _ newValue: CGFloat) -> Self {
        var newHlca = hlca

        switch attribute {
        case .hueHLC:
            newHlca.hue = newValue

        case .luminance:
            newHlca.luminance = newValue

        case .chroma:
            newHlca.chroma = newValue

        case .alpha:
            newHlca.alpha = newValue

        default:
            break
        }

        return Self(hue: newHlca.hue, luminance: newHlca.luminance, chroma: newHlca.chroma, alpha: newHlca.alpha)
    }

    private func newHsbaColor(_ attribute: Self.ChangeableAttribute, _ newValue: CGFloat) -> Self {
        var newHsba = hsba

        switch attribute {
        case .hueHSB:
            newHsba.hue = newValue

        case .saturation:
            newHsba.saturation = newValue

        case .brightness:
            newHsba.brightness = newValue

        default:
            break
        }

        return Self(NativeColor(hue: newHsba.hue, saturation: newHsba.saturation, brightness: newHsba.brightness, alpha: newHsba.alpha))
    }

    private func newRgbaColor(_ attribute: Self.ChangeableAttribute, _ newValue: CGFloat) -> Self {
        var newRgba = rgba

        switch attribute {
        case .red:
            newRgba.red = newValue

        case .green:
            newRgba.green = newValue

        case .blue:
            newRgba.blue = newValue

        default:
            break
        }

        return Self(NativeColor(red: newRgba.red, green: newRgba.green, blue: newRgba.blue, alpha: newRgba.alpha))
    }
}


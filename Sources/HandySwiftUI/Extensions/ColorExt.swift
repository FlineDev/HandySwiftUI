import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

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


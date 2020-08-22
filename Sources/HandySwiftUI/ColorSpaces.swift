// Original source: https://github.com/timrwood/ColorSpaces

// swiftlint:disable all

import SwiftUI

private struct ColorSpaces {}

// MARK: - Constants
private let RAD_TO_DEG = 180 / CGFloat.pi

private let LAB_E: CGFloat = 0.008856
private let LAB_16_116: CGFloat = 0.1379310
private let LAB_K_116: CGFloat = 7.787036
private let LAB_X: CGFloat = 0.95047
private let LAB_Y: CGFloat = 1
private let LAB_Z: CGFloat = 1.088_83

// MARK: - RGB
struct RGBColor {
    let r: CGFloat     // 0..1
    let g: CGFloat     // 0..1
    let b: CGFloat     // 0..1
    let alpha: CGFloat // 0..1

    init (r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.r = r
        self.g = g
        self.b = b
        self.alpha = alpha
    }

    fileprivate func sRGBCompand(_ v: CGFloat) -> CGFloat {
        let absV = abs(v)
        let out = absV > 0.040_45 ? pow((absV + 0.055) / 1.055, 2.4) : absV / 12.92
        return v > 0 ? out : -out
    }

    func toXYZ() -> XYZColor {
        let R = sRGBCompand(r)
        let G = sRGBCompand(g)
        let B = sRGBCompand(b)
        let x: CGFloat = (R * 0.412_456_4) + (G * 0.357_576_1) + (B * 0.180_437_5)
        let y: CGFloat = (R * 0.212_672_9) + (G * 0.715_152_2) + (B * 0.072_175_0)
        let z: CGFloat = (R * 0.019_333_9) + (G * 0.119_192_0) + (B * 0.950_304_1)
        return XYZColor(x: x, y: y, z: z, alpha: alpha)
    }

    func toLAB() -> LABColor {
        return toXYZ().toLAB()
    }

    func toLCH() -> LCHColor {
        return toXYZ().toLCH()
    }

    func color() -> UIColor {
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }

    func lerp(_ other: RGBColor, t: CGFloat) -> RGBColor {
        return RGBColor(
            r: r + (other.r - r) * t,
            g: g + (other.g - g) * t,
            b: b + (other.b - b) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}

extension Color {
    func rgbColor() -> RGBColor {
        return RGBColor(r: rgba.red, g: rgba.green, b: rgba.blue, alpha: rgba.alpha)
    }
}

// MARK: - XYZ

struct XYZColor {
    let x: CGFloat     // 0..0.95047
    let y: CGFloat     // 0..1
    let z: CGFloat     // 0..1.08883
    let alpha: CGFloat // 0..1

    init (x: CGFloat, y: CGFloat, z: CGFloat, alpha: CGFloat) {
        self.x = x
        self.y = y
        self.z = z
        self.alpha = alpha
    }

    fileprivate func sRGBCompand(_ v: CGFloat) -> CGFloat {
        let absV = abs(v)
        let out = absV > 0.003_130_8 ? 1.055 * pow(absV, 1 / 2.4) - 0.055 : absV * 12.92
        return v > 0 ? out : -out
    }

    func toRGB() -> RGBColor {
        let r = (x * 3.240_454_2) + (y * -1.537_138_5) + (z * -0.498_531_4)
        let g = (x * -0.969_266_0) + (y * 1.876_010_8) + (z * 0.041_556_0)
        let b = (x * 0.055_643_4) + (y * -0.204_025_9) + (z * 1.057_225_2)
        let R = sRGBCompand(r)
        let G = sRGBCompand(g)
        let B = sRGBCompand(b)
        return RGBColor(r: R, g: G, b: B, alpha: alpha)
    }

    fileprivate func labCompand(_ v: CGFloat) -> CGFloat {
        return v > LAB_E ? pow(v, 1.0 / 3.0) : (LAB_K_116 * v) + LAB_16_116
    }

    func toLAB() -> LABColor {
        let fx = labCompand(x / LAB_X)
        let fy = labCompand(y / LAB_Y)
        let fz = labCompand(z / LAB_Z)
        return LABColor(
            l: 116 * fy - 16,
            a: 500 * (fx - fy),
            b: 200 * (fy - fz),
            alpha: alpha
        )
    }

    func toLCH() -> LCHColor {
        return toLAB().toLCH()
    }

    func lerp(_ other: XYZColor, t: CGFloat) -> XYZColor {
        return XYZColor(
            x: x + (other.x - x) * t,
            y: y + (other.y - y) * t,
            z: z + (other.z - z) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}

// MARK: - LAB

struct LABColor {
    let l: CGFloat     //    0..100
    let a: CGFloat     // -128..128
    let b: CGFloat     // -128..128
    let alpha: CGFloat //    0..1

    init (l: CGFloat, a: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.l = l
        self.a = a
        self.b = b
        self.alpha = alpha
    }

    fileprivate func xyzCompand(_ v: CGFloat) -> CGFloat {
        let v3 = v * v * v
        return v3 > LAB_E ? v3 : (v - LAB_16_116) / LAB_K_116
    }

    func toXYZ() -> XYZColor {
        let y = (l + 16) / 116
        let x = y + (a / 500)
        let z = y - (b / 200)
        return XYZColor(
            x: xyzCompand(x) * LAB_X,
            y: xyzCompand(y) * LAB_Y,
            z: xyzCompand(z) * LAB_Z,
            alpha: alpha
        )
    }

    func toLCH() -> LCHColor {
        let c = sqrt(a * a + b * b)
        let angle = atan2(b, a) * RAD_TO_DEG
        let h = angle < 0 ? angle + 360 : angle
        return LCHColor(l: l, c: c, h: h, alpha: alpha)
    }

    func toRGB() -> RGBColor {
        return toXYZ().toRGB()
    }

    func lerp(_ other: LABColor, t: CGFloat) -> LABColor {
        return LABColor(
            l: l + (other.l - l) * t,
            a: a + (other.a - a) * t,
            b: b + (other.b - b) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}

// MARK: - LCH

struct LCHColor {
    let l: CGFloat     // 0..100
    let c: CGFloat     // 0..128
    let h: CGFloat     // 0..360
    let alpha: CGFloat // 0..1

    init (l: CGFloat, c: CGFloat, h: CGFloat, alpha: CGFloat) {
        self.l = l
        self.c = c
        self.h = h
        self.alpha = alpha
    }

    func toLAB() -> LABColor {
        let rad = h / RAD_TO_DEG
        let a = cos(rad) * c
        let b = sin(rad) * c
        return LABColor(l: l, a: a, b: b, alpha: alpha)
    }

    func toXYZ() -> XYZColor {
        return toLAB().toXYZ()
    }

    func toRGB() -> RGBColor {
        return toXYZ().toRGB()
    }

    func lerp(_ other: LCHColor, t: CGFloat) -> LCHColor {
        let angle = (((((other.h - h).truncatingRemainder(dividingBy: 360)) + 540).truncatingRemainder(dividingBy: 360)) - 180) * t
        return LCHColor(
            l: l + (other.l - l) * t,
            c: c + (other.c - c) * t,
            h: (h + angle + 360).truncatingRemainder(dividingBy: 360),
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}

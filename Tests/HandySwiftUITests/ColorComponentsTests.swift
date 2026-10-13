import SwiftUI
import Testing

@testable import HandySwiftUI

@MainActor
struct ColorComponentsTests {
   typealias Components = (red: Double, green: Double, blue: Double, opacity: Double)

   nonisolated static let srgbColors: [(String, Color)] = [
      ("red", .red),
      ("blue", .blue),
      ("rgb", Color(red: 0.2, green: 0.4, blue: 0.6)),
      ("srgbWithOpacity", Color(.sRGB, red: 0.9, green: 0.1, blue: 0.3, opacity: 0.5)),
      ("gray", Color(white: 0.5)),
      ("hex", Color(hex: "#FF5733")),
      ("primary", .primary),
      ("systemBlue", .systemBlue),
      ("label", .label),
   ]

   static func environment(_ colorScheme: ColorScheme) -> EnvironmentValues {
      var environment = EnvironmentValues()
      environment.colorScheme = colorScheme
      return environment
   }

   func expectEqual(_ lhs: Components, _ rhs: Components, _ comment: Comment) {
      let tolerance = 0.0005
      #expect(abs(lhs.red - rhs.red) < tolerance, comment)
      #expect(abs(lhs.green - rhs.green) < tolerance, comment)
      #expect(abs(lhs.blue - rhs.blue) < tolerance, comment)
      #expect(abs(lhs.opacity - rhs.opacity) < tolerance, comment)
   }

   #if os(macOS)
      /// The implementation of `rgbo` before it switched from device RGB to extended sRGB on macOS.
      func deviceRGBComponents(of color: Color) -> Components {
         var red: CGFloat = 0
         var green: CGFloat = 0
         var blue: CGFloat = 0
         var opacity: CGFloat = 0
         NSColor(color).usingColorSpace(.deviceRGB)!.getRed(&red, green: &green, blue: &blue, alpha: &opacity)
         return (Double(red), Double(green), Double(blue), Double(opacity))
      }

      var currentColorScheme: ColorScheme {
         NSAppearance.currentDrawing().bestMatch(from: [.aqua, .darkAqua]) == .darkAqua ? .dark : .light
      }

      @Test(arguments: srgbColors)
      func srgbColorsKeepTheirComponents(name: String, color: Color) {
         self.expectEqual(color.rgbo, self.deviceRGBComponents(of: color), "\(name)")
      }

      @Test(arguments: srgbColors)
      func rgboMatchesResolvedComponentsForTheCurrentAppearance(name: String, color: Color) {
         self.expectEqual(color.rgbo, color.rgbo(in: Self.environment(self.currentColorScheme)), "\(name)")
      }

      @Test
      func wideGamutColorIsNotClipped() {
         let displayP3Red = Color(.displayP3, red: 1, green: 0, blue: 0)

         #expect(displayP3Red.rgbo.red > 1.05)
         #expect(displayP3Red.rgbo.green < -0.1)
         self.expectEqual(displayP3Red.rgbo, displayP3Red.rgbo(in: EnvironmentValues()), "displayP3Red")
      }
   #endif

   @Test
   func dynamicColorsResolveAgainstTheGivenEnvironment() {
      let light = Color.primary.rgbo(in: Self.environment(.light))
      let dark = Color.primary.rgbo(in: Self.environment(.dark))

      #expect(light.red < 0.1 && light.green < 0.1 && light.blue < 0.1)
      #expect(dark.red > 0.9 && dark.green > 0.9 && dark.blue > 0.9)
   }

   @Test(arguments: srgbColors)
   func staticColorsAreTheSameInEveryEnvironment(name: String, color: Color) {
      guard !["red", "blue", "primary", "systemBlue", "label"].contains(name) else { return }
      self.expectEqual(color.rgbo(in: Self.environment(.light)), color.rgbo(in: Self.environment(.dark)), "\(name)")
   }
}

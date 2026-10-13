import SwiftUI
import Testing

@testable import HandySwiftUI

@MainActor
struct ColorExtTests {
   @Test
   func hexRoundTrips() {
      #expect(Color(hex: "#FF5733").toHex() == "FF5733")
      #expect(Color(hex: "#FF573380").toHex(alpha: true) == "FF573380")
   }

   @Test
   func hexOfGrayscaleColor() throws {
      // A color in a gray color space, which has only two components (gray and alpha)
      let gray = Color(cgColor: CGColor(gray: 0.5, alpha: 1))
      let hex = try #require(gray.toHex())

      #expect(hex.count == 6)
      #expect(hex.prefix(2) == hex.dropFirst(2).prefix(2) && hex.prefix(2) == hex.suffix(2))
   }

   @Test
   func hexOfDynamicColors() throws {
      for color in [Color.primary, .systemBlue, .red] {
         let hex = try #require(color.toHex(), "\(color)")
         let components = color.rgbo
         let expected = String(
            format: "%02lX%02lX%02lX",
            lroundf(Float(components.red) * 255),
            lroundf(Float(components.green) * 255),
            lroundf(Float(components.blue) * 255)
         )
         #expect(hex == expected, "\(color)")
      }
   }

   @Test
   func hexOfWideGamutColorIsClampedToSRGB() {
      #expect(Color(.displayP3, red: 1, green: 0, blue: 0).toHex() == "FF0000")
   }

   @Test(arguments: [(1.0, 0.0, 0.5), (0.2, 0.4, 0.6), (0.0, 1.0, 0.0)])
   func changingOpacityKeepsTheRGBComponents(red: Double, green: Double, blue: Double) {
      let color = Color(red: red, green: green, blue: blue)

      // Float precision of the platform colors allows for deviations around 1e-7, the HLC round trip caused around 1e-6
      func expectSameRGB(_ changed: (red: Double, green: Double, blue: Double, opacity: Double), opacity: Double) {
         let tolerance = 0.000_000_5
         #expect(abs(changed.red - color.rgbo.red) < tolerance)
         #expect(abs(changed.green - color.rgbo.green) < tolerance)
         #expect(abs(changed.blue - color.rgbo.blue) < tolerance)
         #expect(abs(changed.opacity - opacity) < tolerance)
      }

      expectSameRGB(color.change(.opacity, to: 0.5).rgbo, opacity: 0.5)
      expectSameRGB(color.change(.opacity, by: -0.25).rgbo, opacity: 0.75)
   }
}

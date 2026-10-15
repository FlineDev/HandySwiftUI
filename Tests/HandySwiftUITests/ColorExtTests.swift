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

   @Test
   func hexOfDisplayP3ColorIsConvertedToSRGB() {
      // An in-gamut Display P3 color must be converted, not reported with its raw P3 components (which would be "80CC4D")
      #expect(Color(.displayP3, red: 0.5, green: 0.8, blue: 0.3).toHex() == "64CE2F")
   }
}

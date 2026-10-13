import SwiftUI
import Testing

@testable import HandySwiftUI

@MainActor
struct ConvertibleTests {
   struct RotatedStar: CustomLabelConvertible {
      var description: String { "Rotated Star" }
      var symbolName: String { "star:45*2" }
   }

   @Test
   func imageUsesTheSymbolNameWithoutMetadata() {
      #expect(Image(convertible: RotatedStar()) == Image(systemName: "star"))
   }

   @Test
   func labelUsesTheSymbolNameWithoutMetadata() throws {
      let label = Label(convertible: RotatedStar())
      let icon = try #require(Mirror(reflecting: label).children.first { $0.label == "icon" }?.value as? Image)

      #expect(icon == Image(systemName: "star"))
   }
}

import SwiftUI
import Testing

@testable import HandySwiftUI

@MainActor
struct PickerTests {
   /// A `CaseIterable` type whose `AllCases` is not an `Array`, which is allowed by the protocol.
   struct Fruit: Hashable, Identifiable, CaseIterable, CustomLabelConvertible {
      static let allCases: ContiguousArray<Fruit> = [Fruit(name: "Apple"), Fruit(name: "Banana"), Fruit(name: "Cherry")]

      let name: String

      var id: String { self.name }
      var description: String { self.name }
      var symbolName: String { "leaf" }
   }

   @Test
   func hPickerAcceptsNonArrayAllCases() {
      let picker = HPicker<Fruit, Text>("Fruit", locked: [], selection: .constant(nil))
      #expect(picker.options.map(\.name) == ["Apple", "Banana", "Cherry"])
   }

   @Test
   func vPickerAcceptsNonArrayAllCases() {
      let picker = VPicker<Fruit, Text>("Fruit", selection: .constant(nil))
      #expect(picker.options.map(\.name) == ["Apple", "Banana", "Cherry"])
   }
}

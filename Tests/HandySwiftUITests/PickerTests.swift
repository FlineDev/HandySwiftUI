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

   /// A string literal title must reach the `LocalizedStringKey` initializer, else the title is a verbatim `Text` that never
   /// finds the app's translations.
   @Test
   func hPickerLiteralTitleIsLocalized() {
      let picker = HPicker<Fruit, Text>("Fruit", locked: [], selection: .constant(nil))
      #expect(picker.label() == Text(LocalizedStringKey("Fruit")).font(.headline))
   }

   @Test
   func vPickerLiteralTitleIsLocalized() {
      let picker = VPicker<Fruit, Text>("Fruit", options: Array(Fruit.allCases), selection: .constant(nil))
      #expect(picker.label() == Text(LocalizedStringKey("Fruit")).font(.headline))
   }

   /// A `String` value stays verbatim, like `Text(_:)` does with one.
   @Test
   func stringValueTitleStaysVerbatim() {
      let title = "Fruit"
      let hPicker = HPicker<Fruit, Text>(title, locked: [], selection: .constant(nil))
      let vPicker = VPicker<Fruit, Text>(title, options: Array(Fruit.allCases), selection: .constant(nil))
      #expect(hPicker.label() == Text(verbatim: title).font(.headline))
      #expect(vPicker.label() == Text(verbatim: title).font(.headline))
   }
}

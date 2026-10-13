import SwiftUI
import Testing

@testable import HandySwiftUI

@MainActor
struct BindingExtTests {
   @Test
   func negatedBindingWritesTheInvertedValue() {
      var stored = false
      let binding = Binding(get: { stored }, set: { stored = $0 })
      let negated = !binding

      #expect(negated.wrappedValue == true)

      negated.wrappedValue = false
      #expect(stored == true)

      negated.wrappedValue = true
      #expect(stored == false)
   }
}

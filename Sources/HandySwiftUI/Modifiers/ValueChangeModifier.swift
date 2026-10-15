import SwiftUI

extension View {
   /// Calls `action` with the new value whenever `value` changes, using the `onChange` variant that is not deprecated on the running OS.
   ///
   /// `onChange(of:perform:)` is deprecated starting with iOS 17 (and from the start on visionOS), while its replacement needs iOS 17,
   /// one above the package's minimum.
   @ViewBuilder
   func onValueChange<Value: Equatable>(of value: Value, perform action: @escaping (Value) -> Void) -> some View {
      #if os(visionOS)
         self.onChange(of: value) { _, newValue in action(newValue) }
      #else
         if #available(iOS 17, macOS 14, tvOS 17, watchOS 10, *) {
            self.onChange(of: value) { _, newValue in action(newValue) }
         } else {
            self.onChange(of: value, perform: action)
         }
      #endif
   }
}

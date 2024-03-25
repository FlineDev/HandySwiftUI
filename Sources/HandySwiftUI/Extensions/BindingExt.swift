import SwiftUI

/// Types that conform to this protocol provide a placeholder value that can be used in place of `nil` for Optionals of this type.
/// For example, this can be useful to pass a ``Binding`` of an ``Optional`` value to a view that requires a non-optional value like ``TextField``.
public protocol NilPlaceholdable: Equatable {
   static var nilPlaceholderValue: Self { get }
}

// Common Conforming Types
extension String: NilPlaceholdable {
   public static var nilPlaceholderValue: String { "" }
}

// Actual Binding Extensions
public prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
   Binding<Bool>(
      get: { !value.wrappedValue },
      set: { value.wrappedValue = $0 }
   )
}

public func ?? <T: NilPlaceholdable>(lhs: Binding<T?>, rhs: T) -> Binding<T> {
   Binding(
      get: { lhs.wrappedValue ?? rhs },
      set: { lhs.wrappedValue = $0 == T.nilPlaceholderValue ? nil : $0 }
   )
}

extension Binding where Value == Optional<Any> {
   /// Turns any Binding holding an Optional into one that can be passed to `isPresented` SwiftUI parameters. Useful for APIs that don't have an `item:` overload such as `.confirmationDialog`.
   ///
   /// - Note: When a `true` value is set, nothing happens as it's unclear how one would construct "any" type. But this is negligible for SwiftUI APIs because they can only ever set `false` when the view is dismissed by the user. They never set a `true` value.
   func isPresent() -> Binding<Bool> {
      Binding<Bool>(
         get: { self.wrappedValue == nil },
         set: { newValue in
            if !newValue {
               self.wrappedValue = nil
            }
         }
      )
   }
}

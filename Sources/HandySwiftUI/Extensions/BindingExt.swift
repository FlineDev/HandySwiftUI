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

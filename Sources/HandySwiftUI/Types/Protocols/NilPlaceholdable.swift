import SwiftUI

/// A protocol for types that provide a placeholder value to be used in place of `nil` for Optionals.
/// Conforming types must implement a static `nilPlaceholderValue`, which can be used in cases where an Optional needs to be unwrapped with a default value.
///
/// ## Usage Example:
/// ```swift
/// let optionalString: String? = nil
/// let bindingString = Binding.constant(optionalString) ?? "Default Value"
/// print(bindingString.wrappedValue) // "Default Value"
/// ```
/// This is especially useful in SwiftUI views like `TextField` that require a non-optional binding.
public protocol NilPlaceholdable: Equatable {
   /// A value that acts as a placeholder in place of `nil`.
   static var nilPlaceholderValue: Self { get }
}

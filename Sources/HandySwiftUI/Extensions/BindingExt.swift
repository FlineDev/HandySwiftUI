import SwiftUI

/// Negates the value of a `Binding<Bool>`. Useful for toggling booleans directly in SwiftUI views.
///
/// ## Usage Example:
/// ```swift
/// struct ContentView: View {
///     @State private var isOff = false
///
///     var body: some View {
///         Toggle("Toggle", isOn: !$isOff) // This will invert the boolean value
///     }
/// }
/// ```
/// - Parameter value: A binding to a boolean value.
/// - Returns: A new binding with the negated boolean value.
public prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
   Binding<Bool>(
      get: { !value.wrappedValue },
      set: { value.wrappedValue = $0 }
   )
}

/// Provides a default value for a `Binding<T?>`, returning a non-optional `Binding<T>`.
///
/// If the binding's value is `nil`, it returns the right-hand side `nilPlaceholderValue`.
/// If the value is updated to match the `nilPlaceholderValue`, it resets the binding to `nil`.
///
/// ## Usage Example:
/// ```swift
/// struct ProfileView: View {
///    @State private var username: String? = nil
///
///    var body: some View {
///       TextField("Enter your name", text: self.$username ?? "")
///    }
/// }
/// ```
/// - Parameters:
///   - binding: The optional binding.
///   - nilPlaceholderValue: The default value used when the binding is `nil`. When this value is set, the binding is set to `nil`.
/// - Returns: A binding to a non-optional value, using the provided placeholder value if `nil`.
@MainActor
public func ?? <T: Equatable>(binding: Binding<T?>, nilPlaceholderValue: T) -> Binding<T> {
   Binding(
      get: { binding.wrappedValue ?? nilPlaceholderValue },
      set: { binding.wrappedValue = ($0 == nilPlaceholderValue ? nil : $0) }
   )
}

extension Binding where Value: ExpressibleByNilLiteral {
   /// Converts an optional `Binding` into a `Binding<Bool>` that can be used for SwiftUI presentation logic.
   /// For example, it can be used for views that require `isPresented`, such as `confirmationDialog`, when no `item:` overload exists.
   ///
   /// - Note: Setting the value to `true` is a no-op since SwiftUI APIs only reset the binding to `false` when the view is dismissed.
   ///
   /// ## Usage Example:
   /// ```swift
   /// struct ContentView: View {
   ///     @State private var optionalItem: String? = nil
   ///
   ///     var body: some View {
   ///         Button("Show Dialog") {
   ///             optionalItem = "Some Item"
   ///         }
   ///         .confirmationDialog("Title", isPresented: $optionalItem.isPresent(wrappedType: String.self)) {
   ///             Text("Dialog Content")
   ///         }
   ///     }
   /// }
   /// ```
   /// - Parameter wrappedType: The type to check if the wrapped value is present.
   /// - Returns: A binding that is `true` if the value is non-nil, and `false` otherwise.
   @MainActor
   public func isPresent<T>(wrappedType: T.Type) -> Binding<Bool> {
      Binding<Bool> {
         if let typedWrappedValue = self.wrappedValue as? Optional<T> {
            switch typedWrappedValue {
            case .none: return false
            default: return true
            }
         }
         return false
      } set: { newValue in
         if !newValue {
            self.wrappedValue = nil
         }
      }
   }
}

extension Binding where Value: SetAlgebra {
   /// Creates a binding to track whether a specific element is contained within a set.
   ///
   /// This method is particularly useful when working with SwiftUI `Toggle` controls that need to
   /// modify a set of selected items. Instead of manually creating complex bindings with get/set closures,
   /// this method provides a simple, declarative way to bind set membership to a toggle control.
   ///
   /// Example usage:
   /// ```swift
   /// struct ContentView: View {
   ///     // A set to track selected categories in a filter UI
   ///     @State private var selectedCategories: Set<String> = []
   ///
   ///     let availableCategories = ["Sports", "News", "Entertainment", "Technology"]
   ///
   ///     var body: some View {
   ///         List {
   ///             ForEach(availableCategories, id: \.self) { category in
   ///                 // Simple, declarative binding for the toggle
   ///                 Toggle(category, isOn: $selectedCategories.contains(category))
   ///             }
   ///         }
   ///         .onChange(of: selectedCategories) { newSelection in
   ///             print("Selected categories: \(newSelection)")
   ///         }
   ///     }
   /// }
   /// ```
   ///
   /// - Parameter element: The element to check for containment in the set.
   /// - Returns: A binding that can be used directly with SwiftUI toggle controls.
   ///           The binding's value is `true` when the element is in the set and `false` otherwise.
   ///           When the binding is modified, the element is either inserted into or removed from the set.
   @MainActor
   public func contains<T>(_ element: T) -> Binding<Bool> where T: Hashable, Value.Element == T {
      Binding<Bool>(
         get: { wrappedValue.contains(element) },
         set: { contains in
            if contains {
               wrappedValue.insert(element)
            } else {
               wrappedValue.remove(element)
            }
         }
      )
   }
}

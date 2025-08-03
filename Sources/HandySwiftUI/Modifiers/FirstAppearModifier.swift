import SwiftUI

struct FirstAppearModifier: ViewModifier {
   @State private var hasAppeared = false
   let perform: () -> Void

   func body(content: Content) -> some View {
      content.onAppear {
         guard !self.hasAppeared else { return }
         self.hasAppeared = true
         self.perform()
      }
   }
}

extension View {
   /// Adds a modifier that runs a closure only on the first appearance of a view,
   /// even across navigation stack transitions or view reconstructions.
   ///
   /// This is particularly useful in SwiftUI navigation scenarios where you want to perform
   /// an action only once when a view is initially displayed, but not when navigating back
   /// to it in a NavigationStack.
   ///
   /// Example usage:
   /// ```swift
   /// struct ProductListView: View {
   ///     @State private var selectedProduct: Product?
   ///     let products: [Product]
   ///
   ///     var body: some View {
   ///         List(products) { product in
   ///             ProductRow(product: product)
   ///         }
   ///         .onFirstAppear {
   ///             // Auto-select first product only once,
   ///             // not when navigating back
   ///             if let firstProduct = products.first {
   ///                 selectedProduct = firstProduct
   ///             }
   ///         }
   ///     }
   /// }
   /// ```
   ///
   /// Common use cases include:
   /// - Initial data loading or setup
   /// - One-time animations or tutorials
   /// - Analytics events that should only fire once
   /// - Auto-selection of initial values
   ///
   /// - Parameter perform: The closure to execute on first appearance.
   /// - Returns: A view with the first-appear modifier applied.
   public func onFirstAppear(perform: @escaping () -> Void) -> some View {
      self.modifier(FirstAppearModifier(perform: perform))
   }
}

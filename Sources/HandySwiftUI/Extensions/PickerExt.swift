import SwiftUI

extension Picker
where
   Label == Text,
   SelectionValue: CaseIterable & Hashable & Identifiable & CustomLabelConvertible,
   SelectionValue.AllCases: RandomAccessCollection,
   Content == ForEach<SelectionValue.AllCases, SelectionValue.ID, Text>
{
   /// Creates a picker that displays all cases of an enum conforming to `CustomLabelConvertible`,
   /// automatically creating labeled menu items from the enum's description and symbol.
   ///
   /// This initializer simplifies picker creation by eliminating the need for an explicit `ForEach`.
   ///
   /// Example usage:
   /// ```swift
   /// enum Theme: String, CaseIterable, Identifiable, CustomLabelConvertible {
   ///     case light, dark, system
   ///
   ///     var id: String { rawValue }
   ///     var description: String { rawValue.capitalized }
   ///     var symbolSystemName: String {
   ///         switch self {
   ///         case .light: "sun.max.fill"
   ///         case .dark: "moon.fill"
   ///         case .system: "gearshape.fill"
   ///         }
   ///     }
   /// }
   ///
   /// struct ThemeSelector: View {
   ///     @Binding var selectedTheme: Theme
   ///
   ///     var body: some View {
   ///         Picker("Theme", selection: $selectedTheme)
   ///             .pickerStyle(.menu)
   ///     }
   /// }
   /// ```
   ///
   /// - Parameters:
   ///   - titleKey: The key for the picker's label.
   ///   - selection: A binding to the currently selected value.
   public init(_ titleKey: LocalizedStringKey, selection: Binding<SelectionValue>) {
      self.init(titleKey, selection: selection) {
         ForEach(SelectionValue.allCases) { selectionValue in
            Label(convertible: selectionValue)
         }
      }
   }
}

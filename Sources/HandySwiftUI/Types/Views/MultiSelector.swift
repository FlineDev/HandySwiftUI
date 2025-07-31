import Foundation
import SwiftUI

/// A selector that supports choosing multiple options across a given set of options.
/// Use `Picker` for choosing exactly one option.
///
/// `MultiSelector` provides a consistent interface for multi-selection across different Apple platforms,
/// using a navigation link on iOS/tvOS and a button that presents a sheet on macOS.
///
/// # Features
/// - Supports any `Identifiable` and `Hashable` type as selectable options
/// - Custom label view
/// - Custom string representation for each option
/// - Platform-specific UI (navigation link for iOS/tvOS, sheet for macOS)
/// - Formatted string representation of selected options
///
/// # Example usage:
/// ```swift
/// struct ContentView: View {
///     struct Place: Identifiable, Hashable {
///         let name: String
///         var id: String { name }
///         var description: String { name }
///     }
///
///     @State private var preferredPlaces: Set<Place> = []
///     let availablePlaces = [
///         Place(name: "Beach"),
///         Place(name: "Mountain"),
///         Place(name: "City"),
///         Place(name: "Countryside")
///     ]
///
///     var body: some View {
///         Form {
///             MultiSelector(
///                 label: { Text("Selected Preferred Places") },
///                 optionsTitle: "Preferred Places",
///                 options: availablePlaces,
///                 selected: $preferredPlaces,
///                 optionToString: \.description
///             )
///         }
///     }
/// }
/// ```
public struct MultiSelector<Selectable: Identifiable & Hashable>: View {
   /// The view to use as the label for the multi-selector.
   public let label: AnyView

   /// The title to show in the detail view where the options can be selected.
   public let optionsTitle: String

   /// The possible options to choose from.
   public let options: [Selectable]

   /// A closure that converts the given options to their String representation.
   public let optionToString: (Selectable) -> String

   /// A binding to the set of currently selected options.
   public var selected: Binding<Set<Selectable>>

   /// A formatted string representation of the currently selected options.
   private var formattedSelectedListString: String {
      ListFormatter.localizedString(byJoining: selected.wrappedValue.map { optionToString($0) })
   }

   #if os(macOS)
      /// State variable to control the presentation of the selector sheet on macOS.
      @State private var showSelectorSheet: Bool = false
   #endif

   public var body: some View {
      #if !os(macOS)
         NavigationLink {
            MultiSelectionView(options: options, optionToString: optionToString, selected: selected)
               .navigationTitle(self.optionsTitle)
               #if os(iOS)
                  .navigationBarTitleDisplayMode(.inline)
               #endif
         } label: {
            LabeledContent {
               Text(self.formattedSelectedListString)
            } label: {
               self.label
            }
         }
      #else
         HStack(spacing: 10) {
            self.label

            Spacer()

            Text(self.selected.wrappedValue.isEmpty ? "--" : self.formattedSelectedListString)
               .foregroundStyle(Color.secondaryLabel)

            Button(String(localized: "Edit", bundle: .module)) {
               self.showSelectorSheet = true
            }
         }
         .sheet(isPresented: self.$showSelectorSheet) {
            MultiSelectionView(options: options, optionToString: optionToString, selected: selected)
               .navigationTitle(self.optionsTitle)
         }
      #endif
   }

   /// Creates a new `MultiSelector` with the specified label, options title, options, selection binding, and option-to-string conversion.
   ///
   /// - Parameters:
   ///   - label: A closure that returns the view to use as the label for the multi-selector.
   ///   - optionsTitle: The title to show in the detail view where the options can be selected.
   ///   - options: The possible options to choose from.
   ///   - selected: A binding to the set of currently selected options.
   ///   - optionToString: A closure that converts the given options to their String representation.
   public init(
      label: () -> some View,
      optionsTitle: String,
      options: [Selectable],
      selected: Binding<Set<Selectable>>,
      optionToString: @escaping (Selectable) -> String
   ) {
      self.label = label().eraseToAnyView()
      self.options = options
      self.optionsTitle = optionsTitle
      self.selected = selected
      self.optionToString = optionToString
   }
}

#if DEBUG
   #Preview {
      struct Preview: View {
         /// A simple `Identifiable` and `Hashable` struct for preview purposes.
         struct IdentifiableString: Identifiable, Hashable {
            let string: String
            var id: String { string }
         }

         @State var selected: Set<IdentifiableString> = Set(["A", "C"].map { IdentifiableString(string: $0) })

         var body: some View {
            NavigationStack {
               Form {
                  MultiSelector<IdentifiableString>(
                     label: { Text("MOCK: Multiselect").foregroundStyle(Color.green) },
                     optionsTitle: "MOCK: Multiselect",
                     options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
                     selected: self.$selected,
                     optionToString: { $0.string }
                  )
               }
               .navigationTitle("MOCK: Title")
            }
            .macOSOnly {
               $0.padding().frame(minWidth: 300, minHeight: 400)
            }
         }
      }

      return Preview()
   }
#endif

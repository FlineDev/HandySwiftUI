import Foundation
import SwiftUI

/// A selector that supports choosing multiple options across a given set of options. Use `Picker` for choosing exactly one option.
public struct MultiSelector<Selectable: Identifiable & Hashable>: View {
   /// The view to use as the label for the multi-selector.
   public let label: AnyView

   /// The title to show in the detail view where the options can be selected.
   public let optionsTitle: String

   /// The possible options to choose from.
   public let options: [Selectable]

   /// A closure that converts the given options to their String representation.
   public let optionToString: (Selectable) -> String
   
   /// A set of the currently selected options.
   public var selected: Binding<Set<Selectable>>

   private var formattedSelectedListString: String {
      ListFormatter.localizedString(byJoining: selected.wrappedValue.map { optionToString($0) })
   }

   #if os(macOS)
   @State
   var showSelectorSheet: Bool = false
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

         // TODO: localize 'Edit'
         Button("Edit") {
            self.showSelectorSheet = true
         }
      }
      .sheet(isPresented: self.$showSelectorSheet) {
         MultiSelectionView(options: options, optionToString: optionToString, selected: selected)
            .navigationTitle(self.optionsTitle)
      }
      #endif
   }
   
   /// Usage example:
   /// ```
   /// MultiSelector(
   ///   label: { Text("Selected Preferred Places") },
   ///   optionsTitle: "Preferred Places",
   ///   options: self.availablePlaces,
   ///   selected: self.$preferredPlaces,
   ///   optionToString: \.description
   /// )
   /// ```
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
      struct IdentifiableString: Identifiable, Hashable {
         let string: String
         var id: String { string }
      }

      @State
      var selected: Set<IdentifiableString> = Set(["A", "C"].map { IdentifiableString(string: $0) })

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

import SwiftUI

/// A protocol that defines a searchable option to be used in a `SearchableGridPicker`.
/// Conforming types must provide a unique identifier, a view to represent the option,
/// and a list of search terms that can be used to filter the option.
///
/// - Example:
///   A custom emoji picker where each emoji is represented by a `Text` view and searchable by related terms.
public protocol SearchableOption: Identifiable {
   associatedtype ContentView: View

   /// The view representing the searchable option.
   var view: ContentView { get }

   /// An array of search terms associated with this option.
   /// These terms will be used to filter the option during a search.
   var searchTerms: [String] { get }
}

/// A customizable grid picker that allows users to search and select from a grid of options.
/// Each option conforms to `SearchableOption` and can be filtered using a search bar.
///
/// This component is useful for building searchable, grid-based selection interfaces such as emoji pickers
/// or icon selectors in apps.
///
/// - Example:
///   An emoji picker that lets users search for emojis based on terms like "hands", "eyes", etc.
///   Users can select one emoji from the displayed grid of options.
///
/// - Parameters:
///   - title: A localized title for the picker.
///   - options: An array of selectable options conforming to `SearchableOption`.
///   - selection: A binding to the currently selected option.
@available(iOS 17, macOS 14, tvOS 17, watchOS 10, *)
public struct SearchableGridPicker<Option: SearchableOption>: View {
   let title: LocalizedStringKey
   var options: [Option]

   @Binding var selection: Option?

   @State var showPicker: Bool = Xcode.isRunningForPreviews
   @State var searchText: String = ""

   /// Filters the available options based on the entered search text.
   /// If the search text is empty, all options are displayed.
   var filteredOptions: [Option] {
      if self.searchText.isBlank {
         return self.options
      } else {
         let searchTokens = self.searchText.tokenized()
         return self.options.filter { option in
            searchTokens.allSatisfy { searchToken in
               option.searchTerms.map { searchTerm in
                  searchTerm.folding(options: [.caseInsensitive, .diacriticInsensitive, .widthInsensitive], locale: Locale.current)
               }.contains { $0.hasPrefix(searchToken) }
            }
         }
      }
   }

   /// Initializes a `SearchableGridPicker` with a title, a list of options, and a binding to the selection.
   ///
   /// - Parameters:
   ///   - title: A localized string key to represent the title of the picker.
   ///   - options: An array of options conforming to `SearchableOption`.
   ///   - selection: A binding to the selected option. The selection will be updated when the user selects an option.
   public init(title: LocalizedStringKey, options: [Option], selection: Binding<Option?>) {
      self.title = title
      self.options = options
      self._selection = selection
   }

   public var body: some View {
      Button {
         self.showPicker = true
      } label: {
         ZStack {
            HStack {
               Text(self.title)
                  .foregroundStyle(.secondary)

               Spacer()

               HStack {
                  if let selection {
                     selection.view.scaleEffect(0.75)
                  } else {
                     Text("None")
                  }

                  Image(systemName: "chevron.right")
               }
               .foregroundStyle(.secondary)
            }

            Color.gray.opacity(0.001)
         }
      }
      .buttonStyle(.plain)
      .navigationDestination(isPresented: self.$showPicker) {
         Group {
            if self.filteredOptions.isEmpty {
               ContentUnavailableView("No matches", systemImage: "exclamationmark.magnifyingglass", description: Text("No emojis match '\(self.searchText)'"))
                  .frame(maxHeight: .infinity, alignment: .center)
            } else {
               ScrollView {
                  LazyVGrid(columns: [GridItem(.adaptive(minimum: Platform.value(default: 44, mac: 38, vision: 60)))]) {
                     ForEach(filteredOptions) { option in
                        Button {
                           self.selection = option
                           self.showPicker = false
                        } label: {
                           ZStack {
                              option.view
                                 .padding(Platform.value(default: 15, mac: 12))
                                 #if os(visionOS)
                                 .contentShape(.hoverEffect, .rect(cornerRadius: 15))
                                 .hoverEffect()
                                 #endif

                              Color.gray.opacity(0.001)
                           }
                        }
                        .buttonStyle(.plain)
                     }
                  }
               }
               .contentMargins(.horizontal, Platform.value(default: 10, vision: 25), for: .scrollContent)
            }
         }
         .navigationTitle(self.title)
         #if os(macOS)
         .searchable(text: self.$searchText)
         #else
         .searchable(text: self.$searchText, placement: .navigationBarDrawer)
         #endif
      }
   }
}

#if DEBUG && swift(>=6.0)
struct FakeOption: SearchableOption {
   let id = UUID()

   var view: some View {
      Text(verbatim: ["👇", "🚀", "🙏", "🚨", "🤷‍♂️"].randomElement()!)
   }

   var searchTerms: [String] = [
      ["one", "two", "three", "four"].randomElement()!,
      ["hands", "eyes", "ears", "rockets", "legs"].randomElement()!
   ]
}

@available(iOS 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
#Preview(traits: .fixedLayout(width: 500, height: 100)) {
   @Previewable @State var selection: FakeOption?

   NavigationStack {
      Form {
         SearchableGridPicker(
            title: "Pick Emoji",
            options: [
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
               FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(), FakeOption(),
            ],
            selection: $selection
         )
      }
      .formStyle(.grouped)
   }
   #if os(visionOS) || os(macOS)
   .frame(minWidth: 600, minHeight: 400)
   #endif
}
#endif

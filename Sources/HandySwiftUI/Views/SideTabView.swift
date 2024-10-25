#if !os(tvOS)
import SwiftUI

/// A navigation container that presents a vertical sidebar of tabs optimized for larger screens.
///
/// `SideTabView` is designed as a more sophisticated alternative to SwiftUI's `TabView` for applications
/// that need a sidebar-style navigation, commonly used on macOS and iPadOS. It provides a consistent
/// navigation experience across Apple platforms while being optimized for larger displays.
///
/// Key features:
/// - Vertical tab layout with icons and labels
/// - Support for bottom-aligned tabs (e.g., for settings)
/// - Platform-specific styling and spacing
/// - Hover effects on visionOS/iOS/iPadOS
/// - Full customization of tab content
///
/// Example usage for a document-based app:
/// ```swift
/// enum NavigationTab: String, Identifiable, CustomLabelConvertible, CaseIterable {
///     case documents = "folder"
///     case recents = "clock"
///     case favorites = "star"
///     case tags = "tag"
///     case settings = "gear"
///
///     var id: Self { self }
///     var description: String {
///         switch self {
///         case .documents: "Documents"
///         case .recents: "Recents"
///         case .favorites: "Favorites"
///         case .tags: "Tags"
///         case .settings: "Settings"
///         }
///     }
///     var symbolName: String { rawValue }
/// }
///
/// struct ContentView: View {
///     @State private var selectedTab: NavigationTab = .documents
///
///     var body: some View {
///         SideTabView(
///             selection: $selectedTab,
///             bottomAlignedTabs: 1  // Place settings tab at the bottom
///         ) { tab in
///             switch tab {
///             case .documents:
///                 DocumentsList()
///             case .recents:
///                 RecentDocuments()
///             case .favorites:
///                 FavoritesList()
///             case .tags:
///                 TagsView()
///             case .settings:
///                 SettingsView()
///             }
///         }
///     }
/// }
/// ```
public struct SideTabView<Tab: Identifiable & CustomLabelConvertible & CaseIterable, Content: View>: View {
   @Binding private var selectedTab: Tab
   private let bottomAlignedTabs: Int
   private let content: (Tab) -> Content

   /// Creates a new side tab navigation view.
   ///
   /// - Parameters:
   ///   - selection: A binding to the currently selected tab
   ///   - bottomAlignedTabs: The number of tabs to align at the bottom of the sidebar.
   ///     This is commonly used to place settings or configuration tabs at the bottom
   ///     of the navigation, separated from the main navigation items.
   ///   - content: A view builder that creates the content view for each tab.
   ///     The view builder receives the currently selected tab as a parameter.
   ///
   /// Example creating a side tab view with settings at the bottom:
   /// ```swift
   /// SideTabView(
   ///     selection: $selectedTab,
   ///     bottomAlignedTabs: 1  // Places the last tab at the bottom
   /// ) { tab in
   ///     switch tab {
   ///     case .inbox:
   ///         InboxView()
   ///     case .drafts:
   ///         DraftsView()
   ///     case .sent:
   ///         SentView()
   ///     case .settings:  // This tab will appear at the bottom
   ///         SettingsView()
   ///     }
   /// }
   /// ```
   public init(
      selection: Binding<Tab>,
      bottomAlignedTabs: Int = 0,
      @ViewBuilder content: @escaping (Tab) -> Content
   ) {
      self._selectedTab = selection
      self.bottomAlignedTabs = bottomAlignedTabs
      self.content = content
   }

   public var body: some View {
      HStack(spacing: 0) {
         GroupBox {
            VStack(spacing: 0) {
               ForEach(Array(Tab.allCases)) { tab in
                  let tabIndex: Int = Tab.allCases.firstIndex(where: { $0.id == tab.id })! as! Int
                  let selectedTabIndex: Int = Tab.allCases.firstIndex(where: { $0.id == self.selectedTab.id })! as! Int
                  let isSelected: Bool = self.selectedTab.id == tab.id

                  Button {
                     self.selectedTab = tab
                  } label: {
                     VStack(spacing: Platform.value(default: 10.0, phone: 5.0)) {
                        Image(convertible: tab)
                           .symbolVariant(isSelected ? .fill : .none)
                           .font(Platform.value(default: .title, phone: .title2))


                        Text(convertible: tab)
                           .font(Platform.value(default: .body, phone: .footnote))
                           .fontWeight(isSelected ? .medium : .regular)
                           .multilineTextAlignment(.center)
                           .minimumScaleFactor(0.75)
                           .lineLimit(2)
                     }
                     .padding(Platform.value(default: 10.0, phone: 6.0))
                     .frame(maxWidth: .infinity)
                     .applyIf(self.selectedTab.id == tab.id) {
                        $0.background {
                           Color.accentColor.opacity(0.4).clipShape(.rect(cornerRadius: 3))
                        }
                     }
                     .background(Color.systemBackground.opacity(0.001))
                     #if !os(macOS)
                     .contentShape(.hoverEffect, .rect(cornerRadius: 3))
                     .hoverEffect()
                     #endif
                  }
                  .buttonStyle(.plain)

                  if tabIndex == (Tab.allCases.count - 1 - self.bottomAlignedTabs) {
                     Spacer()
                  } else if !isSelected, tabIndex + 1 != selectedTabIndex, tabIndex + 1 != Tab.allCases.count {
                     Divider()
                        .opacity(Platform.value(default: 0.5, mac: 1.0))
                        .padding(.horizontal, 3)
                  }
               }
            }
            .padding(Platform.value(default: -10, mac: 0))
         }
         .frame(maxWidth: Platform.value(default: 100.0, phone: 76.0))
         .padding(10)

         self.content(self.selectedTab)
            .id(self.selectedTab.id)
            .frame(maxWidth: .infinity)
      }
   }
}

#if DEBUG
#Preview {
   struct Preview: View {
      enum Tab: String, Identifiable, CustomLabelConvertible, CaseIterable {
         case house, pencil, gear

         var id: Self { self }
         var description: String { self.rawValue.firstUppercased }
         var symbolName: String { self.rawValue }
      }

      @State private var selectedTab: Tab = .house

      var body: some View {
         SideTabView(selection: self.$selectedTab, bottomAlignedTabs: 1) { selectedTab in
            Text(verbatim: "Content of \(selectedTab.rawValue.firstUppercased)")
         }
      }
   }

   return Preview().macOSOnlyFrame(minWidth: 800, minHeight: 600)
}
#endif
#endif

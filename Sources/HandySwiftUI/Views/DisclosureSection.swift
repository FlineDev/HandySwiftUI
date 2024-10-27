import SwiftUI

/// A more flexible alternative to `DisclosureGroup` that allows toggling by tapping anywhere on the label, supports custom headers and even footers.
public struct DisclosureSection<Content: View, Label: View, Footer: View>: View {
   @State private var isExpanded: Bool = false

   private let content: () -> Content
   private let label: () -> Label
   private let footer: () -> Footer

   /// Initializes a `DisclosureSection` with a localized title and content.
   ///
   /// - Parameters:
   ///   - titleKey: The localized key for the section title.
   ///   - content: A closure that returns the content to be displayed when the section is expanded.
   ///
   /// **Example:**
   /// ```swift
   /// DisclosureSection("Account Settings") {
   ///     // Content to be displayed when the section is expanded
   /// }
   /// ```
   public init(
      _ titleKey: LocalizedStringKey,
      @ViewBuilder content: @escaping () -> Content
   ) where Label == Text, Footer == EmptyView {
      self.content = content
      self.label = { Text(titleKey) }
      self.footer = { EmptyView() }
   }

   /// Initializes a `DisclosureSection` with a localized title, content, and footer.
   ///
   /// - Parameters:
   ///   - titleKey: The localized key for the section title.
   ///   - content: A closure that returns the content to be displayed when the section is expanded.
   ///   - footer: A closure that returns the footer content to be displayed when the section is expanded.
   ///
   /// **Example:**
   /// ```swift
   /// DisclosureSection("Account Settings") {
   ///     // Content to be displayed when the section is expanded
   /// } footer: {
   ///     // Footer content to be displayed when the section is expanded
   /// }
   /// ```
   public init(
      _ titleKey: LocalizedStringKey,
      @ViewBuilder content: @escaping () -> Content,
      @ViewBuilder footer: @escaping () -> Footer
   ) where Label == Text {
      self.content = content
      self.label = { Text(titleKey) }
      self.footer = footer
   }

   /// Initializes a `DisclosureSection` with custom label and content.
   ///
   /// - Parameters:
   ///   - content: A closure that returns the content to be displayed when the section is expanded.
   ///   - label: A closure that returns the custom label view.
   ///
   /// **Example:**
   /// ```swift
   /// DisclosureSection {
   ///     // Content to be displayed when the section is expanded
   /// } label: {
   ///     HStack {
   ///         Image(systemName: "gear")
   ///         Text("Settings")
   ///     }
   /// }
   /// ```
   public init(
      @ViewBuilder content: @escaping () -> Content,
      @ViewBuilder label: @escaping () -> Label
   ) where Footer == EmptyView {
      self.content = content
      self.label = label
      self.footer = { EmptyView() }
   }

   /// Initializes a `DisclosureSection` with custom label, content, and footer.
   ///
   /// - Parameters:
   ///   - content: A closure that returns the content to be displayed when the section is expanded.
   ///   - label: A closure that returns the custom label view.
   ///   - footer: A closure that returns the custom footer view.
   ///
   /// **Example:**
   /// ```swift
   /// DisclosureSection {
   ///     // Content to be displayed when the section is expanded
   /// } label: {
   ///     HStack {
   ///         Image(systemName: "gear")
   ///         Text("Settings")
   ///     }
   /// } footer: {
   ///     // Custom footer view
   /// }
   /// ```
   public init(
      @ViewBuilder content: @escaping () -> Content,
      @ViewBuilder label: @escaping () -> Label,
      @ViewBuilder footer: @escaping () -> Footer
   ) {
      self.content = content
      self.label = label
      self.footer = footer
   }

   public var body: some View {
      Section {
         Button {
            withAnimation {
               self.isExpanded.toggle()
            }
         } label: {
            HStack {
               Image(systemName: self.isExpanded ? "chevron.down" : "chevron.forward")
                  .frame(width: 6)
                  .font(.footnote.weight(.bold))

               self.label()

               Color.gray.frame(maxWidth: .infinity).opacity(0.001)
            }
            .font(.body.weight(.medium))
            .foregroundStyle(self.isExpanded ? .secondary : .primary)
         }
         .buttonStyle(.plain)

         if self.isExpanded {
            self.content()
         }
      } footer: {
         if self.isExpanded {
            self.footer()
         }
      }
   }
}

#if DEBUG && !os(tvOS)
#Preview {
   Form {
      DisclosureGroup("Original Disclosure Group") {
         Text("Test")
      }

      DisclosureSection("Custom Disclosure Section") {
         Text("Test")
         Text("Test")
      }
   }
   .formStyle(.grouped)
}
#endif


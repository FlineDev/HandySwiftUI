import SwiftUI

/// A secondary button style with customizable appearances for default, disabled, and compact states.
public struct SecondaryButtonStyle: ButtonStyle {
   let disabled: Bool
   let compact: Bool

   /// Creates a new `SecondaryButtonStyle`.
   ///
   /// - Parameters:
   ///   - disabled: Whether the button should be disabled. Defaults to `false`.
   ///   - compact: Whether the button should use a compact style. Defaults to `false`.
   public init(disabled: Bool = false, compact: Bool = false) {
      self.disabled = disabled
      self.compact = compact
   }

   public func makeBody(configuration: Configuration) -> some View {
      configuration.label
         .padding(.vertical, self.compact ? 4 : 8)
         .padding(.horizontal, self.compact ? 8 : 16)
         .font(self.compact ? .body : .title3)
         .foregroundStyle(self.disabled ? .secondary : (configuration.isPressed ? Color.white : Color.accentColor))
         .background(self.backgroundColor(configuration: configuration))
         .clipShape(.rect(cornerRadius: self.compact ? 6 : 11))
         .roundedRectangleBorder(self.disabled ? .clear : .secondary, cornerRadius: self.compact ? 6 : 12, lineWidth: 0.5)
   }

   func backgroundColor(configuration: Configuration) -> Color {
      if self.disabled {
         Color.secondary.opacity(0.1618)
      } else if configuration.role == .destructive {
         Color.red.opacity(configuration.isPressed ? 0.66 : 1)
      } else {
         configuration.isPressed ? Color.accentColor : .clear
      }
   }
}

extension ButtonStyle where Self == SecondaryButtonStyle {
   /// Creates a secondary button style.
   ///
   /// - Parameters:
   ///   - disabled: Whether the button should be disabled. Defaults to `false`.
   ///   - compact: Whether the button should use a compact style. Defaults to `false`.
   ///
   /// **Example:**
   /// ```swift
   /// Button("Secondary Button") {}
   ///     .buttonStyle(.secondary())
   /// ```
   public static func secondary(disabled: Bool = false, compact: Bool = false) -> Self {
      SecondaryButtonStyle(disabled: disabled, compact: compact)
   }
}

#if DEBUG
   #Preview {
      VStack {
         Button("Default", systemImage: "person") {}
            .buttonStyle(.secondary())

         Button("Disabled", systemImage: "person") {}
            .buttonStyle(.secondary(disabled: true))

         Button("Compact", systemImage: "person") {}
            .buttonStyle(.secondary(compact: true))

         Button("System", systemImage: "person") {}
            .buttonStyle(.bordered)
      }
      .padding()
   }
#endif

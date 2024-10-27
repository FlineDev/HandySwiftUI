import SwiftUI

/// A primary button style with customizable appearances for default, disabled, and compact states.
public struct PrimaryButtonStyle: ButtonStyle {
   let disabled: Bool
   let compact: Bool

   /// Creates a new `PrimaryButtonStyle`.
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
         .foregroundStyle(self.disabled ? .white.opacity(0.66) : .white)
         .background(self.backgroundColor(configuration: configuration))
         .clipShape(.rect(cornerRadius: self.compact ? 6 : 11))
   }

   func backgroundColor(configuration: Configuration) -> Color {
      if self.disabled {
         Color.gray
      } else if configuration.role == .destructive {
         Color.red.opacity(configuration.isPressed ? 0.66 : 1)
      } else {
         Color.accentColor.opacity(configuration.isPressed ? 0.66 : 1)
      }
   }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
   /// Creates a primary button style.
   ///
   /// - Parameters:
   ///   - disabled: Whether the button should be disabled. Defaults to `false`.
   ///   - compact: Whether the button should use a compact style. Defaults to `false`.
   ///
   /// **Example:**
   /// ```swift
   /// Button("Primary Button") {}
   ///     .buttonStyle(.primary())
   /// ```
   public static func primary(disabled: Bool = false, compact: Bool = false) -> Self {
      PrimaryButtonStyle(disabled: disabled, compact: compact)
   }
}

#if DEBUG
#Preview {
   VStack {
      Button("Default", systemImage: "person") {}
         .buttonStyle(.primary())

      Button("Disabled", systemImage: "person") {}
         .buttonStyle(.primary(disabled: true))

      Button("Compact", systemImage: "person") {}
         .buttonStyle(.primary(compact: true))

      Button("System", systemImage: "person") {}
         .buttonStyle(.borderedProminent)
   }
   .padding()
}
#endif

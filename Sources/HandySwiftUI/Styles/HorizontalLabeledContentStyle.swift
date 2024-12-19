import SwiftUI

/// A labeled content style that arranges the label and content horizontally. Useful for getting the iOS-like behavior on macOS when outside a grouped form.
public struct HorizontalLabeledContentStyle: LabeledContentStyle {
   let muteContent: Bool

   public func makeBody(configuration: Configuration) -> some View {
      HStack {
         configuration.label

         Spacer()

         configuration.content
            .foregroundStyle(.secondary)
      }
   }
}

extension LabeledContentStyle where Self == HorizontalLabeledContentStyle {
   /// Creates a `HorizontalLabeledContentStyle` with customizable properties.
   ///
   /// - Parameters:
   ///   - muteContent: Whether to mute the content (default: true).
   /// - Returns: A new `HorizontalLabeledContentStyle` instance.
   public static func horizontal(muteContent: Bool = true) -> HorizontalLabeledContentStyle {
      HorizontalLabeledContentStyle(muteContent: muteContent)
   }
}

#if DEBUG
#Preview {
   VStack {
      Form {
         LabeledContent("Default Key", value: "Some Value")

         LabeledContent("Horizontal Key", value: "Some Value")
            .labeledContentStyle(.horizontal())
      }
      .formStyle(.grouped)

      GroupBox {
         LabeledContent("Default Key", value: "Some Value")
            .padding(5)

         Divider()

         LabeledContent("Horizontal Key", value: "Some Value")
            .labeledContentStyle(.horizontal())
            .padding(5)
      }
      .macOSOnlyPadding()
   }
}
#endif

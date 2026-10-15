import SwiftUI
import Testing

@testable import HandySwiftUI

@MainActor
struct HorizontalLabeledContentStyleTests {
   func labeledContent(muteContent: Bool) -> some View {
      LabeledContent {
         Text(verbatim: "Content")
      } label: {
         Text(verbatim: "Label")
      }
      .labeledContentStyle(.horizontal(muteContent: muteContent))
      .frame(width: 200)
   }

   func reference(contentStyle: HierarchicalShapeStyle) -> some View {
      HStack {
         Text(verbatim: "Label")
         Spacer()
         Text(verbatim: "Content").foregroundStyle(contentStyle)
      }
      .frame(width: 200)
   }

   @Test
   func mutedContentIsSecondary() throws {
      let muted = try #require(renderedPixels(of: self.labeledContent(muteContent: true)))
      #expect(muted == renderedPixels(of: self.reference(contentStyle: .secondary)))
   }

   @Test
   func unmutedContentIsPrimary() throws {
      let unmuted = try #require(renderedPixels(of: self.labeledContent(muteContent: false)))
      #expect(unmuted == renderedPixels(of: self.reference(contentStyle: .primary)))
   }
}

import SwiftUI

/// Renders a view into raw pixel data so that two renderings can be compared for equality.
@MainActor
func renderedPixels(of view: some View) -> Data? {
   let renderer = ImageRenderer(content: view)
   renderer.scale = 1
   guard let cgImage = renderer.cgImage else { return nil }
   return cgImage.dataProvider?.data as Data?
}

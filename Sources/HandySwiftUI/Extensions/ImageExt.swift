import SwiftUI

extension Image {
   /// Creates an ``Image`` view using the `symbolName` parameter of the provided ``CustomSymbolConvertible`` instance.
   public init(convertible: CustomSymbolConvertible, variableValue: Double? = nil) {
      self.init(systemName: convertible.symbolName, variableValue: variableValue)
   }
}

#if os(macOS)
import AppKit
import UniformTypeIdentifiers

extension NSImage {
   public func pngData() -> Data? {
      guard
         let tiffRepresentation = self.tiffRepresentation,
         let bitmapImage = NSBitmapImageRep(data: tiffRepresentation)
      else { return nil }

      return bitmapImage.representation(using: .png, properties: [:])
   }

   public func jpegData(compressionQuality: Double) -> Data? {
      guard
         let tiffRepresentation = self.tiffRepresentation,
         let bitmapImage = NSBitmapImageRep(data: tiffRepresentation)
      else { return nil }

      return bitmapImage.representation(
         using: .jpeg2000,
         properties: [NSBitmapImageRep.PropertyKey.compressionFactor: NSNumber(value: compressionQuality)]
      )
   }

   public func resized(width: Double, height: Double) -> NSImage? {
      let newSize = NSSize(width: width * 3, height: height * 3)

      if let bitmapRep = NSBitmapImageRep(
         bitmapDataPlanes: nil, pixelsWide: Int(newSize.width), pixelsHigh: Int(newSize.height),
         bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false,
         colorSpaceName: .calibratedRGB, bytesPerRow: 0, bitsPerPixel: 0
      ) {
         bitmapRep.size = newSize
         NSGraphicsContext.saveGraphicsState()
         NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: bitmapRep)
         draw(in: NSRect(x: 0, y: 0, width: newSize.width, height: newSize.height), from: .zero, operation: .copy, fraction: 1.0)
         NSGraphicsContext.restoreGraphicsState()

         let resizedImage = NSImage(size: newSize)
         resizedImage.addRepresentation(bitmapRep)
         return resizedImage
      }

      return nil
   }

   public func heicData() -> Data? {
      if let cgImage = self.cgImage(forProposedRect: nil, context: nil, hints: nil) {
         let mutableData = NSMutableData()

         if let destination = CGImageDestinationCreateWithData(mutableData, UTType.heic.identifier as CFString, 1, nil) {
            CGImageDestinationAddImage(destination, cgImage, nil)
            if CGImageDestinationFinalize(destination) {
               return mutableData as Data
            }
         }
      }

      return nil
   }
}
#else
import UIKit

extension UIImage {
   public func resized(width: Double, height: Double) -> UIImage? {
      let newSize = CGSize(width: width, height: height)
      let image = UIGraphicsImageRenderer(size: newSize).image { _ in
         draw(in: CGRect(origin: .zero, size: newSize))
      }

      return image.withRenderingMode(renderingMode)
   }
}
#endif

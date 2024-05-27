import SwiftUI
import UniformTypeIdentifiers

extension Image {
   /// Creates an ``Image`` view using the `symbolName` parameter of the provided ``CustomSymbolConvertible`` instance.
   public init(convertible: CustomSymbolConvertible, variableValue: Double? = nil) {
      self.init(systemName: convertible.symbolName, variableValue: variableValue)
   }
}

#if os(macOS)
import AppKit

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

   public func resized(maxWidth: CGFloat, maxHeight: CGFloat) -> NSImage? {
      let size = self.size
      let widthRatio = maxWidth / size.width
      let heightRatio = maxHeight / size.height
      let scaleFactor = min(widthRatio, heightRatio)

      let newSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)

      let newImage = NSImage(size: newSize)
      newImage.lockFocus()
      let context = NSGraphicsContext.current
      context?.imageInterpolation = .high
      self.draw(in: NSRect(origin: .zero, size: newSize), from: NSRect(origin: .zero, size: self.size), operation: .copy, fraction: 1.0)
      newImage.unlockFocus()

      return newImage
   }

   public func heicData(compressionQuality: CGFloat) -> Data? {
      if let cgImage = self.cgImage(forProposedRect: nil, context: nil, hints: nil) {
         let mutableData = NSMutableData()

         if let destination = CGImageDestinationCreateWithData(mutableData, UTType.heic.identifier as CFString, 1, nil) {
            CGImageDestinationAddImage(destination, cgImage, [kCGImageDestinationLossyCompressionQuality: compressionQuality] as CFDictionary)
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
   public func resized(maxWidth: CGFloat, maxHeight: CGFloat) -> UIImage? {
      let size = self.size
      let widthRatio = maxWidth / size.width
      let heightRatio = maxHeight / size.height
      let scaleFactor = min(widthRatio, heightRatio)

      let newSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)

      let renderer = UIGraphicsImageRenderer(size: newSize)
      let image = renderer.image { _ in
         self.draw(in: CGRect(origin: .zero, size: newSize))
      }

      return image.withRenderingMode(self.renderingMode)
   }

   public func heicData(compressionQuality: CGFloat) -> Data? {
      if let cgImage = self.cgImage {
         let mutableData = NSMutableData()

         if let destination = CGImageDestinationCreateWithData(mutableData, UTType.heic.identifier as CFString, 1, nil) {
            CGImageDestinationAddImage(destination, cgImage, [kCGImageDestinationLossyCompressionQuality: compressionQuality] as CFDictionary)
            if CGImageDestinationFinalize(destination) {
               return mutableData as Data
            }
         }
      }

      return nil
   }
}
#endif

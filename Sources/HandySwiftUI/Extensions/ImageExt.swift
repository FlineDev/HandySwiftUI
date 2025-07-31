import SwiftUI
import UniformTypeIdentifiers

extension Image {
   /// Creates an `Image` view using the `symbolName` of the provided `CustomSymbolConvertible` instance.
   ///
   /// - Parameters:
   ///   - convertible: An instance conforming to `CustomSymbolConvertible`.
   ///   - variableValue: An optional value for variable value symbols.
   ///
   /// - Returns: An `Image` view representing the system symbol.
   ///
   /// - Example:
   ///   ```swift
   ///   struct CustomSymbol: CustomSymbolConvertible {
   ///       var symbolName: String { "star.fill" }
   ///   }
   ///
   ///   let symbol = CustomSymbol()
   ///   let imageView = Image(convertible: symbol)
   ///   ```
   public init(convertible: CustomSymbolConvertible, variableValue: Double? = nil) {
      self.init(systemName: convertible.symbolName, variableValue: variableValue)
   }
}

#if os(macOS)
   import AppKit

   extension NSImage {
      /// Converts the image to PNG data.
      ///
      /// - Returns: PNG data representation of the image, or `nil` if conversion fails.
      public func pngData() -> Data? {
         guard
            let tiffRepresentation = self.tiffRepresentation,
            let bitmapImage = NSBitmapImageRep(data: tiffRepresentation)
         else { return nil }

         return bitmapImage.representation(using: .png, properties: [:])
      }

      /// Converts the image to JPEG data with specified compression quality.
      ///
      /// - Parameter compressionQuality: The compression quality to use (0.0 to 1.0).
      /// - Returns: JPEG data representation of the image, or `nil` if conversion fails.
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

      /// Resizes the image to fit within the specified maximum width and height.
      ///
      /// - Parameters:
      ///   - maxWidth: The maximum width for the resized image.
      ///   - maxHeight: The maximum height for the resized image.
      /// - Returns: A new `NSImage` instance with the resized dimensions, or `nil` if resizing fails.
      public func resized(maxWidth: CGFloat, maxHeight: CGFloat) -> NSImage? {
         let size = self.size
         if size.width <= maxWidth && size.height <= maxHeight { return self }

         let screenScale = NSScreen.main?.backingScaleFactor ?? 1.0
         let widthRatio = (maxWidth / screenScale) / size.width
         let heightRatio = (maxHeight / screenScale) / size.height
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

      /// Converts the image to HEIC data with specified compression quality.
      ///
      /// - Parameter compressionQuality: The compression quality to use (0.0 to 1.0).
      /// - Returns: HEIC data representation of the image, or `nil` if conversion fails.
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
      /// Resizes the image to fit within the specified maximum width and height.
      ///
      /// - Parameters:
      ///   - maxWidth: The maximum width for the resized image.
      ///   - maxHeight: The maximum height for the resized image.
      /// - Returns: A new `UIImage` instance with the resized dimensions, or `nil` if resizing fails.
      @MainActor
      public func resized(maxWidth: CGFloat, maxHeight: CGFloat) -> UIImage? {
         let size = self.size
         if size.width <= maxWidth && size.height <= maxHeight { return self }

         #if os(visionOS)
            let screenScale = 1.0
         #else
            let screenScale = UIScreen.main.scale
         #endif
         let widthRatio = (maxWidth / screenScale) / size.width
         let heightRatio = (maxHeight / screenScale) / size.height
         let scaleFactor = min(widthRatio, heightRatio)

         let newSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)

         let renderer = UIGraphicsImageRenderer(size: newSize)
         let image = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
         }

         return image.withRenderingMode(self.renderingMode)
      }

      /// Converts the image to HEIC data with specified compression quality.
      ///
      /// - Parameter compressionQuality: The compression quality to use (0.0 to 1.0).
      /// - Returns: HEIC data representation of the image, or `nil` if conversion fails.
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

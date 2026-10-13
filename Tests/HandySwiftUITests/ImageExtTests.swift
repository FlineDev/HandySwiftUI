#if os(macOS)
   import AppKit
   import Testing

   @testable import HandySwiftUI

   struct ImageExtTests {
      @Test
      func jpegDataEncodesAsJPEG() throws {
         let image = NSImage(size: NSSize(width: 8, height: 8), flipped: false) { rect in
            NSColor.systemRed.setFill()
            rect.fill()
            return true
         }

         let data = try #require(image.jpegData(compressionQuality: 0.8))

         // Every JPEG file starts with the SOI marker followed by the next marker's 0xFF (JPEG 2000 starts with 0x00 0x00 0x00 0x0C)
         #expect(Array(data.prefix(3)) == [0xFF, 0xD8, 0xFF])
      }
   }
#endif

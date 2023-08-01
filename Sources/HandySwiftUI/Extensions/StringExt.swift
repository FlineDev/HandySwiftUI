import Foundation

extension String {
   public func toRGBA() -> (r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
      var normalizedHex = self.trimmingCharacters(in: .whitespacesAndNewlines)
      normalizedHex = normalizedHex.replacingOccurrences(of: "#", with: "")

      var rgb: UInt64 = 0

      var r: CGFloat = 0.0
      var g: CGFloat = 0.0
      var b: CGFloat = 0.0
      var a: CGFloat = 1.0

      let length = normalizedHex.count

      Scanner(string: normalizedHex).scanHexInt64(&rgb)

      if length == 6 {
         r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
         g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
         b = CGFloat(rgb & 0x0000FF) / 255.0
      } else if length == 8 {
         r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
         g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
         b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
         a = CGFloat(rgb & 0x000000FF) / 255.0
      }

      return (r, g, b, a)
   }
}

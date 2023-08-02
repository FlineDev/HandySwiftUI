import SwiftUI

fileprivate struct PreviewVariant: ViewModifier {
   enum PhoneSize: String {
      case small = "iPhone SE (2nd generation)"
      case medium = "iPhone 12 mini"
      case large = "iPhone 12 Pro Max"
   }
   
   enum PadSize: String {
      case small = "iPad (8th generation)"
      case medium = "iPad Air (4th generation)"
      case large = "iPad Pro (12.9-inch) (4th generation)"
   }
   
   static func spacious(tablet: Bool) -> PreviewVariant {
      PreviewVariant(
         deviceName: tablet ? PadSize.large.rawValue : PhoneSize.large.rawValue,
         colorScheme: .dark,
         sizeCategory: .small
      )
   }
   
   static func medium(tablet: Bool) -> PreviewVariant {
      PreviewVariant(
         deviceName: tablet ? PadSize.medium.rawValue : PhoneSize.medium.rawValue,
         colorScheme: .light,
         sizeCategory: .medium
      )
   }
   
   static func narrow(tablet: Bool) -> PreviewVariant {
      PreviewVariant(
         deviceName: tablet ? PadSize.small.rawValue : PhoneSize.small.rawValue,
         colorScheme: .dark,
         sizeCategory: .extraExtraExtraLarge
      )
   }
   
   let deviceName: String
   let colorScheme: ColorScheme
   let sizeCategory: ContentSizeCategory
   
   func body(content: Content) -> some View {
      let details = "\(sizeCategory)-\(String(describing: colorScheme).capitalized)"
      return content.previewDevice(PreviewDevice(rawValue: deviceName))
         .previewDisplayName("\(deviceName): \(details)")
         .preferredColorScheme(colorScheme)
         .environment(\.sizeCategory, sizeCategory)
   }
}

extension View {
   /// Renders `PreviewProvider` body views in 3 different screen variants: A narrow one, a normal one and a spacious one.
   ///
   /// - Parameters:
   ///   - narrowLanguage: Override the default preview language setting for the narrow preview with an custom language code.
   ///   - spaciousLanguage: Override the default preview language setting for the spacious preview with an custom language code.
   public func previewScreens(tablet: Bool = false, narrowLanguage: String? = nil, spaciousLanguage: String? = nil) -> some View {
      Group {
         modifier(PreviewVariant.narrow(tablet: tablet))
            .applyIf(narrowLanguage != nil) {
               $0.environment(\.locale, .init(identifier: narrowLanguage!))
            }
         modifier(PreviewVariant.medium(tablet: tablet))
         modifier(PreviewVariant.spacious(tablet: tablet))
            .applyIf(spaciousLanguage != nil) {
               $0.environment(\.locale, .init(identifier: spaciousLanguage!))
            }
      }
   }
   
   /// Renders `PreviewProvider` body views in 3 different component variants: A narrow one, a normal one and a spacious one.
   ///
   /// - Parameters:
   ///   - narrowLanguage: Override the default preview language setting for the narrow preview with an custom language code.
   ///   - spaciousLanguage: Override the default preview language setting for the spacious preview with an custom language code.
   public func previewComponents(tablet: Bool = false, narrowLanguage: String? = nil, spaciousLanguage: String? = nil) -> some View {
      previewScreens(tablet: tablet, narrowLanguage: narrowLanguage, spaciousLanguage: spaciousLanguage).previewLayout(.sizeThatFits)
   }
}

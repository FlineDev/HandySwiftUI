import SwiftUI

fileprivate struct PreviewVariant: ViewModifier {
  enum PhoneSize: String {
    case small = "iPhone SE (2nd generation)"
    case medium = "iPhone 12 mini"
    case large = "iPhone 12 Pro Max"
  }

  static let spacious: PreviewVariant = PreviewVariant(
    phoneSize: .large,
    colorScheme: .dark,
    sizeCategory: .small
  )

  static let normal: PreviewVariant = PreviewVariant(
    phoneSize: .medium,
    colorScheme: .light,
    sizeCategory: .medium
  )

  static let narrow: PreviewVariant = PreviewVariant(
    phoneSize: .small,
    colorScheme: .dark,
    sizeCategory: .extraExtraExtraLarge
  )

  let phoneSize: PhoneSize
  let colorScheme: ColorScheme
  let sizeCategory: ContentSizeCategory

  func body(content: Content) -> some View {
    let details = "\(sizeCategory)-\(String(describing: colorScheme).capitalized)"
    return content.previewDevice(PreviewDevice(rawValue: phoneSize.rawValue))
      .previewDisplayName("\(phoneSize.rawValue): \(details)")
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
  public func previewScreens(narrowLanguage: String? = nil, spaciousLanguage: String? = nil) -> some View {
    Group {
      modifier(PreviewVariant.narrow)
        .applyIf(narrowLanguage != nil) {
          $0.environment(\.locale, .init(identifier: narrowLanguage!))
        }
      modifier(PreviewVariant.normal)
      modifier(PreviewVariant.spacious)
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
  public func previewComponents(narrowLanguage: String? = nil, spaciousLanguage: String? = nil) -> some View {
    previewScreens(narrowLanguage: narrowLanguage, spaciousLanguage: spaciousLanguage).previewLayout(.sizeThatFits)
  }
}

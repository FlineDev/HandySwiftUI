# Extensions

Making existing types more convenient to use.

@Metadata {
   @PageImage(purpose: icon, source: "HandySwiftUI")
   @PageImage(purpose: card, source: "Extensions")
}

## Highlights

HandySwiftUI provides a rich set of extensions that make SwiftUI development more intuitive and powerful. Here are some of the most impactful features:

### Optional Binding Conveniences

The `??` operator and `isPresent` modifier simplify working with optional values in bindings:

```swift
struct EditableProfile: View {
   @State private var profile: Profile?
   @State private var showEditSheet = false
   
   var body: some View {
       Form {
           // Provide default value for optional binding
           TextField("Name", text: $profile?.name ?? "Anonymous")
           
           // Negate binding value
           Toggle("Hide Details", isOn: !$showAdvanced)
       }
       // Use optional binding for sheet presentation
       .sheet(isPresented: $profile.isPresent(wrappedType: Profile.self)) {
           ProfileEditor(profile: $profile)
       }
   }
}
```

### Color Management

The comprehensive color extensions provide powerful tools for color manipulation and system color adoption:

```swift
struct ColorfulView: View {
   @State private var baseColor = Color.blue
   
   var body: some View {
       VStack {
           // Create variations of the base color
           Rectangle()
               .fill(baseColor.change(.luminance, by: -0.2))
           Rectangle()
               .fill(baseColor)
           Rectangle()
               .fill(baseColor.change(.luminance, by: 0.2))
               
           // Work with hex colors
           Circle()
               .fill(Color(hex: "#FF5733"))
           
           // Use color components
           let (h, s, b, o) = baseColor.hsbo
           Text("HSB: \(h), \(s), \(b), \(o)")
           
           let (r, g, b, o) = baseColor.rgbo
           Text("RGB: \(r), \(g), \(b), \(o)")
       }
       .padding()
       // Use semantic system colors for adaptive interfaces
       .background(Color.systemBackground)
   }
}
```

### Rich Text Formatting

The text formatting extensions provide a convenient way to create rich text with mixed styles:

```swift
struct FormattedText: View {
   var body: some View {
       Text(
           format: "A <b>bold</b> new way to <i>style</i> your text with <star.fill/> and <b>mixed</b> <red>formatting</red>.",
           partialStyling: Dictionary.htmlLike.merging([
               "red": { $0.foregroundColor(.red) },
               "star.fill": { $0.foregroundColor(.yellow) }
           ]) { $1 }
       )
   }
}
```

### Button Conveniences

Create buttons with unified styling using various conformances:

```swift
struct IconAction: CustomSymbolConvertible, CustomStringConvertible {
   var symbolName: String { "star.fill" }
   var description: String { "Favorite" }
}

struct ButtonsView: View {
   let action = IconAction()
   
   var body: some View {
       VStack {
           // Button with just text
           Button(stringConvertible: action) {
               // handle tap
           }
           
           // Button with just icon
           Button(symbolConvertible: action) {
               // handle tap
           }
           
           // Button with both text and icon
           Button(labelConvertible: action) {
               // handle tap
           }
       }
   }
}
```

### Image Handling

Extensions for image processing across platforms:

```swift
class ImageProcessor {
   func processImage(_ image: PlatformImage) {
       // Resize image while maintaining aspect ratio
       let resized = image.resized(maxWidth: 800, maxHeight: 600)
       
       // Convert to different formats
       let pngData = image.pngData()
       let jpegData = image.jpegData(compressionQuality: 0.8)
       let heicData = image.heicData(compressionQuality: 0.8)
   }
}
```

### Platform-Aware Layouts

Built-in constants for platform-specific spacing and dimensions:

```swift
struct AdaptiveLayout: View {
   var body: some View {
       VStack(spacing: .platformDefaultSpacing) {
           Text("Title")
               .frame(height: .platformDefaultTextHeight)
           Text("Subtitle")
       }
   }
}
```

These extensions work together to create a more fluid and expressive SwiftUI development experience, reducing boilerplate code and enabling cleaner, more maintainable implementations of common patterns.

## Topics

### Binding

- ``!(value:)``
- ``??(binding:fallback:)``
- ``SwiftUICore/Binding/isPresent(wrappedType:)``

### Button

- ``SwiftUI/Button/init(stringConvertible:action:)``
- ``SwiftUI/Button/init(symbolConvertible:action:)``
- ``SwiftUI/Button/init(labelConvertible:action:)``

### CGFloat

- ``CoreFoundation/CGFloat/platformDefaultSpacing``
- ``CoreFoundation/CGFloat/platformDefaultTextHeight``

### Colors

- ``SwiftUICore/Color/change(_:by:)``
- ``SwiftUICore/Color/change(_:to:)``
- ``SwiftUICore/Color/hlco``
- ``SwiftUICore/Color/hsbo``
- ``SwiftUICore/Color/rgbo``
- ``SwiftUICore/Color/init(hex:)``
- ``SwiftUICore/Color/init(hue:luminance:chroma:opacity:)``
- ``SwiftUICore/Color/toHex(alpha:)``
- ``SwiftUICore/Color/systemBackground``
- ``SwiftUICore/Color/secondarySystemBackground``
- ``SwiftUICore/Color/tertiarySystemBackground``
- ``SwiftUICore/Color/systemGroupedBackground``
- ``SwiftUICore/Color/secondarySystemGroupedBackground``
- ``SwiftUICore/Color/tertiarySystemGroupedBackground``

### CustomStringConvertible

- ``Swift/CustomStringConvertible/text``

### Image/NSImage/UIImage

- ``SwiftUICore/Image/init(convertible:variableValue:)``
- ``AppKit/NSImage/heicData(compressionQuality:)``
- ``AppKit/NSImage/jpegData(compressionQuality:)``
- ``AppKit/NSImage/pngData()``
- ``AppKit/NSImage/resized(maxWidth:maxHeight:)``
- ``UIKit/UIImage/heicData(compressionQuality:)``
- ``UIKit/UIImage/resized(maxWidth:maxHeight:)``

### Label

- ``SwiftUI/Label/init(convertible:)``

### Notification.Name

- ``Foundation/Notification/Name/publisher``
- ``Foundation/Notification/Name/post(object:)``

### PersistentModel

- ``SwiftData/PersistentModel/isPersisted``

### String

- ``Swift/String/toRGBA()``
- ``Swift/String/highlightMatchingTokenizedPrefixes(in:locale:with:)``
- ``Swift/String/nilPlaceholderValue``

### Text

- ``SwiftUICore/Text/init(convertible:)``
- ``SwiftUICore/Text/init(format:partialStyling:)``

[TranslateKit]: https://apps.apple.com/app/apple-store/id6476773066?pt=549314&ct=swiftpackageindex.com&mt=8
[FreemiumKit]: https://apps.apple.com/app/apple-store/id6502914189?pt=549314&ct=swiftpackageindex.com&mt=8
[FreelanceKit]: https://apps.apple.com/app/apple-store/id6480134993?pt=549314&ct=swiftpackageindex.com&mt=8
[CrossCraft]: https://apps.apple.com/app/apple-store/id6472669260?pt=549314&ct=swiftpackageindex.com&mt=8
[FocusBeats]: https://apps.apple.com/app/apple-store/id6477829138?pt=549314&ct=swiftpackageindex.com&mt=8
[Guided Guest Mode]: https://apps.apple.com/app/apple-store/id6479207869?pt=549314&ct=swiftpackageindex.com&mt=8
[Posters]: https://apps.apple.com/app/apple-store/id6478062053?pt=549314&ct=swiftpackageindex.com&mt=8
[Pleydia Organizer]: https://apps.apple.com/app/apple-store/id6587583340?pt=549314&ct=swiftpackageindex.com&mt=8

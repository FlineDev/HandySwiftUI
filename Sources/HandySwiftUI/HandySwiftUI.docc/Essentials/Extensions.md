# Extensions

Making existing types more convenient to use.

@Metadata {
   @PageImage(purpose: icon, source: "HandySwiftUI")
   @PageImage(purpose: card, source: "Extensions")
}

## Highlights

HandySwiftUI provides a rich set of extensions to existing types that make SwiftUI development more intuitive and powerful. While you can find a full list of all extensions at the [Topics](#topics) section of this page, I want to highlight the ones I use most often in my apps:

### Optional Binding Conveniences

The `??` and `!` operators and the `isPresent` modifier simplify working with optional values in bindings:

```swift
struct EditableProfile: View {
   @State private var profile: Profile?
   @State private var showAdvanced = false
   
   var body: some View {
       Form {
           // Provide default value for optional binding using the `??` operator
           TextField("Name", text: $profile?.name ?? "Anonymous")
           
           // Negate binding value using `!` operator
           Toggle("Hide Details", isOn: !$showAdvanced)
       }
       // Use optional binding for sheet presentation
       .sheet(isPresented: $profile.isPresent(wrappedType: Profile.self)) {
           ProfileEditor(profile: $profile)
       }
   }
}
```

The operators are useful in all kinds of views, when working with optional data in models, for example.


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
           Text("HSB: \(baseColor.hsbo.hue), \(baseColor.hsbo.saturation), \(baseColor.hsbo.brightness)")
           Text("RGB: \(baseColor.rgbo.red), \(baseColor.rgbo.green), \(baseColor.rgbo.blue)")
       }
       .padding()
       // Use semantic system colors for custom system-like components
       .background(Color.systemBackground)
   }
}
```

TODO: add image of above view

When adjusting color brightness, use .luminance instead of .brightness from the HSB color system. Luminance better represents how humans perceive light and dark, which is why HandySwiftUI includes support for the HLC color space.


### Rich Text Formatting

The text formatting extensions provide a convenient way to create rich text with mixed styles inspired by XML-style tags:

```swift
struct FormattedText: View {
   var body: some View {
       Text(
           format: "A <b>bold</b> new way to <i>style</i> your text with <star.fill/> and <b>mixed</b> <red>formatting</red>.",
           partialStyling: Dictionary.htmlLike.merging([
               "red": { $0.foregroundColor(.red) },
               "star.fill": { $0.foregroundColor(.yellow) }
           ]) { $1 }  // returning $1 (instead of $0) means added keys override (potentially) existing keys
       )
   }
}
```

TODO: add image of above view

In the above example, the built-in `.htmlLike` styling that ships with HandySwiftUI is combined with custom tags. Note that `.htmlLike` simply returns this:

```swift
[
   "b": { $0.bold() },
   "sb": { $0.fontWeight(.semibold) },
   "i": { $0.italic() },
   "bi": { $0.bold().italic() },
   "sbi": { $0.fontWeight(.semibold).italic() },
   "del": { $0.strikethrough() },
   "ins": { $0.underline() },
   "sub": { $0.baselineOffset(-4) },
   "sup": { $0.baselineOffset(6) },
]
```

Any XML-like entries that end with a `/>` such as `<star.fill/>` from the example above get rendered as an SFSymbol. This way, you can easily use SFSymbols right within your text.


### Image Handling

Unified extensions for image processing for `UIImage` and `NSImage`:

```swift
class ImageProcessor {
   func processImage(_ image: UIImage) {
       // Resize image while maintaining aspect ratio
       let resized = image.resized(maxWidth: 800, maxHeight: 600)
       
       // Convert to different formats
       let pngData = image.pngData()
       let jpegData = image.jpegData(compressionQuality: 0.8)
       let heicData = image.heicData(compressionQuality: 0.8)
   }
}
```

Note that all these APIs return optional values for edge cases like when the system is extremely low on memory, but should succeed most of the time.


### Convenient Model-to-View Conversions

HandySwiftUI provides initializer conveniences that make it easy to display your model types directly in SwiftUI views:

```swift
enum Tab: CustomLabelConvertible {
    case home, profile, settings
    
    var description: String {
        switch self {
        case .home: "Home"
        case .profile: "Profile"
        case .settings: "Settings"
        }
    }
    
    var symbolName: String {
        switch self {
        case .home: "house.fill"
        case .profile: "person.circle"
        case .settings: "gear"
        }
    }
}

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                // Create tab item directly from enum case
                .tabItem { Label(convertible: Tab.home) }
                .tag(Tab.home)
            
            ProfileView()
                .tabItem { Label(convertible: Tab.profile) }
                .tag(Tab.profile)
            
            SettingsView()
                .tabItem { Label(convertible: Tab.settings) }
                .tag(Tab.settings)
        }
        
        // Works with Text and Image views too
        Text(convertible: selectedTab)  // Shows tab name
        Image(convertible: selectedTab) // Shows tab icon
    }
}
```

Instead of manually extracting strings and symbol names from your models, you can conform them to `CustomStringConvertible` for text, `CustomSymbolConvertible` for SF Symbols, or `CustomLabelConvertible` for both. Then use the convenient initializers to create SwiftUI views directly:

- `Text(convertible:)` - Creates text from any `CustomStringConvertible`
- `Image(convertible:)` - Creates SF Symbol images from any `CustomSymbolConvertible`
- `Label(convertible:)` - Creates text+icon labels from any `CustomLabelConvertible`

This pattern works especially well with enums representing UI states, menu options, or tabs, as shown in the example above.


### Search Prefix Highlighting

HandySwiftUI provides an elegant way to highlight matching text in search results, making it easy to show users exactly what parts of the text matched their search query:

```swift
struct SearchResultsView: View {
    @State private var searchText = ""
    let translations = [
        "Good morning!",
        "Good evening!",
        "How are you?",
        "Thank you very much!"
    ]
    
    var body: some View {
        List {
            ForEach(translations.filtered(by: searchText), id: \.self) { translation in
                // When searching for "go mo", highlights "Go mo" in "Good morning!"
                Text(translation.highlightMatchingTokenizedPrefixes(in: searchText))
            }
        }
        .searchable(text: $searchText)
    }
}

extension [String] {
    func filtered(by searchText: String) -> [String] {
        guard !searchText.isEmpty else { return Array(self) }
        return filter { $0.localizedCaseInsensitiveContains(searchText) }
    }
}
```

TODO: add image of TranslateKit's menu bar

This highlighting feature was originally developed for [TranslateKit]'s menu bar "Common Translations" feature, where it helps users quickly spot matching phrases in their translation history. The function breaks down the search text into tokens and highlights each matching prefix, making it perfect for:

- Search result highlighting in lists or menus
- Autocomplete suggestions with visual feedback
- Filtering through text collections while showing match context
- Making search matches more visible in document previews

The highlighting is case-insensitive and diacritic-insensitive by default, but you can customize the locale and font used for highlighting. This makes it a versatile tool for any search interface where you want to emphasize matching portions of text.

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

[TranslateKit]: https://translatekit.app
[FreemiumKit]: https://freemiumkit.app
[FreelanceKit]: https://apps.apple.com/app/apple-store/id6480134993?pt=549314&ct=swiftpackageindex.com&mt=8
[CrossCraft]: https://crosscraft.app
[FocusBeats]: https://apps.apple.com/app/apple-store/id6477829138?pt=549314&ct=swiftpackageindex.com&mt=8
[Guided Guest Mode]: https://apps.apple.com/app/apple-store/id6479207869?pt=549314&ct=swiftpackageindex.com&mt=8
[Posters]: https://apps.apple.com/app/apple-store/id6478062053?pt=549314&ct=swiftpackageindex.com&mt=8
[Pleydia Organizer]: https://apps.apple.com/app/apple-store/id6587583340?pt=549314&ct=swiftpackageindex.com&mt=8

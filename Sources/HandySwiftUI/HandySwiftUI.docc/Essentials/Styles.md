# Styles

Adding missing styles commonly needed for existing SwiftUI views.

@Metadata {
   @PageImage(purpose: icon, source: "HandySwiftUI")
   @PageImage(purpose: card, source: "Styles")
}

## Highlights

HandySwiftUI provides a collection of styles that enhance SwiftUI's standard views. While you can find a full list of all styles at the [Topics](#topics) section of this page, I want to highlight the ones I use most often in my apps:

### Primary, Secondary, and Pulsating Buttons

Create visually appealing buttons with pre-made styles for different use cases:

```swift
struct ButtonShowcase: View {
   var body: some View {
       VStack(spacing: 20) {
           // Primary button with prominent background
           Button("Get Started") {}
               .buttonStyle(.primary())
               
           // Secondary button with border
           Button("Learn More") {}
               .buttonStyle(.secondary())
               
           // Attention-grabbing pulsating button
           Button("Updates", systemName: "bell.fill") {}
              .buttonStyle(.pulsating(color: .blue, cornerRadius: 20, glowRadius: 8, duration: 2))
       }
   }
}
```

TODO: add video showcasing above view


### Horizontal, Vertical, Fixed Icon-Width Labels

Multiple label styles for different layout needs:

```swift
struct LabelShowcase: View {
   var body: some View {
       VStack(spacing: 20) {
           // Horizontal layout with trailing icon
           Label("Settings", systemImage: "gear")
               .labelStyle(.horizontal(spacing: 8, iconIsTrailing: true, iconColor: .blue))
           
           // Fixed-width icon for alignment
           Label("Profile", systemImage: "person")
               .labelStyle(.fixedIconWidth(30, iconColor: .green, titleColor: .primary))
           
           // Vertical stack layout
           Label("Messages", systemImage: "message.fill")
               .labelStyle(.vertical(spacing: 8, iconColor: .blue, iconFont: .title))
       }
   }
}
```

All parameters are optional with sensible defaults, so you can use them like `.vertical()`. You only need to specify what you want to customize.


### Vertically Labeled Contents

Structured form inputs with vertical labels, as used in [FreemiumKit]'s API configuration:

```swift
struct APIConfigView: View {
    @State private var keyID = ""
    @State private var apiKey = ""
    
    var body: some View {
        Form {
            HStack {
                VStack {
                    LabeledContent("Key ID") {
                        TextField("e.g. 2X9R4HXF34", text: $keyID)
                            .textFieldStyle(.roundedBorder)
                    }
                    .labeledContentStyle(.vertical())
                    
                    LabeledContent("API Key") {
                        TextEditor(text: $apiKey)
                            .frame(height: 80)
                            .textFieldStyle(.roundedBorder)
                    }
                    .labeledContentStyle(.vertical())
                }                
            }
        }
    }
}
```

TODO: add image from FreemiumKit

The `.vertical` style allows customizing alignment (defaults to `leading`) and spacing (defaults to 4). Pass `muteLabel: false` if you're providing a custom label style, as by default labels are automatically styled smaller and grayed out.

For example:

```swift
LabeledContent {
   LimitedTextField("English \(self.title)", text: self.$localizedString.fallback, characterLimit: self.characterLimit)
      .textFieldStyle(.roundedBorder)
} label: {
   Text("English \(self.title) (\(self.isRequired ? "Required" : "Optional"))")
      .font(.title3)
}
.labeledContentStyle(.vertical(muteLabel: false))
```

TODO: add image from FreemiumKit


### Multi-Platform Toggle Style

While SwiftUI provides a `.checkbox` toggle style, it's only available on macOS. HandySwiftUI adds `.checkboxUniversal` that brings checkbox-style toggles to all platforms (rendering as `.checkbox` on macOS):

```swift
struct ProductRow: View {
    @State private var isEnabled: Bool = true
    
    var body: some View {
       HStack {
           Toggle("", isOn: $isEnabled)
              .toggleStyle(.checkboxUniversal)
           
           Text("Pro Monthly")
           
           Spacer()
       }
    }
}
```

TODO: add image from FreemiumKit iOS

The example is extracted from [FreemiumKit]'s products screen, which is optimized for macOS but also supports other platforms.

## Topics

### ButtonStyle

- ``SwiftUI/ButtonStyle/pulsating(color:cornerRadius:glowRadius:duration:)``
- ``SwiftUI/ButtonStyle/primary(disabled:compact:)``
- ``SwiftUI/ButtonStyle/secondary(disabled:compact:)``

### LabelStyle

- ``SwiftUI/LabelStyle/fixedIconWidth(_:iconColor:titleColor:)``
- ``SwiftUI/LabelStyle/horizontal(spacing:iconIsTrailing:iconColor:iconFont:iconAngle:iconAmount:)``
- ``SwiftUI/LabelStyle/vertical(spacing:iconColor:iconFont:iconAngle:iconAmount:)``

### LabeledContentStyle

- ``SwiftUI/LabeledContentStyle/vertical(alignment:spacing:muteLabel:)``

### ToggleStyle

- ``SwiftUI/ToggleStyle/checkboxUniversal``


[TranslateKit]: https://translatekit.app
[FreemiumKit]: https://freemiumkit.app
[FreelanceKit]: https://apps.apple.com/app/apple-store/id6480134993?pt=549314&ct=swiftpackageindex.com&mt=8
[CrossCraft]: https://crosscraft.app
[FocusBeats]: https://apps.apple.com/app/apple-store/id6477829138?pt=549314&ct=swiftpackageindex.com&mt=8
[Guided Guest Mode]: https://apps.apple.com/app/apple-store/id6479207869?pt=549314&ct=swiftpackageindex.com&mt=8
[Posters]: https://apps.apple.com/app/apple-store/id6478062053?pt=549314&ct=swiftpackageindex.com&mt=8
[Pleydia Organizer]: https://apps.apple.com/app/apple-store/id6587583340?pt=549314&ct=swiftpackageindex.com&mt=8

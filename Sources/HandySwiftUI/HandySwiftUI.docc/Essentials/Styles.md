# Styles

Adding missing styles commonly needed for existing SwiftUI views.

@Metadata {
   @PageImage(purpose: icon, source: "HandySwiftUI")
   @PageImage(purpose: card, source: "Styles")
}

## Highlights

HandySwiftUI provides a collection of styles that enhance SwiftUI's standard views. While you can find a full list of all styles at the [Topics](#topics) section of this page, I want to highlight the ones I use most often in my apps:

### Enhanced Button Styles

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
           Button(action: {}) {
               Image(systemName: "bell.fill")
                   .font(.title2)
           }
           .buttonStyle(.pulsating(
               color: .blue,
               cornerRadius: 20,
               glowRadius: 8,
               duration: 2
           ))
       }
   }
}
```

### Versatile Label Styles

Multiple label styles for different layout needs:

```swift
struct LabelShowcase: View {
   var body: some View {
       VStack(spacing: 20) {
           // Horizontal layout with trailing icon
           Label("Settings", systemImage: "gear")
               .labelStyle(.horizontal(
                   spacing: 8,
                   iconIsTrailing: true,
                   iconColor: .blue
               ))
           
           // Fixed-width icon for alignment
           Label("Profile", systemImage: "person")
               .labelStyle(.fixedIconWidth(
                   30,
                   iconColor: .green,
                   titleColor: .primary
               ))
           
           // Vertical stack layout
           Label("Messages", systemImage: "message.fill")
               .labelStyle(.vertical(
                   spacing: 8,
                   iconColor: .blue,
                   iconFont: .title
               ))
       }
   }
}
```

### Labeled Content Organization

Structured content presentation with vertical layout:

```swift
struct ProfileView: View {
   var body: some View {
       VStack {
           LabeledContent("Email", value: "user@example.com")
               .labeledContentStyle(.vertical(
                   alignment: .leading,
                   spacing: 4,
                   muteLabel: true
               ))
               
           LabeledContent("Member Since", value: "January 2024")
               .labeledContentStyle(.vertical(
                   alignment: .leading
               ))
       }
   }
}
```

### Cross-Platform Toggle Style

Consistent checkbox experience across all platforms:

```swift
struct SettingsView: View {
   @State private var notifications = false
   @State private var autoUpdate = true
   
   var body: some View {
       Form {
           Toggle("Enable Notifications", isOn: $notifications)
               .toggleStyle(.checkboxUniversal)
               
           Toggle("Automatic Updates", isOn: $autoUpdate)
               .toggleStyle(.checkboxUniversal)
       }
   }
}
```

These styles work together to create a cohesive and professional look while maintaining consistency across different platforms. They're designed to be customizable while providing sensible defaults that follow platform conventions.

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

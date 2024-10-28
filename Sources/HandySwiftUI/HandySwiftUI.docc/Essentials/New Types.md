# New Types

Adding missing views and view-related types commonly needed.

@Metadata {
   @PageImage(purpose: icon, source: "HandySwiftUI")
   @PageImage(purpose: card, source: "NewTypes")
}

## Highlights

HandySwiftUI provides a collection of powerful new types that enhance SwiftUI development. Here are some key features:

### Efficient Image Loading

`CachedAsyncImage` provides efficient image loading with built-in caching:

```swift
struct ProductView: View {
    let product: Product
    
    var body: some View {
        VStack {
            CachedAsyncImage(url: product.imageURL)
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(product.name)
                .font(.headline)
        }
    }
}
```

### Enhanced Selection Controls

Multiple sophisticated picker types for different use cases:

```swift
struct SettingsView: View {
    @State private var selectedMood: Mood?
    @State private var selectedColors: Set<Color> = []
    @State private var selectedEmoji: Emoji?
    
    var body: some View {
        Form {
            // Vertical option picker with icons
            VPicker("Select Mood", selection: $selectedMood)
            
            // Horizontal picker with custom styling
            HPicker("Rate your experience", selection: $selectedMood)
            
            // Multi-selection with platform-adaptive UI
            MultiSelector(
                label: { Text("Colors") },
                optionsTitle: "Select Colors",
                options: [.red, .blue, .green],
                selected: $selectedColors,
                optionToString: \.description
            )
            
            // Searchable grid picker for emoji selection
            SearchableGridPicker(
                title: "Choose Emoji",
                options: Emoji.allCases,
                selection: $selectedEmoji
            )
        }
    }
}
```

### Async State Management

Track async operations with type-safe state handling:

```swift
struct DownloadView: View {
    @State private var downloadState: ProgressState<Error> = .notStarted
    
    var body: some View {
        AsyncButton("Download") {
            downloadState = .inProgress
            try await downloadFile()
            downloadState = .successful
        } catchError: { error in
            downloadState = .failed(error: error)
        }
    }
}
```

### Platform-Aware Components

Native platform integration and adaptable interfaces:

```swift
struct DocumentPicker: View {
    var body: some View {
        #if os(macOS)
        Button("Select File") {
            let panel = OpenPanel(
                filesWithMessage: "Choose a document",
                buttonTitle: "Open",
                contentType: .pdf
            )
            if let url = await panel.showAndAwaitSingleSelection() {
                // Handle selected file
            }
        }
        #endif
        
        // Use platform values for consistent UX
        Text("Content")
            .padding(.platformDefaultSpacing)
            .frame(height: .platformDefaultTextHeight)
    }
}
```

### Enhanced Navigation

Modern navigation patterns for larger screens:

```swift
struct MainView: View {
    enum Tab: String, Identifiable, CustomLabelConvertible {
        case home, library, settings
        
        var id: Self { self }
        var description: String { rawValue.capitalized }
        var symbolName: String { rawValue }
    }
    
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        SideTabView(
            selection: $selectedTab,
            bottomAlignedTabs: 1
        ) { tab in
            switch tab {
            case .home:
                HomeView()
            case .library:
                LibraryView()
            case .settings:
                SettingsView()
            }
        }
    }
}
```

These types work together to provide a comprehensive toolkit for building sophisticated SwiftUI applications, reducing boilerplate code while maintaining a native look and feel across Apple platforms.


## Topics

### Views

- ``AsyncButton``
- ``CachedAsyncImage``
- ``DisclosureSection``
- ``HPicker``
- ``LimitedTextField``
- ``MultiSelector``
- ``VPicker``
- ``SearchableGridPicker``
- ``SideTabView``
- ``WebView``

### Other

- ``Emoji``
- ``OpenPanel``
- ``Platform``
- ``ProgressState``
- ``SFSymbol``
- ``Xcode``


[TranslateKit]: https://translatekit.app
[FreemiumKit]: https://freemiumkit.app
[FreelanceKit]: https://apps.apple.com/app/apple-store/id6480134993?pt=549314&ct=swiftpackageindex.com&mt=8
[CrossCraft]: https://crosscraft.app
[FocusBeats]: https://apps.apple.com/app/apple-store/id6477829138?pt=549314&ct=swiftpackageindex.com&mt=8
[Guided Guest Mode]: https://apps.apple.com/app/apple-store/id6479207869?pt=549314&ct=swiftpackageindex.com&mt=8
[Posters]: https://apps.apple.com/app/apple-store/id6478062053?pt=549314&ct=swiftpackageindex.com&mt=8
[Pleydia Organizer]: https://apps.apple.com/app/apple-store/id6587583340?pt=549314&ct=swiftpackageindex.com&mt=8

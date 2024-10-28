# New Types

Adding missing views and view-related types commonly needed.

@Metadata {
   @PageImage(purpose: icon, source: "HandySwiftUI")
   @PageImage(purpose: card, source: "NewTypes")
}

## Highlights

HandySwiftUI provides a collection of views and types that fill common gaps in SwiftUI development. While you can find a full list of all types at the [Topics](#topics) section of this page, I want to highlight the ones I use most often in my apps:

### Platform-Specific Values

HandySwiftUI provides an elegant way to handle platform-specific values of any type:

```swift
struct AdaptiveView: View {
    enum TextStyle {
        case compact, regular, expanded
    }
    
    var body: some View {
        VStack {
            // Different number values per platform
            Text("Welcome")
                .padding(Platform.value(default: 20.0, phone: 12.0))
            
            // Different fonts per platform
            Text("Content")
                .font(Platform.value(default: .headline, mac: .title3, phone: .subheadline))
            
            // Different colors per platform
            Circle()
                .fill(Platform.value(default: .blue, mac: .indigo, pad: .purple, vision: .cyan))
            
            // Even custom enum values
            ContentLayout(style: Platform.value(default: .regular, phone: .compact, mac: .expanded))
        }
    }
}
```

TODO: add an image using "Last 30 Days" on Mac and iPhone with different font sizes

`Platform.value` works with any type - from simple numbers to colors, fonts, or your own custom types. Just provide a default and override specific platforms as needed. This can be enormously useful, especially given that it even has a specific case for iPad named `pad`, so you can even address phones and tablets separately.


### Readable Preview Detection

Provide fake data and simulate loading states during development:

```swift
Task {
   loadState = .inProgress
   
   if Xcode.isRunningForPreviews {
       // Simulate network delay in previews
       try await Task.sleep(for: .seconds(1))
       self.data = Data()
       loadState = .successful
   } else {
       do {
           self.data = try await loadFromAPI()
           loadState = .successful
       } catch {
           loadState = .failed(error: error.localizedDescription)
       }
   }
}
```

`Xcode.isRunningForPreviews` allows you to bypass actual network requests and instead provide instant or delayed fake responses in SwiftUI previews only, making it perfect for prototyping and UI development. It's also useful to avoid consuming limited resources during development, such as API rate limits, analytics events that could distort statistics, or services that charge per request – just wrap these in a `if !Xcode.isRunningForPreviews` check.


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

Note that `.resizable()` and `.aspectRatio(contentMode: .fill)` are already applied to the `Image` view inside it.


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
            
            // Searchable grid picker for emoji or SF Symbol selection
            SearchableGridPicker(
                title: "Choose Emoji",
                options: Emoji.allCases,
                selection: $selectedEmoji
            )
        }
    }
}
```

TODO: add video for above view

HandySwiftUI includes `Emoji` and `SFSymbol` enums that contain common emoji and symbols. You can also create custom enums by conforming to `SearchableOption` and providing `searchTerms` for each case to power the search functionality.


### Async State Management

Track async operations with type-safe state handling using `ProgressState`:

```swift
struct DocumentView: View {
    @State private var loadState: ProgressState<String> = .notStarted
    
    var body: some View {
        Group {
            switch loadState {
            case .notStarted:
                AsyncButton("Load Document") {
                    loadState = .inProgress
                    try await loadDocument()
                    loadState = .successful
                } catchError: { error in
                    loadState = .failed(error: error.localizedDescription)
                }
                
            case .inProgress:
                ProgressView("Loading document...")
                
            case .failed(let errorMessage):
                VStack {
                    Text("Failed to load document:")
                        .foregroundStyle(.secondary)
                    Text(errorMessage)
                        .foregroundStyle(.red)
                    
                  AsyncButton("Try Again") {
                      loadState = .inProgress
                      try await loadDocument()
                      loadState = .successful
                  } catchError: { error in
                      loadState = .failed(error: error.localizedDescription)
                  }
                }
                
            case .successful:
                VStack {
                    DocumentContent()
                }
            }
        }
    }
}
```

The example demonstrates handling all states in a type-safe way:
- `.notStarted` shows the initial load button
- `.inProgress` displays a loading indicator
- `.failed` shows the error with a retry option
- `.successful` presents the loaded content


### Bring `NSOpenPanel` to SwiftUI 

Bridging native macOS file access into SwiftUI, particularly useful for handling security-scoped resources:

```swift
struct SecureFileLoader {
    @State private var apiKey = ""
    
    func loadKeyFile(at fileURL: URL) async {
        #if os(macOS)
        // On macOS, we need user consent to access the file
        let panel = OpenPanel(
            filesWithMessage: "Provide access to read key file",
            buttonTitle: "Allow Access",
            contentType: .data,
            initialDirectoryUrl: fileURL
        )
        guard let url = await panel.showAndAwaitSingleSelection() else { return }
        #else
        let url = fileURL
        #endif
        
        guard url.startAccessingSecurityScopedResource() else { return }
        defer { url.stopAccessingSecurityScopedResource() }
        
        do {
            apiKey = try String(contentsOf: url)
        } catch {
            print("Failed to load file: \(error.localizedDescription)")
        }
    }
}
```

TODO: add photo from FreemiumKit with access dialog

The example taken right out of [FreemiumKit] demonstrates how `OpenPanel` simplifies handling security-scoped file access for dragged items on macOS while maintaining cross-platform compatibility.


### Vertical Tab Navigation

An alternative to SwiftUI's `TabView` that implements sidebar-style navigation commonly seen in macOS and iPadOS apps:

```swift
struct MainView: View {
    enum Tab: String, Identifiable, CustomLabelConvertible {
        case documents, recents, settings
        
        var id: Self { self }
        var description: String {
            rawValue.capitalized
        }
        var symbolName: String {
            switch self {
            case .documents: "folder"
            case .recents: "clock"
            case .settings: "gear"
            }
        }
    }
    
    @State private var selectedTab: Tab = .documents
    
    var body: some View {
        SideTabView(
            selection: $selectedTab,
            bottomAlignedTabs: 1  // Places settings at the bottom
        ) { tab in
            switch tab {
            case .documents:
                DocumentList()
            case .recents:
                RecentsList()
            case .settings:
                SettingsView()
            }
        }
    }
}
```

TODO: add screenshot from Mac

`SideTabView` provides a vertical sidebar with icons and labels, optimized for larger screens with support for bottom-aligned tabs. The view automatically handles platform-specific styling and hover effects.


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

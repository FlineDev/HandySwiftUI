# ``HandySwiftUI``

Handy UI features that didn't make it into SwiftUI (yet).

@Metadata {
   @PageImage(purpose: icon, source: "HandySwiftUI")
}

## Overview

HandySwiftUI is a comprehensive SwiftUI extension library that fills common gaps in SwiftUI development. It provides essential utilities, view modifiers, and types that should have been part of SwiftUI from the beginning, making your development experience more intuitive and efficient.

### Key Benefits

- **Cross-Platform Excellence**: Built-in support for iOS, macOS, tvOS, visionOS, and watchOS with platform-specific optimizations
- **Developer Productivity**: Reduce boilerplate code and eliminate common SwiftUI pain points
- **Performance Optimized**: Efficient implementations with built-in caching and smart resource management
- **Production Ready**: Used across multiple published apps in the App Store

### What's Included

HandySwiftUI provides four main categories of enhancements:

- **New Types**: Missing views and related types commonly needed in SwiftUI apps
- **View Modifiers**: Enhanced modifiers that extend SwiftUI's capabilities
- **Extensions**: Convenient extensions to existing SwiftUI types
- **Styles**: Custom styles for consistent UI patterns

## Quick Start

Add HandySwiftUI to your project and start using its features immediately:

```swift
import HandySwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Platform-specific values
            Text("Hello, World!")
                .font(Platform.value(default: .title, phone: .headline))
            
            // Smart color contrast
            Text("Always readable")
                .foregroundStyle(.yellow, minContrast: 0.5)
            
            // Efficient image loading
            CachedAsyncImage(url: imageURL)
                .frame(width: 200, height: 200)
        }
    }
}
```

## Core Features

### Platform-Specific Development

Handle different platforms elegantly without verbose `#if` statements:

```swift
// Different values per platform
.padding(Platform.value(default: 20.0, phone: 12.0, mac: 24.0))

// Platform-specific colors
.fill(Platform.value(default: .blue, mac: .indigo, pad: .purple, vision: .cyan))

// Platform-specific modifiers
.macOSOnlyPadding(.all, 20)
.iOSOnly { $0.navigationViewStyle(.stack) }
```

### Enhanced Image Loading

`CachedAsyncImage` provides efficient image loading with built-in caching and automatic resizing:

```swift
CachedAsyncImage(url: product.imageURL)
    .frame(width: 200, height: 200)
    .clipShape(RoundedRectangle(cornerRadius: 10))
```

### Smart Color Management

Ensure text readability with automatic contrast adjustment:

```swift
Text("Warning Message")
    .foregroundStyle(.yellow, minContrast: 0.5)
```

### Error-Handling Tasks

Streamlined async error handling in SwiftUI views:

```swift
.throwingTask {
    try await loadData()
} catchError: { error in
    self.error = error
}
```

### Preview Detection

Provide fake data and simulate loading states during development:

```swift
if Xcode.isRunningForPreviews {
    // Simulate network delay in previews
    try await Task.sleep(for: .seconds(1))
    self.data = mockData
}
```

### Optional Binding Conveniences

Simplify working with optional values in bindings:

```swift
// Provide default value for optional binding
TextField("Name", text: $profile?.name ?? "Anonymous")

// Negate binding value
Toggle("Hide Details", isOn: !$showAdvanced)

// Optional binding for sheet presentation
.sheet(isPresented: $profile.isPresent(wrappedType: Profile.self)) {
    ProfileEditor(profile: $profile)
}
```

### Enhanced Button Styles

Create visually appealing buttons with pre-made styles:

```swift
VStack {
    // Primary button with prominent background
    Button("Get Started") {}
        .buttonStyle(.primary())
        
    // Secondary button with border
    Button("Learn More") {}
        .buttonStyle(.secondary())
        
    // Attention-grabbing pulsating button
    Button("Updates") {}
        .buttonStyle(.pulsating(color: .blue, cornerRadius: 20))
}
```

### Advanced Color Management

Powerful color manipulation and system color adoption:

```swift
struct ColorfulView: View {
    var body: some View {
        VStack {
            // Generate complementary colors
            Circle()
                .fill(Color.blue.complementary)
            
            // Adjust color properties
            Rectangle()
                .fill(Color.red.adjustedBrightness(by: 0.3))
            
            // System colors with fallbacks
            Text("System Blue")
                .foregroundStyle(Color.systemBlue)
        }
    }
}
```

## Essentials

Learn how you can make the most of HandySwiftUI with these guides:

@Links(visualStyle: detailedGrid) {
   - <doc:New-Types>
   - <doc:View-Modifiers>
   - <doc:Extensions>
   - <doc:Styles>
}

## Integration

### Swift Package Manager

Add HandySwiftUI to your project using Swift Package Manager:

1. In Xcode, go to **File** → **Add Package Dependencies**
2. Enter the repository URL: `https://github.com/FlineDev/HandySwiftUI`
3. Select the version you want to use
4. Add to your target

### FlineDevKit Integration

HandySwiftUI is automatically included when you import the FlineDevKit meta-framework:

```swift
import FlineDevKit  // Includes HandySwiftUI and other essential packages
```

## Showcase

HandySwiftUI powers UI features across multiple published apps:

- **TranslateKit**: AI-powered app localization with platform-specific UI optimizations
- **FreemiumKit**: In-app purchase management with cross-platform interface consistency
- **FreelanceKit**: Time tracking with adaptive layouts for all Apple platforms
- **CrossCraft**: Custom crossword creation with efficient image loading
- **FocusBeats**: Pomodoro timer with smart color contrast and platform-specific styling
- **Posters**: Vision Pro movie discovery with optimized spatial computing interfaces

## Contributing

HandySwiftUI is actively maintained and welcomes contributions. The library focuses on:

- **Practical Solutions**: Features that solve real development problems
- **Cross-Platform Support**: All Apple platforms with platform-specific optimizations
- **Performance**: Efficient implementations that don't impact app performance
- **Simplicity**: Easy-to-use APIs that feel native to SwiftUI

For more information, visit the [GitHub repository](https://github.com/FlineDev/HandySwiftUI).

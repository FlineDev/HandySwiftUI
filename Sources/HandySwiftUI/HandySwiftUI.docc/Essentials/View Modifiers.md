# View Modifiers

Adding missing view modifiers often needed.

@Metadata {
   @PageImage(purpose: icon, source: "HandySwiftUI")
   @PageImage(purpose: card, source: "ViewModifiers")
}

## Highlights

HandySwiftUI provides a collection of powerful view modifiers that simplify common UI patterns and enhance cross-platform development. Here are some key features:

### Smart Color Contrast

The `foregroundStyle(_:minContrast:)` modifier ensures text remains readable by automatically adjusting color contrast:

```swift
struct AdaptiveText: View {
    var body: some View {
        VStack {
            // Without contrast adjustment
            Text("Hard to read")
                .foregroundColor(.gray)
            
            // With automatic contrast adjustment
            Text("Always readable")
                .foregroundStyle(.gray, minContrast: 0.5)
        }
    }
}
```

### Progress Indicators

The `progressOverlay` modifier provides a clean way to show loading states:

```swift
struct LoadingView: View {
    @State private var isLoading = false
    @State private var progress = Progress(totalUnitCount: 100)
    
    var body: some View {
        ContentView()
            .progressOverlay(
                type: isLoading 
                    ? .indeterminate(running: true, title: "Loading...") 
                    : .determinate(progress: progress)
            )
    }
}
```

### Error-Handling Tasks

The `throwingTask` modifier streamlines async error handling:

```swift
struct DataView: View {
    @State private var error: Error?
    
    var body: some View {
        ContentView()
            .throwingTask {
                try await loadData()
            } catchError: { error in
                self.error = error
            }
    }
}
```

### Platform-Specific Styling

A comprehensive set of platform modifiers enables precise control over cross-platform UI:

```swift
struct AdaptiveInterface: View {
    var body: some View {
        ContentView()
            // Apply different paddings per platform
            .macOSOnlyPadding(.all, 20)
            // Platform-specific styles
            .macOSOnly { view in
                view.frame(minWidth: 800)
            }
            .iOSOnly { view in 
                view.listStyle(.insetGrouped)
            }
    }
}
```

### Enhanced Border Controls

Create polished UI elements with precise border control:

```swift
struct StylishCard: View {
    var body: some View {
        VStack {
            // Rounded rectangle border
            Text("Elegant Card")
                .padding()
                .roundedRectangleBorder(
                    .blue,
                    cornerRadius: 12,
                    lineWidth: 2
                )
            
            // Capsule border
            Text("Pill Button")
                .padding(.horizontal)
                .capsuleBorder(.green)
        }
    }
}
```

### Conditional Modifiers

A suite of modifiers for handling conditional view modifications cleanly:

```swift
struct DynamicContent: View {
    @State private var isEditMode = false
    @State private var accentColor: Color?
    
    var body: some View {
        ContentView()
            // Apply different modifiers based on condition
            .applyIf(isEditMode) {
                $0.overlay(EditingTools())
            } else: {
                $0.overlay(ViewingTools())
            }
            
            // Apply modifier only if optional exists
            .ifLet(accentColor) { view, color in
                view.tint(color)
            }
    }
}
```

### App Lifecycle Handling

Respond to app state changes elegantly:

```swift
struct MediaPlayerView: View {
    @StateObject private var player = VideoPlayer()
    
    var body: some View {
        PlayerContent(player: player)
            .onAppResignActive {
                // Pause playback when app goes to background
                player.pause()
            }
            .onAppBecomeActive {
                // Resume state when app becomes active
                player.checkPlaybackState()
            }
    }
}
```

These modifiers work together to create a more fluid and maintainable SwiftUI development experience, reducing boilerplate code while enhancing the quality and consistency of your user interface.


## Topics

### View

- ``SwiftUICore/View/onAppBecomeActive(_:)``
- ``SwiftUICore/View/onAppResignActive(_:)``
- ``SwiftUICore/View/applyIf(_:modifier:)``
- ``SwiftUICore/View/applyIf(_:modifier:else:)``
- ``SwiftUICore/View/applyIfNot(_:modifier:)``
- ``SwiftUICore/View/capsuleBorder(_:lineWidth:)``
- ``SwiftUICore/View/confirmDeleteDialog(isPresented:performDelete:)``
- ``SwiftUICore/View/confirmDeleteDialog(message:isPresented:performDelete:)``
- ``SwiftUICore/View/confirmDeleteDialog(item:performDelete:)``
- ``SwiftUICore/View/confirmDeleteDialog(message:item:performDelete:)``
- ``SwiftUICore/View/eraseToAnyView()``
- ``SwiftUICore/View/foregroundStyle(_:minContrast:)``
- ``SwiftUICore/View/iOSExcluded(modifier:)``
- ``SwiftUICore/View/iOSOnly(modifier:)``
- ``SwiftUICore/View/ifLet(_:modifier:)``
- ``SwiftUICore/View/ifLet(_:modifier:else:)``
- ``SwiftUICore/View/macOSExcluded(modifier:)``
- ``SwiftUICore/View/macOSOnly(modifier:)``
- ``SwiftUICore/View/macOSOnlyPadding(_:_:)``
- ``SwiftUICore/View/macOSOnlyPadding(insets:)``
- ``SwiftUICore/View/macOSOnlyFrame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)``
- ``SwiftUICore/View/progressOverlay(type:)``
- ``SwiftUICore/View/roundedRectangleBorder(_:cornerRadius:lineWidth:)``
- ``SwiftUICore/View/throwingTask(asyncAction:catchError:)``
- ``SwiftUICore/View/tvOSExcluded(modifier:)``
- ``SwiftUICore/View/tvOSOnly(modifier:)``
- ``SwiftUICore/View/visionOSExcluded(modifier:)``
- ``SwiftUICore/View/visionOSOnly(modifier:)``
- ``SwiftUICore/View/watchOSExcluded(modifier:)``
- ``SwiftUICore/View/watchOSOnly(modifier:)``


[TranslateKit]: https://translatekit.app
[FreemiumKit]: https://freemiumkit.app
[FreelanceKit]: https://apps.apple.com/app/apple-store/id6480134993?pt=549314&ct=swiftpackageindex.com&mt=8
[CrossCraft]: https://crosscraft.app
[FocusBeats]: https://apps.apple.com/app/apple-store/id6477829138?pt=549314&ct=swiftpackageindex.com&mt=8
[Guided Guest Mode]: https://apps.apple.com/app/apple-store/id6479207869?pt=549314&ct=swiftpackageindex.com&mt=8
[Posters]: https://apps.apple.com/app/apple-store/id6478062053?pt=549314&ct=swiftpackageindex.com&mt=8
[Pleydia Organizer]: https://apps.apple.com/app/apple-store/id6587583340?pt=549314&ct=swiftpackageindex.com&mt=8

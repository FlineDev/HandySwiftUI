# View Modifiers

Adding missing view modifiers often needed in SwiftUI.

@Metadata {
   @PageImage(purpose: icon, source: "HandySwiftUI")
   @PageImage(purpose: card, source: "ViewModifiers")
}

## Highlights

HandySwiftUI provides a collection of view modifiers that enhance SwiftUI and multi-platform development. While you can find a full list of all modifiers at the [Topics](#topics) section of this page, I want to highlight the ones I use most often in my apps:

### Smart Color Contrast

The `foregroundStyle(_:minContrast:)` modifier ensures text remains readable by automatically adjusting color contrast. This is useful for dynamic colors or system colors like `.yellow` that might have poor contrast in certain color schemes:

```swift
struct AdaptiveText: View {
    @State private var dynamicColor: Color = .yellow
    
    var body: some View {
        HStack {
            // Without contrast adjustment
            Text("Maybe hard to read")
                .foregroundStyle(dynamicColor)
            
            // With automatic contrast adjustment
            Text("Always readable")
                .foregroundStyle(dynamicColor, minContrast: 0.5)
        }
    }
}
```

TODO: add example image from TranslateKit (API keys view when test unsuccessful)

The `minContrast` parameter (ranging from 0 to 1) determines the minimum contrast ratio against either white (in dark mode) or black (in light mode) using the luminance value (perceived brightness). This ensures text stays readable regardless of the current color scheme.


### Error-Handling Tasks

The `throwingTask` modifier streamlines async error handling in SwiftUI views. Unlike SwiftUI's built-in `.task` modifier which requires manual `do-catch` blocks, `throwingTask` provides a dedicated error handler closure:

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

The task behaves similarly to `.task` – starting when the view appears and canceling when it disappears. The `catchError` closure is optional, so you can omit it if you don't need to handle errors.


### Platform-Specific Styling

A comprehensive set of platform modifiers enables precise control over cross-platform UI:

```swift
struct AdaptiveInterface: View {
    var body: some View {
        ContentView()
            // Add padding only on macOS
            .macOSOnlyPadding(.all, 20)
            // Platform-specific styles
            .macOSOnly { $0.frame(minWidth: 800) }
            .iOSOnly { $0.navigationViewStyle(.stack) }
    }
}
```

The example showcases modifiers for platform-specific styling:
- `.macOSOnlyPadding` adds padding only on macOS where containers like `Form` lack default padding
- `.macOSOnlyFrame` sets minimum window sizes needed on macOS
- Platform modifiers (`.iOSOnly`, `.macOSOnly`, `.iOSExcluded`, etc.) available for iOS, macOS, tvOS, visionOS, and watchOS allow selective application of view modifications on specific platforms

These modifiers help create platform-appropriate interfaces while keeping the code clean and maintainable.


### Border with Corner Radius

SwiftUI doesn't provide a straightforward way to add a border to a view with corner radius. The standard approach requires verbose overlay code that is hard to remember:

```swift
Text("Without HandySwiftUI")
    .padding()
    .overlay(
        RoundedRectangle(cornerRadius: 12)
            .strokeBorder(.blue, lineWidth: 2)
    )
```

HandySwiftUI simplifies this with a convenient border modifier:

```swift
Text("With HandySwiftUI")
    .padding()
    .roundedRectangleBorder(.blue, cornerRadius: 12, lineWidth: 2)
```

TODO: add example from TranslateKit badges

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

The example demonstrates `.applyIf` which applies different view modifications based on a boolean condition, and `.ifLet` which works like Swift's `if let` statement – providing non-optional access to optional values inside its closure. Both modifiers help reduce boilerplate code in SwiftUI views.


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


### Delete Confirmation Dialogs

SwiftUI's confirmation dialogs require repetitive boilerplate code for delete actions, especially when deleting items from a list:

```swift
struct TodoView: View {
    @State private var showDeleteConfirmation = false
    @State private var todos = ["Buy milk", "Walk dog"]
    @State private var todoToDelete: String?
    
    var body: some View {
        List {
            ForEach(todos, id: \.self) { todo in
                Text(todo)
                    .swipeActions {
                        Button("Delete", role: .destructive) {
                            todoToDelete = todo
                            showDeleteConfirmation = true
                        }
                    }
            }
        }
        .confirmationDialog("Are you sure?", isPresented: $showDeleteConfirmation) {
            Button("Delete", role: .destructive) {
                if let todo = todoToDelete {
                    todos.removeAll { $0 == todo }
                    todoToDelete = nil
                }
            }
            Button("Cancel", role: .cancel) {
                todoToDelete = nil
            }
        } message: {
            Text("This delete action cannot be undone. Continue?")
        }
    }
}
```

HandySwiftUI simplifies this with a dedicated modifier:

```swift
struct TodoView: View {
    @State private var todoToDelete: String?
    @State private var todos = ["Buy milk", "Walk dog"]
    
    var body: some View {
        List {
            ForEach(todos, id: \.self) { todo in
                Text(todo)
                    .swipeActions {
                        Button("Delete", role: .destructive) {
                            todoToDelete = todo
                        }
                    }
            }
        }
        .confirmDeleteDialog(item: $todoToDelete) { item in
            todos.removeAll { $0 == item }
        }
    }
}
```

TODO: add example from CrossCraft when deleting a puzzle

The example shows how `.confirmDeleteDialog` handles the entire deletion flow – from confirmation to execution – with a single modifier. The dialog is automatically localized in ~40 languages and follows platform design guidelines. You can provide an optional `message` parameter in case you need to provide a different message. There's also an overload that takes a boolean for situations where no list is involved.

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

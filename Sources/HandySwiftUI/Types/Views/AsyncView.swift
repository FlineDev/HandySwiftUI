import SwiftUI

/// A view that manages async operations with built-in loading, error, and success states.
///
/// `AsyncView` simplifies handling asynchronous operations in SwiftUI by automatically managing
/// the loading, error, and success states. It displays a progress indicator during loading,
/// shows an error message with retry option if the operation fails, and renders your custom
/// success content when the operation completes successfully.
///
/// # Key Features
/// - Automatic state management for async operations
/// - Built-in loading indicator with localized "Loading…" message
/// - Error view with localized error message and "Try again" button
/// - Optional result storage for accessing loaded data outside the view
/// - Task cancellation on view disappearance
/// - Fully localized error messages (40+ languages supported)
///
/// # Usage Examples
///
/// ## Basic usage without result storage
/// When you don't need to access the loaded data outside the success content:
/// ```swift
/// struct ProjectView: View {
///     var body: some View {
///         AsyncView(performTask: loadProject) { project in
///             VStack {
///                 Text(project.name)
///                 Text(project.description)
///             }
///         }
///     }
///
///     func loadProject() async throws -> Project {
///         try await APIClient.fetchProject(id: "123")
///     }
/// }
/// ```
///
/// ## With result storage (optional binding)
/// When you want to access the loaded data from other parts of your view:
/// ```swift
/// struct ProfileView: View {
///     @State private var user: User?
///
///     var body: some View {
///         VStack {
///             AsyncView(
///                 performTask: loadUser,
///                 storeResultIn: $user
///             ) { loadedUser in
///                 ProfileDetails(user: loadedUser)
///             }
///
///             // Access user data here if needed
///             if let user {
///                 Text("Email: \(user.email)")
///             }
///         }
///     }
///
///     func loadUser() async throws -> User {
///         try await APIClient.fetchCurrentUser()
///     }
/// }
/// ```
///
/// ## With result storage (non-optional binding)
/// When your storage is non-optional (has a default value):
/// ```swift
/// struct DocumentView: View {
///     @State private var content: String = ""
///
///     var body: some View {
///         AsyncView(
///             performTask: loadDocument,
///             storeResultIn: $content
///         ) {
///             // No parameter needed - access via storage directly
///             TextEditor(text: $content)
///         }
///     }
///
///     func loadDocument() async throws -> String {
///         try await FileManager.loadDocument(at: documentURL)
///     }
/// }
/// ```
///
/// ## Nested AsyncView for multi-stage loading
/// You can nest `AsyncView` instances to load data in multiple stages, where each stage
/// depends on the previous one. This is particularly useful for complex data loading scenarios:
/// ```swift
/// struct ProjectDetailsView: View {
///     var body: some View {
///         // Stage 1: Load project metadata
///         AsyncView(performTask: loadProject) { project in
///             // Stage 2: Load project files (requires project from stage 1)
///             AsyncView(performTask: { try await loadFiles(for: project) }) { files in
///                 // Stage 3: Process files (requires files from stage 2)
///                 AsyncView(performTask: { try await processFiles(files) }) { _ in
///                     // All loading complete - show final UI
///                     ProjectContentView(project: project, files: files)
///                 }
///             }
///         }
///     }
///
///     func loadProject() async throws -> Project {
///         try await APIClient.fetchProject()
///     }
///
///     func loadFiles(for project: Project) async throws -> [File] {
///         try await FileManager.loadFiles(at: project.url)
///     }
///
///     func processFiles(_ files: [File]) async throws {
///         for file in files {
///             try await processFile(file)
///         }
///     }
/// }
/// ```
///
/// ## Custom loading and failure views
/// Replace the default loading or failure view with your own. The failure view receives the
/// localized error message and an action that runs the task again:
/// ```swift
/// AsyncView(performTask: loadProject) { project in
///     ProjectDetails(project: project)
/// }
/// .loadingContent {
///     ProjectSkeletonView()
/// }
/// .failureContent { errorMessage, retry in
///     ContentUnavailableView {
///         Label("Could not load project", systemImage: "exclamationmark.triangle")
///     } description: {
///         Text(errorMessage)
///     } actions: {
///         Button("Try again", action: retry)
///     }
/// }
/// ```
///
/// ## Best Practices
/// - Use `storeResultIn` parameter when you need to access the loaded data outside the success closure
/// - The success closure receives the loaded value as a parameter when using optional storage
/// - With non-optional storage, access the data via the binding directly (no parameter in closure)
/// - Nest `AsyncView` instances for multi-stage loading where each stage depends on the previous
/// - The async task is automatically cancelled when the view disappears
///
/// - Note: All UI text (loading message, error message, retry button) is automatically localized
///         in 40+ languages via the HandySwiftUI module's built-in localizations.
public struct AsyncView<ResultType: Sendable, SuccessContent: View, LoadingContent: View, FailureContent: View>: View {
   enum SuccessContentCallback {
      case withResult((ResultType) -> SuccessContent)
      case withoutResult(() -> SuccessContent)

      /// Takes over the callback of an `AsyncView` that differs only in its loading or failure content.
      init<OtherLoading, OtherFailure>(_ other: AsyncView<ResultType, SuccessContent, OtherLoading, OtherFailure>.SuccessContentCallback) {
         switch other {
         case .withResult(let callback): self = .withResult(callback)
         case .withoutResult(let callback): self = .withoutResult(callback)
         }
      }

      func perform(result: ResultType) -> SuccessContent {
         switch self {
         case .withResult(let callback): return callback(result)
         case .withoutResult(let callback): return callback()
         }
      }
   }

   @State private var progressState: AsyncResult<ResultType, String> = .notStarted

   let successContentCallback: SuccessContentCallback
   let performTask: () async throws -> ResultType
   let loadingContent: () -> LoadingContent
   let failureContent: (_ errorMessage: String, _ retry: @escaping () -> Void) -> FailureContent

   let resultOptionalStorage: Binding<ResultType?>?
   let resultDefaultValueStorage: Binding<ResultType>?

   @State private var task: Task<Void, Error>?

   init(
      successContentCallback: SuccessContentCallback,
      performTask: @escaping () async throws -> ResultType,
      resultOptionalStorage: Binding<ResultType?>?,
      resultDefaultValueStorage: Binding<ResultType>?,
      loadingContent: @escaping () -> LoadingContent,
      failureContent: @escaping (_ errorMessage: String, _ retry: @escaping () -> Void) -> FailureContent
   ) {
      self.successContentCallback = successContentCallback
      self.performTask = performTask
      self.resultOptionalStorage = resultOptionalStorage
      self.resultDefaultValueStorage = resultDefaultValueStorage
      self.loadingContent = loadingContent
      self.failureContent = failureContent
   }

   /// Replaces the default loading view, which shows a progress indicator with a localized "Loading…" label.
   ///
   /// - Parameter loadingContent: A view builder that returns the view to show while the task runs.
   public func loadingContent<NewLoadingContent: View>(
      @ViewBuilder _ loadingContent: @escaping () -> NewLoadingContent
   ) -> AsyncView<ResultType, SuccessContent, NewLoadingContent, FailureContent> {
      AsyncView<ResultType, SuccessContent, NewLoadingContent, FailureContent>(
         successContentCallback: .init(self.successContentCallback),
         performTask: self.performTask,
         resultOptionalStorage: self.resultOptionalStorage,
         resultDefaultValueStorage: self.resultDefaultValueStorage,
         loadingContent: loadingContent,
         failureContent: self.failureContent
      )
   }

   /// Replaces the default failure view, which shows the localized error message and a "Try again" button.
   ///
   /// - Parameter failureContent: A view builder that receives the localized error message and an action that runs the task again.
   public func failureContent<NewFailureContent: View>(
      @ViewBuilder _ failureContent: @escaping (_ errorMessage: String, _ retry: @escaping () -> Void) -> NewFailureContent
   ) -> AsyncView<ResultType, SuccessContent, LoadingContent, NewFailureContent> {
      AsyncView<ResultType, SuccessContent, LoadingContent, NewFailureContent>(
         successContentCallback: .init(self.successContentCallback),
         performTask: self.performTask,
         resultOptionalStorage: self.resultOptionalStorage,
         resultDefaultValueStorage: self.resultDefaultValueStorage,
         loadingContent: self.loadingContent,
         failureContent: failureContent
      )
   }

   public var body: some View {
      Group {
         switch self.progressState {
         case .notStarted:
            Color.clear
               .onAppear {
                  self.startPerformingTask()
               }

         case .inProgress:
            self.loadingContent()

         case .failed(let errorMessage):
            self.failureContent(errorMessage) {
               self.startPerformingTask()
            }

         case .successful(let result):
            self.successContentCallback.perform(result: result)
         }
      }
      .onDisappear {
         self.task?.cancel()
      }
   }

   private func startPerformingTask() {
      self.progressState = .inProgress

      self.task = Task {
         do {
            let value = try await self.performTask()

            await MainActor.run {
               self.resultDefaultValueStorage?.wrappedValue = value
               self.resultOptionalStorage?.wrappedValue = value
               self.progressState = .successful(value: value)
            }
         } catch {
            await MainActor.run {
               self.progressState = .failed(error: error.localizedDescription)
            }
         }
      }
   }
}

extension AsyncView where LoadingContent == AsyncViewDefaultLoadingView, FailureContent == AsyncViewDefaultFailureView {
   /// Creates an `AsyncView` with optional result storage.
   ///
   /// Use this initializer when you need to access the loaded data from other parts of your view,
   /// and the storage variable is optional (can be `nil`).
   ///
   /// - Parameters:
   ///   - performTask: An async throwing closure that performs the asynchronous operation and returns the result.
   ///   - resultOptionalStorage: A binding to an optional storage variable where the result will be saved.
   ///   - successContent: A view builder that receives the loaded result and returns the success content to display.
   ///
   /// - Note: The success content receives the loaded value as a parameter for convenience in read-only access.
   ///         For write operations, use the bound storage variable directly.
   public init(
      performTask: @escaping () async throws -> ResultType,
      storeResultIn resultOptionalStorage: Binding<ResultType?>,
      @ViewBuilder successContent: @escaping (ResultType) -> SuccessContent
   ) {
      self.init(
         successContentCallback: .withResult(successContent),
         performTask: performTask,
         resultOptionalStorage: resultOptionalStorage,
         resultDefaultValueStorage: nil,
         loadingContent: { AsyncViewDefaultLoadingView() },
         failureContent: { AsyncViewDefaultFailureView(errorMessage: $0, retry: $1) }
      )
   }

   /// Creates an `AsyncView` with non-optional result storage.
   ///
   /// Use this initializer when you need to access the loaded data from other parts of your view,
   /// and the storage variable has a default value (is non-optional).
   ///
   /// - Parameters:
   ///   - performTask: An async throwing closure that performs the asynchronous operation and returns the result.
   ///   - resultDefaultValueStorage: A binding to a non-optional storage variable where the result will be saved.
   ///   - successContent: A view builder that returns the success content to display.
   ///
   /// - Note: The success content does not receive a parameter since the result is available
   ///         directly from the non-optional storage binding.
   public init(
      performTask: @escaping () async throws -> ResultType,
      storeResultIn resultDefaultValueStorage: Binding<ResultType>,
      @ViewBuilder successContent: @escaping () -> SuccessContent
   ) {
      self.init(
         successContentCallback: .withoutResult(successContent),
         performTask: performTask,
         resultOptionalStorage: nil,
         resultDefaultValueStorage: resultDefaultValueStorage,
         loadingContent: { AsyncViewDefaultLoadingView() },
         failureContent: { AsyncViewDefaultFailureView(errorMessage: $0, retry: $1) }
      )
   }

   /// Creates an `AsyncView` without result storage.
   ///
   /// Use this initializer when you only need to access the loaded data within the success content
   /// and don't need to store it in a separate state variable.
   ///
   /// - Parameters:
   ///   - performTask: An async throwing closure that performs the asynchronous operation and returns the result.
   ///   - successContent: A view builder that receives the loaded result and returns the success content to display.
   public init(
      performTask: @escaping () async throws -> ResultType,
      @ViewBuilder successContent: @escaping (ResultType) -> SuccessContent
   ) {
      self.init(
         successContentCallback: .withResult(successContent),
         performTask: performTask,
         resultOptionalStorage: nil,
         resultDefaultValueStorage: nil,
         loadingContent: { AsyncViewDefaultLoadingView() },
         failureContent: { AsyncViewDefaultFailureView(errorMessage: $0, retry: $1) }
      )
   }
}

/// The loading view `AsyncView` shows by default: a progress indicator with a localized "Loading…" label.
public struct AsyncViewDefaultLoadingView: View {
   public var body: some View {
      ProgressView(String(localized: "Loading…", bundle: .module))
         .padding()
   }
}

/// The failure view `AsyncView` shows by default: the localized error message and a "Try again" button.
public struct AsyncViewDefaultFailureView: View {
   let errorMessage: String
   let retry: () -> Void

   public var body: some View {
      VStack {
         Text("Failed to load with error: \(self.errorMessage)", bundle: .module)

         Button(String(localized: "Try again", bundle: .module), action: self.retry)
      }
      .padding()
   }
}

#if DEBUG && swift(>=6.0)
   func previewLoadingTask() async throws -> String {
      try await Task.sleep(for: .seconds(1))
      return "/fake/path/to/project"
   }

   #Preview {
      @Previewable @State var projectPath: String = ""

      AsyncView(performTask: previewLoadingTask, storeResultIn: $projectPath) {
         Text(verbatim: "Project Path: \(projectPath)")
      }
   }

   #Preview("Custom Loading and Failure") {
      AsyncView(performTask: { () async throws -> String in throw CancellationError() }) { value in
         Text(verbatim: value)
      }
      .loadingContent {
         Image(systemName: "hourglass")
      }
      .failureContent { errorMessage, retry in
         Button(action: retry) {
            Label(errorMessage, systemImage: "arrow.clockwise")
         }
      }
   }
#endif

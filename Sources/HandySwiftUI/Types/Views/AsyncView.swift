import SwiftUI

// TODO: make view more customizable with customizable in progress view (keep the default) and a customizable failed view (keep the default)

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
/// ## Best Practices
/// - Use `storeResultIn` parameter when you need to access the loaded data outside the success closure
/// - The success closure receives the loaded value as a parameter when using optional storage
/// - With non-optional storage, access the data via the binding directly (no parameter in closure)
/// - Nest `AsyncView` instances for multi-stage loading where each stage depends on the previous
/// - The async task is automatically cancelled when the view disappears
///
/// - Note: All UI text (loading message, error message, retry button) is automatically localized
///         in 40+ languages via the HandySwiftUI module's built-in localizations.
public struct AsyncView<ResultType: Sendable, SuccessContent: View>: View {
   enum SuccessContentCallback {
      case withResult((ResultType) -> SuccessContent)
      case withoutResult(() -> SuccessContent)

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

   let resultOptionalStorage: Binding<ResultType?>?
   let resultDefaultValueStorage: Binding<ResultType>?

   @State private var task: Task<Void, Error>?

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
      self.successContentCallback = .withResult(successContent)
      self.performTask = performTask
      self.resultOptionalStorage = resultOptionalStorage
      self.resultDefaultValueStorage = nil
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
      self.successContentCallback = .withoutResult(successContent)
      self.performTask = performTask
      self.resultOptionalStorage = nil
      self.resultDefaultValueStorage = resultDefaultValueStorage
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
      self.successContentCallback = .withResult(successContent)
      self.performTask = performTask
      self.resultOptionalStorage = nil
      self.resultDefaultValueStorage = nil
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
            ProgressView(String(localized: "Loading…", bundle: .module))
               .padding()

         case .failed(let errorMessage):
            VStack {
               Text("Failed to load with error: \(errorMessage)", bundle: .module)

               Button(String(localized: "Try again", bundle: .module)) {
                  self.startPerformingTask()
               }
            }
            .padding()

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

#if DEBUG && swift(>=6.0)
   func previewLoadingTask() async throws -> String {
      try await Task.sleep(for: .seconds(1))
      return "/fake/path/to/project"
   }

   @available(iOS 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
   #Preview {
      @Previewable @State var projectPath: String = ""

      AsyncView(performTask: previewLoadingTask, storeResultIn: $projectPath) {
         Text(verbatim: "Project Path: \(projectPath)")
      }
   }
#endif

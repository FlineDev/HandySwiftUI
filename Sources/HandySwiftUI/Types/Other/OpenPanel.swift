#if os(macOS)
   import AppKit
   import UniformTypeIdentifiers

   /// A wrapper around NSOpenPanel that provides a simplified interface for selecting files or directories in macOS applications.
   /// This brings OpenPanel to SwiftUI views without a need to import AppKit or deal with legacy-style APIs.
   ///
   /// This struct provides two main initialization paths:
   /// 1. File selection with specified content type restrictions
   /// 2. Directory selection
   ///
   /// All panel operations are performed on the main actor to ensure thread safety with UI operations.
   ///
   /// The type maintains a cache of URLs that the application has been granted write access to during the current session.
   /// Use `hasWriteAccess(to:)` to check if write access is available for a specific URL.
   ///
   /// Example usage:
   /// ```swift
   /// // Select a PDF file
   /// let pdfPanel = OpenPanel(
   ///     fileWithMessage: "Choose a PDF file",
   ///     buttonTitle: "Select PDF",
   ///     contentType: .pdf,
   ///     initialDirectoryUrl: FileManager.default.documentsDirectory
   /// )
   /// if let selectedPDF = await pdfPanel.showAndAwaitSingleSelection() {
   ///     // Process the selected PDF file
   ///     print("Selected PDF at: \(selectedPDF.path)")
   /// }
   ///
   /// // Select multiple image files
   /// let imagePanel = OpenPanel(
   ///     fileWithMessage: "Choose images",
   ///     buttonTitle: "Select Images",
   ///     contentType: .image,
   ///     initialDirectoryUrl: nil
   /// )
   /// let selectedImages = await imagePanel.showAndAwaitMultipleSelection()
   /// print("Selected \(selectedImages.count) images")
   ///
   /// // Select a directory
   /// let directoryPanel = OpenPanel(
   ///     directoryWithMessage: "Choose output folder",
   ///     buttonTitle: "Select Folder",
   ///     initialDirectoryUrl: nil
   /// )
   /// if let selectedDirectory = await directoryPanel.showAndAwaitSingleSelection() {
   ///     print("Selected directory: \(selectedDirectory.path)")
   /// }
   ///
   /// // Check if we have write access to a specific URL
   /// if OpenPanel.hasWriteAccess(to: someURL) {
   ///     // Perform write operations...
   /// }
   /// ```
   @MainActor
   public struct OpenPanel {
      private let openPanel: NSOpenPanel = .init()

      /// URLs that the application has been granted write access to during the current session.
      static var urlsWithWriteAccess: Set<URL> = []

      /// Checks if the application currently has write access to the specified URL.
      ///
      /// This method checks both direct access (if the URL itself was selected) and indirect access
      /// (if any parent directory of the URL was selected). The access information is maintained
      /// only for the current application session.
      ///
      /// - Parameter url: The URL to check for write access
      /// - Returns: `true` if write access is available, `false` otherwise
      public static func hasWriteAccess(to url: URL) -> Bool {
         // Check if we have direct access to the URL
         if self.urlsWithWriteAccess.contains(where: { url.normalizedPath == $0.normalizedPath }) {
            return true
         } else {
            // Check if we have access to any parent directory
            return self.urlsWithWriteAccess.contains { $0.isParent(of: url) }
         }
      }

      /// Creates an OpenPanel configured for selecting a files of a specific type.
      ///
      /// - Parameters:
      ///   - message: The informative message shown in the panel
      ///   - buttonTitle: The title of the confirmation button
      ///   - contentType: The UTType restricting the types of files that can be selected (defaults to `.item` which allows any file)
      ///   - initialDirectoryUrl: The directory to start browsing from (defaults to `nil`)
      ///   - showHiddenFiles: Whether hidden files should be visible in the panel (defaults to `false`)
      public init(
         filesWithMessage message: String,
         buttonTitle: String,
         contentType: UTType = .item,
         initialDirectoryUrl: URL? = nil,
         showHiddenFiles: Bool = false
      ) {
         self.init()

         self.openPanel.prompt = buttonTitle
         self.openPanel.message = message
         self.openPanel.canChooseDirectories = false
         self.openPanel.canChooseFiles = true
         self.openPanel.allowedContentTypes = [contentType]
         self.openPanel.showsHiddenFiles = showHiddenFiles

         if let initialDirectoryUrl {
            self.openPanel.directoryURL = initialDirectoryUrl
         }
      }

      /// Creates an OpenPanel configured for selecting directories.
      ///
      /// - Parameters:
      ///   - message: The informative message shown in the panel
      ///   - buttonTitle: The title of the confirmation button
      ///   - initialDirectoryUrl: The directory to start browsing from (defaults to `nil`)
      ///   - showHiddenFiles: Whether hidden files should be visible in the panel (defaults to `false`)
      public init(
         directoriesWithMessage message: String,
         buttonTitle: String,
         initialDirectoryUrl: URL? = nil,
         showHiddenFiles: Bool = false
      ) {
         self.init()

         self.openPanel.prompt = buttonTitle
         self.openPanel.message = message
         self.openPanel.canChooseDirectories = true
         self.openPanel.canChooseFiles = false
         self.openPanel.showsHiddenFiles = showHiddenFiles

         if let initialDirectoryUrl {
            self.openPanel.directoryURL = initialDirectoryUrl
         }
      }

      /// Private initializer setting common default values
      private init() {
         self.openPanel.canCreateDirectories = false
         self.openPanel.isExtensionHidden = false
      }

      /// Shows the panel and waits for the user to select a single file or directory.
      ///
      /// This method blocks the current actor until the user makes a selection or cancels the panel.
      ///
      /// - Returns: The URL of the selected file or directory, or nil if the user cancelled
      public func showAndAwaitSingleSelection() -> URL? {
         self.openPanel.allowsMultipleSelection = false

         let modalResponse: NSApplication.ModalResponse = self.openPanel.runModal()
         switch modalResponse {
         case .OK:
            guard let url = self.openPanel.url else { return nil }

            Self.urlsWithWriteAccess.insert(url)
            return url

         default:
            return nil
         }
      }

      /// Shows the panel and waits for the user to select one or more files or directories.
      ///
      /// This method blocks the current actor until the user makes a selection or cancels the panel.
      ///
      /// - Returns: An array of selected URLs, or an empty array if the user cancelled
      public func showAndAwaitMultipleSelection() -> [URL] {
         self.openPanel.allowsMultipleSelection = true

         let modalResponse: NSApplication.ModalResponse = self.openPanel.runModal()
         switch modalResponse {
         case .OK:
            self.openPanel.urls.forEach { Self.urlsWithWriteAccess.insert($0) }
            return self.openPanel.urls

         default:
            return []
         }
      }
   }

   extension URL {
      /// Returns the path with leading slashes removed.
      fileprivate var normalizedPath: String {
         self.path(percentEncoded: false).trimmingCharacters(in: CharacterSet(charactersIn: "/"))
      }

      /// Returns true if self is a parent path of the provided URL.
      fileprivate func isParent(of url: URL) -> Bool {
         let parentPath = self.normalizedPath + "/"
         let childPath = url.normalizedPath
         return childPath.hasPrefix(parentPath)
      }
   }
#endif

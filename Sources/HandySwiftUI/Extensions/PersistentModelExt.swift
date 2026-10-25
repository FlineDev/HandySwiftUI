#if canImport(SwiftData)
   import SwiftData

   extension PersistentModel {
      /// Returns whether this model instance is currently managed by a `ModelContext`.
      ///
      /// Use this property to determine if a model instance has been inserted into a `ModelContext` or if it's just an in-memory
      /// instance that was never inserted. Inserting is enough for this to be `true`: the model might not be saved to the store yet.
      /// To check whether it was saved, use `persistentModelID.isTemporary` (iOS 27, macOS 27, tvOS 27, watchOS 27, visionOS 27).
      ///
      /// Example:
      /// ```swift
      /// let task = Task(title: "New Task")
      /// print(task.isPersisted) // false
      ///
      /// modelContext.insert(task)
      /// print(task.isPersisted) // true
      /// ```
      public var isPersisted: Bool {
         self.modelContext != nil
      }
   }
#endif

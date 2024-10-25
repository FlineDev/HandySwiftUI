#if canImport(SwiftData)
import SwiftData

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension PersistentModel {
   /// Returns whether this model instance is currently managed by a ModelContext.
   ///
   /// Use this property to determine if a model instance has ever been inserted into
   /// a ModelContext (i.e., exists in the database) or if it's just an in-memory instance
   /// that hasn't been saved yet.
   ///
   /// Example:
   /// ```swift
   /// let task = Task(title: "New Task")
   /// print(task.isPersisted) // false
   ///
   /// try modelContext.insert(task)
   /// print(task.isPersisted) // true
   /// ```
   public var isPersisted: Bool {
      self.modelContext != nil
   }
}
#endif

import Foundation

extension Notification.Name {
   /// Returns the publisher of the notification on the default notification center.
   ///
   /// This property provides a convenient way to access a publisher for the notification
   /// without explicitly specifying the notification center.
   ///
   /// - Returns: A `NotificationCenter.Publisher` for this notification name.
   ///
   /// - Example:
   ///   ```swift
   ///   let notificationName = Notification.Name("CustomNotification")
   ///   let cancellable = notificationName.publisher
   ///       .sink { notification in
   ///           print("Received notification: \(notification)")
   ///       }
   ///   ```
   public var publisher: NotificationCenter.Publisher {
      NotificationCenter.default.publisher(for: self)
   }

   /// Posts the notification on the given center using the given object.
   ///
   /// This method provides a convenient way to post a notification without
   /// explicitly creating a `Notification` object.
   ///
   /// - Parameters:
   ///   - object: The object posting the notification. Defaults to `nil`.
   ///   - center: The notification center on which to post the notification. Defaults to `.default`.
   ///
   /// - Example:
   ///   ```swift
   ///   let notificationName = Notification.Name("CustomNotification")
   ///   notificationName.post(object: self)
   ///   ```
   public func post(object: Any? = nil, on center: NotificationCenter = .default) {
      center.post(name: self, object: object)
   }
}

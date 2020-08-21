import Foundation

extension Notification.Name {
    /// Returns the publisher of the notification on the default center.
    public var publisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: self)
    }

    /// Posts the notification on the given center using the given object. By default the center is `default` and the object is `nil`.
    public func post(object: Any? = nil, on center: NotificationCenter = .default) {
        center.post(name: self, object: object)
    }
}


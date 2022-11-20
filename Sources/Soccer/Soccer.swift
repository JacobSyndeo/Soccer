import Foundation

public protocol SoccerPropertyStoring {
    associatedtype T
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T?) -> T?
}

public extension SoccerPropertyStoring {
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T? = nil) -> T? {
        guard let value = objc_getAssociatedObject(self, key) as? T else {
            return defaultValue
        }
        return value
    }
}

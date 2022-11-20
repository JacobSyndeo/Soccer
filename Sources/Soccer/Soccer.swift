import Foundation

public protocol SoccerPropertyStoring: NSObject {
    associatedtype T
    
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T?) -> T?
    func setAssociatedObject(_ key: UnsafeRawPointer!, newValue: T?)
}

public extension SoccerPropertyStoring {
    // No stored property support in extensions? Pah, simpletons. Associated Objects to the rescue!
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T? = nil) -> T? {
        guard let value = objc_getAssociatedObject(self, key) as? T else {
            return defaultValue
        }
        return value
    }
    
    // All hail the Obj-C runtime!
    func setAssociatedObject(_ key: UnsafeRawPointer!, newValue: T?) {
        return objc_setAssociatedObject(self, key, newValue, .OBJC_ASSOCIATION_ASSIGN)
    }
}

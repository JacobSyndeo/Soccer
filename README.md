# Soccer ⚽️

A small protocol and extension to help you use the Objective-C Runtime's Associated Objects[^1] system.

For example, suppose you wanted to extend UIAlertAction, and add a new property to it.

"Impossible!", you say? Just watch.

```Swift
fileprivate struct CustomProperties {
    static var icon: UIAlertAction.Icon? = nil
}

extension UIAlertAction: SoccerPropertyStoring {
    public typealias T = Icon
    
    private var _icon: Icon? {
        get { // No stored property support in extensions? Pah, simpletons. Associated Objects to the rescue!
            return getAssociatedObject(&CustomProperties.icon)
        }
        set { // All hail the Obj-C runtime!
            return setAssociatedObject(&CustomProperties.icon, newValue: newValue)
        }
    }
}
```

_Et voilà…_ you can now get and set a property in an extension of an object.

"What sorcery is this‽", you cry out. To which, I reply… "Just the Objective-C runtime happily working its magic."

As with any great power, this comes with great responsibility. Use it wisely, use it judiciously, use it appropriately.

[^1]: Soccer, being short for "Association Football", was the only (SFW) name I could come up related to "associated". Oh well… 🙃 

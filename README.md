# TextView

> The missing TextView in SwiftUI

## Download

- File -> Swift Packages -> Add Package Dependency...
- Select your project
- Enter `https://github.com/kenmueller/TextView` for the package repository URL
- Select **Branch**: master
- Click **Finish**

## Inputs

- `text: Binding<String>`
- `isEditing: Binding<Bool>`
	- The `TextView` will modify the value when it is selected and deselected
	- You can also modify this value to automatically select and deselect the `TextView`
- `placeholder: String? = nil`
- `textAlignment: TextView.TextAlignment = .left`
- `textHorizontalPadding: CGFloat = 0`
- `textVerticalPadding: CGFloat = 7`
- `placeholderAlignment: Alignment = .topLeading`
- `placeholderHorizontalPadding: CGFloat = 4.5`
- `placeholderVerticalPadding: CGFloat = 7`
- `font: UIFont = .preferredFont(forTextStyle: .body)`
	- By default, the font is a body-style font
- `textColor: UIColor = .black`
- `placeholderColor: Color = .gray`
- `backgroundColor: UIColor = .white`
- `contentType: TextView.ContentType? = nil`
	- For semantic purposes only
- `autocorrection: TextView.Autocorrection = .default`
- `autocapitalization: TextView.Autocapitalization = .sentences`
- `isSecure: Bool = false`
- `isEditable: Bool = true`
- `isSelectable: Bool = true`
- `isScrollingEnabled: Bool = true`
- `isUserInteractionEnabled: Bool = true`
- `shouldWaitUntilCommit: Bool = true`
	- For multi-stage input methods, setting this to `false` would make the `TextView` completely unusable.
	- This option will ignore text changes when the user is still composing characters.
-`shouldChange: TextView.ShouldChangeHandler = nil`
	- `TextView.ShouldChangeHandler` is of type `(NSRange, String)` and is called
	  with the arguments to `textView(_:shouldChangeTextIn:replacementText:)`.
	  See that `UITextViewDelegate` method for more information.

## Example

```swift
import SwiftUI
import TextView

struct ContentView: View {
    @State var text = ""
    @State var isEditing = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.isEditing.toggle()
            }) {
                Text("\(isEditing ? "Stop" : "Start") editing")
            }
            TextView(
                text: $text,
                isEditing: $isEditing,
                placeholder: "Enter text here"
            )
        }
    }
}
```

## You might also find these useful...

- [**Audio** - _The easiest way to play Audio in Swift_](https://github.com/kenmueller/Audio)

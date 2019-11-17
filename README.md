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
- `textAlignment: TextView.TextAlignment = .left`
- `font: UIFont = .preferredFont(forTextStyle: .body)`
	- By default, the font is a body-style font
- `textColor: UIColor = .black`
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

## Example

```swift
import SwiftUI
import TextView

struct ContentView: View {
    @State var input = ""
    @State var isEditing = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.isEditing.toggle()
            }) {
                Text("\(isEditing ? "Stop" : "Start") editing")
            }
            TextView(text: $input, isEditing: $isEditing)
        }
    }
}
```

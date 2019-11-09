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
- `isEditing: Binding<Bool> or Bool`
	- If passed a `Binding<Bool>`, the `TextView` will modify the value when it is selected and deselected
	- If passed a `Bool`, the `TextView` will initially show or hide the keyboard based on the value passed in
- `textAlignment: TextView.TextAlignment = .left`
- `font: UIFont = UIFont(name: "HelveticaNeue", size: 15)`
	- By default, the family is Helvetica Nueue, and the size is 15.
- `textColor: UIColor = .black`
- `backgroundColor: UIColor = .white`
- `contentType: TextView.ContentType = .name`
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

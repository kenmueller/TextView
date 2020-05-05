#if !os(macOS)

import SwiftUI

@available(iOS 13.0, *)
public struct TextView: View {
	public struct Representable: UIViewRepresentable {
		public final class Coordinator: NSObject, UITextViewDelegate {
			private let parent: Representable
			
			public init(_ parent: Representable) {
				self.parent = parent
			}
			
			private func setIsEditing(to value: Bool) {
				DispatchQueue.main.async {
					self.parent.isEditing = value
				}
			}
			
			public func textViewDidChange(_ textView: UITextView) {
				parent.text = textView.text
			}
			
			public func textViewDidBeginEditing(_: UITextView) {
				setIsEditing(to: true)
			}
			
			public func textViewDidEndEditing(_: UITextView) {
				setIsEditing(to: false)
			}
		}
		
		@Binding private var text: String
		@Binding private var isEditing: Bool
		
		private let textAlignment: TextAlignment
		private let font: UIFont
		private let textColor: UIColor
		private let backgroundColor: UIColor
		private let contentType: ContentType?
		private let autocorrection: Autocorrection
		private let autocapitalization: Autocapitalization
		private let isSecure: Bool
		private let isEditable: Bool
		private let isSelectable: Bool
		private let isScrollingEnabled: Bool
		private let isUserInteractionEnabled: Bool
		private let shouldWaitUntilCommit: Bool
		
		public init(
			text: Binding<String>,
			isEditing: Binding<Bool>,
			textAlignment: TextAlignment,
			font: UIFont,
			textColor: UIColor,
			backgroundColor: UIColor,
			contentType: ContentType?,
			autocorrection: Autocorrection,
			autocapitalization: Autocapitalization,
			isSecure: Bool,
			isEditable: Bool,
			isSelectable: Bool,
			isScrollingEnabled: Bool,
			isUserInteractionEnabled: Bool,
			shouldWaitUntilCommit: Bool
		) {
			_text = text
			_isEditing = isEditing
			
			self.textAlignment = textAlignment
			self.font = font
			self.textColor = textColor
			self.backgroundColor = backgroundColor
			self.contentType = contentType
			self.autocorrection = autocorrection
			self.autocapitalization = autocapitalization
			self.isSecure = isSecure
			self.isEditable = isEditable
			self.isSelectable = isSelectable
			self.isScrollingEnabled = isScrollingEnabled
			self.isUserInteractionEnabled = isUserInteractionEnabled
			self.shouldWaitUntilCommit = shouldWaitUntilCommit
		}
		
		public func makeCoordinator() -> Coordinator {
			.init(self)
		}
		
		public func makeUIView(context: Context) -> UITextView {
			let textView = UITextView()
			textView.delegate = context.coordinator
			return textView
		}
		
		public func updateUIView(_ textView: UITextView, context _: Context) {
			if !shouldWaitUntilCommit || textView.markedTextRange == nil {
				textView.text = text
			}
			textView.textAlignment = textAlignment
			textView.font = font
			textView.textColor = textColor
			textView.backgroundColor = backgroundColor
			textView.textContentType = contentType
			textView.autocorrectionType = autocorrection
			textView.autocapitalizationType = autocapitalization
			textView.isSecureTextEntry = isSecure
			textView.isEditable = isEditable
			textView.isSelectable = isSelectable
			textView.isScrollEnabled = isScrollingEnabled
			textView.isUserInteractionEnabled = isUserInteractionEnabled
			
			DispatchQueue.main.async {
				_ = self.isEditing
					? textView.becomeFirstResponder()
					: textView.resignFirstResponder()
			}
		}
	}
	
	public typealias TextAlignment = NSTextAlignment
	public typealias ContentType = UITextContentType
	public typealias Autocorrection = UITextAutocorrectionType
	public typealias Autocapitalization = UITextAutocapitalizationType
	
	public static let defaultFont = UIFont.preferredFont(forTextStyle: .body)
	
	@Binding private var text: String
	@Binding private var isEditing: Bool
	
	private let placeholder: String?
	private let textAlignment: TextAlignment
	private let placeholderAlignment: Alignment
	private let placeholderHorizontalPadding: CGFloat
	private let placeholderVerticalPadding: CGFloat
	private let font: UIFont
	private let textColor: UIColor
	private let placeholderColor: Color
	private let backgroundColor: UIColor
	private let contentType: ContentType?
	private let autocorrection: Autocorrection
	private let autocapitalization: Autocapitalization
	private let isSecure: Bool
	private let isEditable: Bool
	private let isSelectable: Bool
	private let isScrollingEnabled: Bool
	private let isUserInteractionEnabled: Bool
	private let shouldWaitUntilCommit: Bool
	
	public init(
		text: Binding<String>,
		isEditing: Binding<Bool>,
		placeholder: String? = nil,
		textAlignment: TextAlignment = .left,
		placeholderAlignment: Alignment = .topLeading,
		placeholderHorizontalPadding: CGFloat = 4.5,
		placeholderVerticalPadding: CGFloat = 7,
		font: UIFont = Self.defaultFont,
		textColor: UIColor = .label,
		placeholderColor: Color = .init(.placeholderText),
		backgroundColor: UIColor = .clear,
		contentType: ContentType? = nil,
		autocorrection: Autocorrection = .default,
		autocapitalization: Autocapitalization = .sentences,
		isSecure: Bool = false,
		isEditable: Bool = true,
		isSelectable: Bool = true,
		isScrollingEnabled: Bool = true,
		isUserInteractionEnabled: Bool = true,
		shouldWaitUntilCommit: Bool = true
	) {
		_text = text
		_isEditing = isEditing
		
		self.placeholder = placeholder
		self.textAlignment = textAlignment
		self.placeholderAlignment = placeholderAlignment
		self.placeholderHorizontalPadding = placeholderHorizontalPadding
		self.placeholderVerticalPadding = placeholderVerticalPadding
		self.font = font
		self.textColor = textColor
		self.placeholderColor = placeholderColor
		self.backgroundColor = backgroundColor
		self.contentType = contentType
		self.autocorrection = autocorrection
		self.autocapitalization = autocapitalization
		self.isSecure = isSecure
		self.isEditable = isEditable
		self.isSelectable = isSelectable
		self.isScrollingEnabled = isScrollingEnabled
		self.isUserInteractionEnabled = isUserInteractionEnabled
		self.shouldWaitUntilCommit = shouldWaitUntilCommit
	}
	
	private var _placeholder: String? {
		text.isEmpty ? placeholder : nil
	}
	
	private var representable: Representable {
		.init(
			text: $text,
			isEditing: $isEditing,
			textAlignment: textAlignment,
			font: font,
			textColor: textColor,
			backgroundColor: backgroundColor,
			contentType: contentType,
			autocorrection: autocorrection,
			autocapitalization: autocapitalization,
			isSecure: isSecure,
			isEditable: isEditable,
			isSelectable: isSelectable,
			isScrollingEnabled: isScrollingEnabled,
			isUserInteractionEnabled: isUserInteractionEnabled,
			shouldWaitUntilCommit: shouldWaitUntilCommit
		)
	}
	
	public var body: some View {
		GeometryReader { geometry in
			ZStack {
				self.representable
				self._placeholder.map { placeholder in
					Text(placeholder)
						.font(.init(self.font))
						.foregroundColor(self.placeholderColor)
						.padding(.horizontal, self.placeholderHorizontalPadding)
						.padding(.vertical, self.placeholderVerticalPadding)
						.frame(
							width: geometry.size.width,
							height: geometry.size.height,
							alignment: self.placeholderAlignment
						)
						.onTapGesture {
							self.isEditing = true
						}
				}
			}
		}
	}
}

#endif

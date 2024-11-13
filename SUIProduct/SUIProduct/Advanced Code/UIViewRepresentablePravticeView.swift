//
//  UIViewRepresentablePravticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/17.
//

import SwiftUI

//UIkit -> swiftUI

struct UIViewRepresentablePravticeView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
            HStack {
                Text("SwiftUI:")
                TextField("Type here ...", text: $text)
                    .frame(height: 55)
                    .background(.gray)
            }
            HStack {
                Text("UIKit:")
                UITextFieldViewRepresentable(text: $text)
                    .updatePlaceholder("New placeholder")
                    .frame(height: 55)
                    .background(.gray)
            }
        }
    }
}

#Preview {
    UIViewRepresentablePravticeView()
}

struct UITextFieldViewRepresentable: UIViewRepresentable{
    
    @Binding var text:String
    var placeholder: String
    let placeholderColor: UIColor
    
    init(text: Binding<String>, placeholder: String = "Default placeholder...", placeholderColor: UIColor = .red) {
        self._text = text
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = getTextField()
        textField.delegate = context.coordinator
        return textField
    }
    //from swiftui to uikit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    private func getTextField() -> UITextField{
        let textField = UITextField(frame: .zero)
        let placeholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor : placeholderColor])
        textField.attributedPlaceholder = placeholder
        
        return textField
    }
    
    func updatePlaceholder(_ text: String) -> UITextFieldViewRepresentable{
        var viewRepresentable = self
        viewRepresentable.placeholder = text
        return viewRepresentable
    }
    
    //uikit to swiftui
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    class Coordinator: NSObject,UITextFieldDelegate{
        @Binding var text:String
        init(text: Binding<String>) {
            self._text = text
        }
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}

struct BasicUIViewRepresentable: UIViewRepresentable{
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

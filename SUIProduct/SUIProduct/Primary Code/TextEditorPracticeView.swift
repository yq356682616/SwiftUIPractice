//
//  TextEditorPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/3.
//

import SwiftUI

struct TextEditorPracticeView: View {
    @State var textEditorText: String = "This is a staring text."
    @State var saveText: String = ""
    var body: some View {
        NavigationStack{
            VStack{
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                    .foregroundStyle(.red)
                    .colorMultiply(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Button(action: {
                    saveText = textEditorText
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                Text(saveText)
                Spacer()
            }
            .padding()
//            .background(.green)
            .navigationTitle("Text Editor")
        }
    }
}

#Preview {
    TextEditorPracticeView()
}

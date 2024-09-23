//
//  ScrollViewReaderPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/9.
//

import SwiftUI
//代码滑动
struct ScrollViewReaderPracticeView: View {
    @State var scrollToIndex: Int = 0
    @State var textFieldText: String = ""
    var body: some View {
        VStack {
            TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 55)
                .border(.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("SCROLL NOW") {
                withAnimation(.spring()) {
                    if let index = Int(textFieldText){
                        scrollToIndex = index
                    }
                }
            }
            ScrollView {
                ScrollViewReader(content: { proxy in
                    
                    
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }.onChange(of: scrollToIndex) { oldValue, newValue in
                        withAnimation(.spring) {
                            proxy.scrollTo(newValue, anchor: nil)
                        }
                    }
                })
            }
        }
    }
}

#Preview {
    ScrollViewReaderPracticeView()
}

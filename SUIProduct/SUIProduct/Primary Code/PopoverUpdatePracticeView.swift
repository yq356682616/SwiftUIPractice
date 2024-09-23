//
//  PopoverUpdatePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/11.
//

import SwiftUI

struct PopoverUpdatePracticeView: View {
    @State private var showPopover: Bool = false
    @State private var feedbackOptions: [String] = [
        "Very good 😃",
        "Average 🙂",
        "Very bad 😡"
    ]
    
    var body: some View {
        ZStack(content: {
            Color.gray.ignoresSafeArea()
            Button("CLICK ME") {
                showPopover.toggle()
            }
            .padding()
            .background(.yellow)
            .popover(isPresented: $showPopover,attachmentAnchor: .point(.top), content: {
                ScrollView {
                    VStack(content: {
                        ForEach(feedbackOptions,id: \.self) { option in
                            Button(option) {
                                
                            }
                            if option != feedbackOptions.last{
                                Divider()
                            }
                        }
                    })
                    .padding(20)
                }
                    .presentationCompactAdaptation(.popover)
            })//改变位置
//            .popover(isPresented: $showPopover, content: {
//                Text("Hello, subscribers")
//                    .presentationCompactAdaptation(.popover)
//            })
        })
    }
}

#Preview {
    PopoverUpdatePracticeView()
}

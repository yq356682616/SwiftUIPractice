//
//  BindingPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/30.
//

import SwiftUI

struct BindingPracticeView: View {
    @State var background:Color = .green
    @State var title:String = "title"
    var body: some View {
        ZStack(content: {
            background.ignoresSafeArea(.all)
            VStack {
                Text(title)
                    .foregroundStyle(.white)
                ButtonView(background: $background, title: $title)
            }
        })
    }
}

#Preview {
    BindingPracticeView()
}
//绑定子视图修改父视图的变量
struct ButtonView: View {
    @Binding var background: Color
    @State var buttonColor:Color = .blue
    @Binding var title:String
    var body: some View {
        Button(action: {
            background = .orange
            buttonColor = .pink
            title = "new Title"
        }, label: {
            Text("button")
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
        })
    }
}

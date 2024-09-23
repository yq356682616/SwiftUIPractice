//
//  NewAnimationPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/11.
//

import SwiftUI

struct NewAnimationPracticeView: View {
    @State private var animate1: Bool = false
    @State private var animate2: Bool = false
    var body: some View {
        ZStack(content: {
            VStack(spacing: 50.0, content: {
                Button("Action 1") {
                    animate1.toggle()
                }
                Button("Action 2") {
                    animate2.toggle()
                }
                ZStack {
                    Rectangle()
                        .frame(width: 100,height: 100)
                        .frame(maxWidth: .infinity,alignment: animate1 ? .leading : .trailing)
                        .background(.green)
                        .frame(maxHeight: .infinity,alignment: animate2 ? .top : .bottom)
                        .background(.orange)
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .background(.red)
            })
        })
        .animation(.spring, value: animate1)
        .animation(.linear, value: animate2)
    }
}

#Preview {
    NewAnimationPracticeView()
}

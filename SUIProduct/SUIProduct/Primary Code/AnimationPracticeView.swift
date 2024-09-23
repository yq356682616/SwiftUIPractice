//
//  AnimationPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/30.
//

import SwiftUI

struct AnimationPracticeView: View {
    @State var isAnimated: Bool = false
    var body: some View {
        VStack(content: {
            Button("Button") {
                isAnimated.toggle()
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? .red : .green)
                .frame(width: isAnimated ? 100 : 300,
                       height: isAnimated ? 100 : 300)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
                .animation(.default.repeatCount(10), value: isAnimated)
            Spacer()
        })
    }
}

#Preview {
    AnimationPracticeView()
}

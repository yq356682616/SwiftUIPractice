//
//  AnimationTimingPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/30.
//

import SwiftUI

struct AnimationTimingPracticeView: View {
    @State var isAnimating: Bool = false
    let timing: Double = 10.0
    var body: some View {
        VStack(content: {
            Button("Button") {
                isAnimating.toggle()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50,height: 100)
                .animation(.spring(response: 1,
                                   dampingFraction:0.6 ,//阻尼
                                   blendDuration: 1.0), value: isAnimating)
//                .animation(.spring(), value: isAnimating)//弹簧
//                .animation(.linear(duration: timing), value: isAnimating)//同速度
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50,height: 100)
//                .animation(.easeIn(duration: timing), value: isAnimating)//先慢后快
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50,height: 100)
//                .animation(.easeInOut(duration: timing), value: isAnimating)//慢快慢
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50,height: 100)
//                .animation(.easeOut(duration: timing), value: isAnimating)//快慢
            
        })
    }
}

#Preview {
    AnimationTimingPracticeView()
}

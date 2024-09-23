//
//  DragGesturePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/9.
//

import SwiftUI

struct DragGesturePracticeView: View {
    @State var offset: CGSize = .zero
    var body: some View {
        ZStack {
            VStack(content: {
                Text("\(offset.width)")
                Spacer()
            })
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300,height: 500)
                .scaleEffect(getScaleAmount())
                .offset(offset)
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring) {
                                offset = value.translation
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring) {
                                offset = .zero
                            }
                        })
            )
        }
    }
    
    func getScaleAmount() -> CGFloat{
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    func getRotationAmount() -> Double{
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        let maxAngle: Double = 10
        return percentageAsDouble * maxAngle
    }
}

#Preview {
    DragGesturePracticeView()
}

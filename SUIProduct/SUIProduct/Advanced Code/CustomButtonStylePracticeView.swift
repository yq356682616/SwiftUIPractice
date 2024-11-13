//
//  CustomButtonStylePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/10.
//

import SwiftUI
//定制button类型
struct PressableButtonStyle: ButtonStyle{
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat = 0.9) {
        self.scaledAmount = scaledAmount
    }
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1)
//            .brightness(configuration.isPressed ? 0.05 : 0)
//            .opacity(configuration.isPressed ? 0.3 : 1.0)
    }
}

extension View{
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View{
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct CustomButtonStylePracticeView: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click Me")
                .font(.headline)
                .withDefaultButtonFormatting()
        }
        .withPressableStyle(scaledAmount: 0.5)
//        .buttonStyle(.plain)
        .padding(40)

    }
}

#Preview {
    CustomButtonStylePracticeView()
}

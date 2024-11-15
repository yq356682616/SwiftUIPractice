//
//  CustomTransitionsPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/10.
//

import SwiftUI
//动画转换效果定制
struct RotateViewModifier: ViewModifier{
    let rotation: Double
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                    y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}

extension AnyTransition{
    static var rotating: AnyTransition{
        return AnyTransition.modifier(active: RotateViewModifier(rotation: 180), identity: RotateViewModifier(rotation: 0))
    }
    
    static func rotating(rotation: Double) -> AnyTransition{
        modifier(active: RotateViewModifier(rotation: rotation), identity: RotateViewModifier(rotation: 0))
    }
    
    static var rotateOn: AnyTransition{
        asymmetric(
            insertion: rotating,
            removal: .move(edge: .leading)
        )
    }
    //过程
}

struct CustomTransitionsPracticeView: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            if showRectangle{
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .modifier(RotateViewModifier())
//                    .transition(AnyTransition.rotating)
//                    .transition(.rotating(rotation: 1080))
                    .transition(.rotateOn)
            }
            Spacer()
            
            Text("Click Me!")
                .withDefaultButtonFormatting()
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 5)) {
                        showRectangle.toggle()
                    }
//                    showRectangle.toggle()
                }
        }
    }
}

#Preview {
    CustomTransitionsPracticeView()
}

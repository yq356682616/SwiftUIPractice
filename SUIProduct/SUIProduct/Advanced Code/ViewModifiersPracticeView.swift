//
//  ViewModifiersPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/10.
//

import SwiftUI
//协议，view外观修改器
struct DefaultButtonViewModifier: ViewModifier{
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
//            .padding()
    }
    
}
extension View {
    func withDefaultButtonFormatting(backgroundColor: Color = .blue)-> some View{
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}
struct ViewModifiersPracticeView: View {
    
    
    var body: some View {
        VStack(spacing: 10.0) {
            Text("Hello, world")
                .font(.headline)
                .withDefaultButtonFormatting(backgroundColor: .orange)
            
            Text("Hello, everyone")
                .font(.subheadline)
                .withDefaultButtonFormatting()
            
            Text("Hello!!!")
                .font(.title)
                .withDefaultButtonFormatting(backgroundColor: .red)
        }
        .padding()
    }
}

#Preview {
    ViewModifiersPracticeView()
}

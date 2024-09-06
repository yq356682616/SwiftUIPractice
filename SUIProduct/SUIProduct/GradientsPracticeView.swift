//
//  GradientsPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/23.
//

import SwiftUI
//渐变
struct GradientsPracticeView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
//                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue,Color.orange,Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)//线性渐变
//                RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue,Color.orange,Color.purple]), center: .leading, startRadius: 5, endRadius: 100)//径向渐变
                AngularGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .top,angle: Angle(degrees: 90))//角度渐变
                
            )
            .frame(width: 300,height: 200)
    }
}

#Preview {
    GradientsPracticeView()
}

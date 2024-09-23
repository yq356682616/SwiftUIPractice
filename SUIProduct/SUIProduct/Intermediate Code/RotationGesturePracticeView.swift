//
//  RotationGesturePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/9.
//

import SwiftUI

struct RotationGesturePracticeView: View {
    @State var angle: Angle = Angle(degrees: 0)
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(50)
            .background(
                Color.blue
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            )
            .rotationEffect(angle)
            .gesture(
                RotateGesture()
                    .onChanged{ value in
                        angle = value.rotation
                    }
                    .onEnded({ value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                    })
                
            
            )
    }
}

#Preview {
    RotationGesturePracticeView()
}

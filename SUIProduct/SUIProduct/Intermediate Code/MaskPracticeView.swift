//
//  MaskPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/19.
//

import SwiftUI

struct MaskPracticeView: View {
    
    @State var rating: Int = 2
    
    var body: some View {
        ZStack(content: {
            starsView
                .overlay {
                    overlayView
                        .mask {starsView}
                }
        })
    }
    private var overlayView: some View{
        GeometryReader(content: { geometry in
            ZStack(alignment: .leading, content: {
                Rectangle()
//                    .foregroundStyle(.yellow)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            })
        })
        .allowsHitTesting(false)
        //不接受电击，直接点击starsVIew
    }
    private var starsView: some View{
        HStack(content: {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
//                    .foregroundStyle(rating >= index ? .yellow : .gray)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        })
    }
}

#Preview {
    MaskPracticeView()
}

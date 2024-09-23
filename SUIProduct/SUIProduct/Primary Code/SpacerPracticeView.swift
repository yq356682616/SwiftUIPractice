//
//  SpacerPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/28.
//

import SwiftUI

struct SpacerPracticeView: View {
    var body: some View {
//        HStack(spacing: 0, content: {
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//            Rectangle()
//                .frame(width: 50,height: 50)
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//            Rectangle()
//                .fill(.red)
//                .frame(width: 50,height: 50)
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//            Rectangle()
//                .fill(.yellow)
//                .frame(width: 50,height: 50)
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//        })
////        .padding(.horizontal,50)
//        .background(.blue)
        HStack(content: {
            Image(systemName: "xmark")
            Spacer()
            Image(systemName: "gear")
        })
        .padding(.horizontal,15)
        Spacer()
        Rectangle()
            .frame(height: 50)
        
    }
}

#Preview {
    SpacerPracticeView()
}

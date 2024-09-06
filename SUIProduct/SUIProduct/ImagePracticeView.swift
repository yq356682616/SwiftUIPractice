//
//  ImagePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/26.
//

import SwiftUI

struct ImagePracticeView: View {
    var body: some View {
        Image("pic")
            .resizable()
            .scaledToFill()
            .frame(width: 300,height: 300)
//            .cornerRadius(150)
            .clipShape(
//                Circle()
//                Ellipse()
//                Rectangle()
                RoundedRectangle(cornerRadius: 30)
            )
    }
}

#Preview {
    ImagePracticeView()
}

//
//  BackroundMaterialsPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/6.
//

import SwiftUI
//毛玻璃
struct BackroundMaterialsPracticeView: View {
    var body: some View {
        VStack{
            Spacer()
            VStack(content: {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width:  30,height: 4)
                    .padding()
                Spacer()
            })
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 30))
        }
        .ignoresSafeArea(.all)
        .background(
            Image("pic")
        )
    }
}

#Preview {
    BackroundMaterialsPracticeView()
}

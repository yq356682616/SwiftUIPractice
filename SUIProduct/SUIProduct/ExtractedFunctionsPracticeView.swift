//
//  ExtractedFunctionsPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/29.
//

import SwiftUI

struct ExtractedFunctionsPracticeView: View {
    @State var backgroundColor:Color = .pink
    var body: some View {
        ZStack(content: {
            backgroundColor.ignoresSafeArea(edges: .all)
            contantLayer
        })
        
    }
    var contantLayer: some View{//提取View
        VStack(content: {
            Text("Title")
                .font(.largeTitle)
            Button(action: {
                buttonPressed()
            }, label: {
                Text("Press Me")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
        })
    }
    func buttonPressed(){//方法
        backgroundColor = .orange
    }
}

#Preview {
    ExtractedFunctionsPracticeView()
}

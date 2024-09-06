//
//  FramePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/26.
//

import SwiftUI

struct FramePracticeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .background(.green)
//            .frame(width: 300,height: 300)
//            .background(Color.red)
//            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .leading)
//            .background(Color.red)
            .background(.red)
            .frame(height: 100)
            .background(.green)
            .frame(maxWidth: .infinity)
            .background(.cyan)
            .frame(height: 300)
            .background(.gray) 
            .frame(maxHeight: .infinity,alignment: .bottomLeading)
            .background(.orange)
            
    }
}

#Preview {
    FramePracticeView()
}

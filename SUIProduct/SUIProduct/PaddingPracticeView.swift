//
//  PaddingPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/26.
//

import SwiftUI

struct PaddingPracticeView: View {
    var body: some View {
        
        VStack(alignment: .leading,spacing: nil, content: {
            Text("Hello, World")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom,10)
            Text("This is a description of what we will do on this screen! It is multiples lines and we will align the text to the leading edge.")
        })
        .padding()
        .padding(.vertical,10)
        .background(
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,x: 0,y: 10)
            
        )
        .padding(.horizontal,10)
    }
}

#Preview {
    PaddingPracticeView()
}

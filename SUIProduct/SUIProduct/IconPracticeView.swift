//
//  IconPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/26.
//

import SwiftUI

struct IconPracticeView: View {
    var body: some View {
        Image(systemName: "person.crop.circle.badge.questionmark")
            .renderingMode(.original)
            .resizable()
            //.aspectRatio(contentMode: .fit)
            .scaledToFill()
            //.font(.title)
            //.font(.system(size: 100))
            //.foregroundColor(.red)
            .frame(width: 300,height: 300,alignment: .center)
            //.clipped()
            
    }
}

#Preview {
    IconPracticeView()
}

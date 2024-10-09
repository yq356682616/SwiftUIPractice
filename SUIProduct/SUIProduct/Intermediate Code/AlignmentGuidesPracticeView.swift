//
//  AlignmentGuidesPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/9.
//

import SwiftUI

struct AlignmentGuidesPracticeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello world!")
                .background(.blue)
//                .padding(.leading, 10)
//                .offset(x: 20)
                .alignmentGuide(.leading) { dimensions in
                    return dimensions.width
                }
            
            Text("This is some other text!")
                .background(.red)
        }
        .background(.orange)
    }
}
struct AlignmentChildView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            row(title: "Row 1", showIcon: false)
            row(title: "Row 2", showIcon: true)
            row(title: "Row 3", showIcon: false)
        }
        .padding(16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
        .padding(40)
    }
    private func row(title: String, showIcon: Bool) -> some View{
        HStack(spacing: 10.0) {
            if showIcon{
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
            }
            Text(title)
            Spacer()
        }
        .alignmentGuide(.leading) { dimensions in
            return showIcon ? 40 : 0
        }
        .background(.red)
    }
}

#Preview {
    AlignmentChildView()
}

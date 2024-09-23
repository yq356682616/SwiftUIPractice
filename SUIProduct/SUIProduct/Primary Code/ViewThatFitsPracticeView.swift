//
//  ViewThatFitsPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/11.
//

import SwiftUI
//更适合那个view
struct ViewThatFitsPracticeView: View {
    var body: some View {
        ZStack(content: {
            Color.red.ignoresSafeArea()
            ViewThatFits(in: .horizontal, content: {
                Text("This is some text that I would like to display to the user!")
                Text("This is some text that I would like to display")
                Text("This is some text")
            })
        })
        .frame(height: 300)
        .padding(50)
        .font(.headline)
    }
}

#Preview {
    ViewThatFitsPracticeView()
}

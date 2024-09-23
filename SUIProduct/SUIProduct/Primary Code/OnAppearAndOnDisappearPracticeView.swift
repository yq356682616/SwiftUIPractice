//
//  OnAppearAndOnDisappearPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/4.
//

import SwiftUI

struct OnAppearAndOnDisappearPracticeView: View {
    @State var myText: String = "Start text."
    @State var count: Int = 0
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(myText)
                LazyVStack(content: {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 1000)
                            .padding()
                            .onAppear(perform: {
                                count += 1
                            })
                    }
                })
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "This is the new text!"
                }
            })
            .onDisappear(perform: {
                myText = "Ending text"
            })
            .navigationTitle("On Appear: \(count)")
        }
    }
}

#Preview {
    OnAppearAndOnDisappearPracticeView()
}

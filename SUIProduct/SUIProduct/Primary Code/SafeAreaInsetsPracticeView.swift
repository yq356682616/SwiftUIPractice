//
//  SafeAreaInsetsPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/11.
//

import SwiftUI

struct SafeAreaInsetsPracticeView: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                Rectangle()
                    .frame(height: 300)
            }
            .navigationTitle("Safe Area Insets")
//            .overlay(alignment: .bottom) {
//                Text("Hi")
//                    .frame(maxWidth: .infinity)
//                    .background(.yellow)
//            }
            .safeAreaInset(edge: .bottom,alignment: .center) {
                Text("Hi")
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow.ignoresSafeArea(edges: .bottom))
            }
            .safeAreaInset(edge: .top,alignment: .trailing) {
                Text("Hi")
//                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.yellow)
                    .clipShape(Circle())
                    .padding()
            }
            
            .safeAreaInset(edge: .top,alignment: .trailing) {
                Text("Hi")
                    .frame(maxWidth: .infinity)
//                    .padding()
                    .background(Color.yellow.ignoresSafeArea(edges: .bottom))
//                    .clipShape(Circle())
//                    .padding()
            }
        }
    }
}

#Preview {
    SafeAreaInsetsPracticeView()
}

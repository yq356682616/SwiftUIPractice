//
//  ToolBarPractiveView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/10.
//

import SwiftUI

struct ToolBarPractiveView: View {
    @State private var text: String = ""
    @State private var paths: [String] = []
    var body: some View {
        NavigationStack(path: $paths){
            ZStack(content: {
                Color.white.ignoresSafeArea()
                ScrollView{
                    TextField("Placeholder", text: $text)
                    ForEach(0..<50) { _ in
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 200,height: 200)
                    }
                }
            })
            .navigationTitle("Toolbar")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "heart.fill")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(content: {
                        Image(systemName: "heart.fill")
                        Image(systemName: "gear")
                    })
                }
//                ToolbarItem(placement: .principal) {
//                    Image(systemName: "gear")
//                }
//                ToolbarItem(placement: .principal) {
//                    Image(systemName: "gear")
//                }
            })
//            .toolbar(.hidden, for: .navigationBar)
//            .toolbarBackground(.hidden, for: .navigationBar)
//            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarTitleMenu {
                Button("Screen 1") {
                    paths.append("Screen 1")
                }
                Button("Screen 1") {
                    paths.append("Screen 2")
                }
            }
            .navigationDestination(for: String.self) { value in
                Text("NewScreen:\(value)")
            }
        }
    }
}

#Preview {
    ToolBarPractiveView()
}

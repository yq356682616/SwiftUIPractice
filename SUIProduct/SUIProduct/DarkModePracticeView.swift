//
//  DarkModePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/4.
//

import SwiftUI

struct DarkModePracticeView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(spacing: 20,content: {
                    Text("This color os PRIMARY")
                        .foregroundStyle(.primary)
                    Text("This color os SECONDARY")
                        .foregroundStyle(.secondary)
                    Text("This color os BLACK")
                        .foregroundStyle(.black)
                    Text("This color os WHITE")
                        .foregroundStyle(.white)
                    Text("This color os RED")
                        .foregroundStyle(.red)
                    Text("This color os globally adaptice!")
                        .foregroundStyle(Color("AdaptiveColor"))
                    Text("This color is locally adaptice")
                        .foregroundStyle(colorScheme == .light ? .green : .yellow)
                })
            }
            .navigationTitle("Dark Mode Bootcamp")
        }
    }
}

#Preview {
    DarkModePracticeView()
}

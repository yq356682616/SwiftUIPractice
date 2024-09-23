//
//  GroupPractiveView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/11.
//

import SwiftUI

struct GroupPractiveView: View {
    var body: some View {
        VStack(spacing: 50.0, content: {
            Text("Hello, world!")
            Group {
                Text("Hello, world!")
                Text("Hello, world!")
            }
            .foregroundStyle(.green)
            .font(.caption)
        })
        .foregroundStyle(.red)
        .font(.headline)
    }
}

#Preview {
    GroupPractiveView()
}

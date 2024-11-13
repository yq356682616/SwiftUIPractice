//
//  TernaryOperatorsPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/30.
//

import SwiftUI

struct TernaryOperatorsPracticeView: View {
    @State var isStartingState: Bool = false
    var body: some View {
        VStack(content: {
            Button("Button") {
                isStartingState.toggle()
            }
            Text(isStartingState ? "STARTING STATS!!" : "ENDING STATE")
            RoundedRectangle(cornerRadius: isStartingState ? 25 : 0)
                .fill(isStartingState ? .red : .blue)
                .frame(width: isStartingState ? 200 : 55,height: isStartingState ? 400:50)
            Spacer()

        })
    }
}

#Preview {
    TernaryOperatorsPracticeView()
}

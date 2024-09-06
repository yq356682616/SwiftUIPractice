//
//  TransitonPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/30.
//

import SwiftUI

struct TransitonPracticeView: View {
    @State var showView:Bool = false
    var body: some View {
        ZStack(alignment: .bottom, content: {
            VStack(content: {
                Button("Button") {
                    withAnimation(.easeInOut) {
                        showView.toggle()
                    }
                }
                Spacer()
            })
            if showView{
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.move(edge: .bottom))
//                    .transition(.slide)
//                    .transition(.opacity)
//                    .transition(.scale)
//                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))//进入出去

                    
            }

        })
        .ignoresSafeArea(.all,edges: .bottom)
    }
}

#Preview {
    TransitonPracticeView()
}

//
//  OnTapGesturePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/4.
//

import SwiftUI

struct OnTapGesturePracticeView: View {
    @State var isSelected: Bool = false
    var body: some View {
        VStack(spacing: 30, content: {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 300)
                .foregroundStyle(isSelected ? .green : .red)
            Button(action: {
                isSelected.toggle()
            }, label: {
                Text("Button")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            })
            Text("TAP Gesture")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 25))
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture(count: 5, perform: {
                    isSelected.toggle()
                })
            Spacer()
        })
        
        .padding(40)
    }
}

#Preview {
    OnTapGesturePracticeView()
}

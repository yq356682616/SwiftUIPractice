//
//  ButtonStylePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/6.
//

import SwiftUI

struct ButtonStylePracticeView: View {
    var body: some View {
        VStack(content: {
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.large)
            .buttonStyle(PlainButtonStyle())
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.large)
            .buttonStyle(BorderedProminentButtonStyle())
            .buttonBorderShape(.roundedRectangle(radius: 10))


            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.small)
            .buttonStyle(BorderedProminentButtonStyle())
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.mini)
            .buttonStyle(BorderlessButtonStyle())
            
        })
        .padding()
    }
}

#Preview {
    ButtonStylePracticeView()
}

//
//  CustomNavBarView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/16.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.dismiss) var dismiss
    let showBackButton: Bool
    let title: String
    let subtitle: String?
    
    
    var body: some View {
        HStack {
            if showBackButton{
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton{
                backButton
                    .opacity(0)
            }
        }
        .padding()
        .accentColor(.white)
        .foregroundStyle(.white)
        .font(.headline)
        .background(.blue)
    }
}

#Preview {
    VStack {
        CustomNavBarView(showBackButton: true, title: "Title here", subtitle: "Subtitle goes here")
        Spacer()
    }
}

extension CustomNavBarView{
    private var backButton: some View{
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    private var titleSection: some View{
        VStack(spacing: 4.0) {
            Text(title)
                .font(.title)
            if let subtitle = subtitle{
                Text(subtitle)
            }
        }
    }
}

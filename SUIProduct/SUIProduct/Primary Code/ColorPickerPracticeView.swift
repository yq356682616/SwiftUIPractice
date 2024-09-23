//
//  ColorPickerPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/3.
//

import SwiftUI

struct ColorPickerPracticeView: View {
    @State var backgroundColor: Color = .green
    var body: some View {
        ZStack{
            backgroundColor.ignoresSafeArea(.all)
            ColorPicker("Select color", selection: $backgroundColor, supportsOpacity: true)
                .padding()
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)
                .font(.headline)
                .padding(50)
        }
    }
}

#Preview {
    ColorPickerPracticeView()
}

//
//  ColorPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/23.
//

import SwiftUI

struct ColorPracticeView: View {
    var customColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    //var customColor = #colorLiteral(//选择颜色的
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                //Color(customColor)
                //Color.primary
                //Color(uiColor: .darkGray)
                Color("MainColor", bundle: .main)
            )
            .frame(width: 300,height: 200)
            .shadow(color: .red.opacity(0.3), radius: 10,x: -20,y: -20)
        
    }
}

#Preview {
    ColorPracticeView()
}

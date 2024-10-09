//
//  AccessibilityColorPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/8.
//

import SwiftUI

struct AccessibilityColorPracticeView: View {
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency//透明度开关
    @Environment(\.colorSchemeContrast) var colorSchemeContrast //对比度开关
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor//无颜色区分
    @Environment(\.accessibilityInvertColors) var invertColors //反转颜色开关
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Button 1") {
                    
                }
                .foregroundStyle(colorSchemeContrast == .increased ? .white : .primary)
                .buttonStyle(.borderedProminent)
                Button("Button 2") {
                    
                }
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                Button("Button 3") {
                    
                }
                .foregroundStyle(.white)
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                Button("Button 4") {
                    
                }
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(differentiateWithoutColor ? .black : .purple)
            }
            .font(.largeTitle)
//            .navigationTitle("Hi")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
//            .background(reduceTransparency ? .black : .black.opacity(0.5))
        }
    }
}

#Preview {
    AccessibilityColorPracticeView()
}

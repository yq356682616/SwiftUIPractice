//
//  HapticsPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/19.
//

import SwiftUI
//震动和触感
class HapticeManager{
    static let instance = HapticeManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
        
    }
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsPracticeView: View {
    var body: some View {
        VStack(spacing: 20.0, content: {
            Button("success") {
                HapticeManager.instance.notification(type: .success)
            }
            Button("warning") {
                HapticeManager.instance.notification(type: .warning)
            }
            Button("error") {
                HapticeManager.instance.notification(type: .error)
            }
            Divider()
            Button("soft") {
                HapticeManager.instance.impact(style: .soft)
            }
            Button("light") {
                HapticeManager.instance.impact(style: .light)
            }
            Button("medium") {
                HapticeManager.instance.impact(style: .medium)
            }
            Button("rigid") {
                HapticeManager.instance.impact(style: .rigid)
            }
            Button("heavy") {
                HapticeManager.instance.impact(style: .heavy)
            }
        })
    }
}

#Preview {
    HapticsPracticeView()
}

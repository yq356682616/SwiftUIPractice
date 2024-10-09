//
//  AccessibilityTextPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/8.
//

import SwiftUI

//Dynamic Text


struct AccessibilityTextPracticeView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8.0) {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("Welcome to my app")
                                .font(.title)
                        }
                        Text("This is some longer text that expands to multiple lines.")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            //.truncationMode(.tail)//省略方式
                            .lineLimit(1)
                            .minimumScaleFactor(dynamicTypeSize.customMinScaleFactor)//自适应
                    }
//                    .frame(height: 100)
                    .background(.red)
                }
            }
            .navigationTitle("Hello, world!")
            .listStyle(.grouped)
        }
    }
}
extension DynamicTypeSize{
    var customMinScaleFactor: CGFloat{
        switch self {
        case .xSmall:
            return 1
        case .small:
            return 1
        case .medium:
            return 1
        case .large:
            return 0.8
        case .xLarge:
            return 0.8
        case .xxLarge:
            return 0.8
        case .xxxLarge:
            return 0.8
        case .accessibility1:
            return 0.1
        case .accessibility2:
            return 0.1
        case .accessibility3:
            return 0.1
        case .accessibility4:
            return 0.1
        case .accessibility5:
            return 0.1
        @unknown default:
            fatalError()
        }
    }

}
#Preview {
    AccessibilityTextPracticeView()
}

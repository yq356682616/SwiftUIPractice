//
//  CoustomNavBarContainerView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/16.
//

import SwiftUI

struct CoustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        VStack(spacing: 0.0) {
            CustomNavBarView(showBackButton: showBackButton, title: title, subtitle: subtitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(CustomNavBarSubTitlePreferenceKey.self) { value in
            self.subtitle = value
        }
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self) { value in
            self.showBackButton = !value
        }
    }
}

#Preview {
    CoustomNavBarContainerView{
        ZStack {
            Color.green.ignoresSafeArea()
            Text("Hello, world")
                .foregroundStyle(.white)
                .customNavigationTitle("New Title")
                .customNavigationSubtitle("subtitle")
                .customNavigationBarBackButtonHidden(true)
        }
    }
}


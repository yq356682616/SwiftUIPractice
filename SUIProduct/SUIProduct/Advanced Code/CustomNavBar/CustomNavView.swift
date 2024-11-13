//
//  CustomNavView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/16.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        NavigationStack {
            CoustomNavBarContainerView {
                content
            }
            .toolbar(.hidden)
        }
    }
}

#Preview {
    CustomNavView {
        Color.red.ignoresSafeArea()
    }
}

extension UINavigationController{
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

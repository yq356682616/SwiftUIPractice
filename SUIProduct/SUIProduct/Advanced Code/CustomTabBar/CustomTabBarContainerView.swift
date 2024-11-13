//
//  CustomTabBarContainerView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/12.
//

import SwiftUI
struct CustomTabBarContainerView<Content: View>: View {
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = [
        .home,
        .favorites,
        .profile
    ]
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content){
        self._selection = selection
        self.content = content()
    }
    var body: some View {
        ZStack(alignment: .bottom){
            content
                .ignoresSafeArea()
            CustomTabBarView(tabs: tabs, selection: $selection,localSelection: selection)
        }
        .onPreferenceChange(TabBarItemPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

#Preview {
    let tabs: [TabBarItem] = [
        .home,
        .favorites,
        .profile
    ]
    CustomTabBarContainerView(selection: .constant(tabs.first!)) {
        Color.red
            .tabBarItem(tab: .home, selection: .constant(tabs.first!))
        Color.blue
            .tabBarItem(tab: .favorites, selection: .constant(tabs.first!))
        Color.green
            .tabBarItem(tab: .profile, selection: .constant(tabs.first!))
        Color.orange
            .tabBarItem(tab: .messages, selection: .constant(tabs.first!))
    }
}

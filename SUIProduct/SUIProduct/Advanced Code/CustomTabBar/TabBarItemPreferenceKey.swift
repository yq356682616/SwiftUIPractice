//
//  TabBarItemPreferenceKey.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/14.
//

import Foundation
import SwiftUI

struct TabBarItemPreferenceKey: PreferenceKey{
     
    static var defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}

struct TabBarItemViewModifier: ViewModifier{
    
    let tab: TabBarItem
    
    @Binding var selection: TabBarItem
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TabBarItemPreferenceKey.self, value: [tab])
    }
}
extension View{
    func tabBarItem(tab: TabBarItem,  selection: Binding<TabBarItem>) -> some View{
        modifier(TabBarItemViewModifier(tab: tab, selection: selection))
    }
}

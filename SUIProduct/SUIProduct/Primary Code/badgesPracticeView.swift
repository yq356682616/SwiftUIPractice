//
//  badgesPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/6.
//

import SwiftUI
//红色未读消息
struct badgesPracticeView: View {
    var body: some View {
        List {
            Text("Hello").badge(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Text("Hello")
            Text("Hello")
            
        }
        TabView {
            Color.red
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge(1000)
            Color.green
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
        }
    }
}

#Preview {
    badgesPracticeView()
}

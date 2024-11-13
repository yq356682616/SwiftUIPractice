//
//  AppTabView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/12.
//

import SwiftUI

struct AppTabView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.red
                .tabBarItem(tab: .home, selection: $tabSelection)
            Color.blue
                .tabBarItem(tab: .favorites, selection: $tabSelection)
            Color.green
                .tabBarItem(tab: .profile, selection: $tabSelection)
            Color.orange
                .tabBarItem(tab: .messages, selection: $tabSelection)
        }
    }
}

#Preview {
    AppTabView()
}

extension AppTabView{
    private var defaaultTabView: some View{
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

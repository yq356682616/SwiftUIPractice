//
//  AppNavBarView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/16.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                CustomNavLink {
                    Text("Destination")
                        .customNavigationTitle("Second Screen")
                        .customNavigationSubtitle("Subtitle should be showing!")
                } label: {
                    Text("Navigate")
                }
                .customNavBarItems(title: "New title!",subtitle: "Subtitle!", backButtonHidden: true)
            }
        }
        
    }
}

#Preview {
    AppNavBarView()
}

extension AppNavBarView{
    private var defaultNavView: some View{
        NavigationStack {
            ZStack {
                Color.green.ignoresSafeArea()
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                } label: {
                    Text("Navigate")
                }

            }
            .navigationTitle("Nav title here")
        }
    }
}

//
//  CustomNavLink.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/16.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label:Label
    
    init(@ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label){
        self.destination = destination()
        self.label = label()
    }
    
    var body: some View {
        NavigationLink {
            CoustomNavBarContainerView {
                destination
            }
            .toolbar(.hidden)
        } label: {
            label
        }

    }
}

#Preview {
    CustomNavView {
        CustomNavLink {
            Text("Destination")
        } label: {
            Text("Click Me")
                .customNavigationTitle("Title")
                .customNavigationBarBackButtonHidden(true)
        }
    }

}

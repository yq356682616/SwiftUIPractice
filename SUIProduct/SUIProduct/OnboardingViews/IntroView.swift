//
//  IntroView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/5.
//

import SwiftUI

struct IntroView: View {
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    var body: some View {
        ZStack {
            //background
            RadialGradient(gradient: Gradient(colors: [.purple ,.blue]),
                           center: .center,
                           startRadius: 5,
                           endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea(.all)
            
            if currentUserSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            }else{
                OnboradingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
            //if user is signed in
            //profile view
            //else
            //onboarding view
        }
    }
}

#Preview {
    IntroView()
}

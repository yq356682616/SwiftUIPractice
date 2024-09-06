//
//  FocusStatePractiveView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/6.
//

import SwiftUI

struct FocusStatePractiveView: View {
    enum OnboradingField{
        case username
        case password
    }
//    @FocusState private var usernameFocus: Bool
    @State private var username: String = ""
//    @FocusState private var passwordFocus: Bool
    @State private var password: String = ""
    @FocusState private var fieldInFocus: OnboradingField?
    var body: some View {
        VStack(spacing: 30.0, content: {
            TextField("Add your name here...", text: $username)
                .focused($fieldInFocus,equals: .username)
//                .focused($usernameFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            TextField("Add your password here...", text: $password)
                .focused($fieldInFocus,equals: .password)
//                .focused($passwordFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Button("SIGN UP 🎧") {
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                if usernameIsValid && passwordIsValid{
                    print("SIGN UP")
                }else if usernameIsValid{
                    fieldInFocus = .password
//                    usernameFocus = false
//                    passwordFocus = true
                }else{
                    fieldInFocus = .username
//                    usernameFocus = true
//                    passwordFocus = false
                }
            }
        })
        .padding(40)
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                fieldInFocus = .username
            })
        })
    }
}

#Preview {
    FocusStatePractiveView()
}

//
//  AppStoragePractiveView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/5.
//

import SwiftUI

struct AppStoragePractiveView: View {
//    @State var currentUserName:String?
    //相当于Userdefault
    @AppStorage("name") var currentUserName:String?
    var body: some View {
        VStack(spacing: 20.0, content: {
            Text(currentUserName ?? "Add Name Here")
            if let name = currentUserName{
                Text(name)
            }
            Button("Save".uppercased()) {
                let name = "merlin"
                currentUserName = name
            }
        })
    }
}

#Preview {
    AppStoragePractiveView()
}

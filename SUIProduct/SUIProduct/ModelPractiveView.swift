//
//  ModelPractiveView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/4.
//

import SwiftUI
struct UserModel:Identifiable{
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}
struct ModelPractiveView: View {
    @State var users: [UserModel] = [
        //"Nick","Emily","Samantha","Chris"
        UserModel(displayName: "Nick",
                  userName: "Nick123",
                  followerCount: 200, isVerified: true),
        
        UserModel(displayName: "Emily",
                  userName: "itSemily1995",
                  followerCount: 55, isVerified: false),
        
        UserModel(displayName: "Samantha",
                  userName: "ninjia",
                  followerCount: 355, isVerified: false),
        
        UserModel(displayName: "Chris",
                  userName: "Chris2009",
                  followerCount: 88, isVerified: true)
        
    ]
    var body: some View {
        NavigationStack{
            List {
                ForEach(users) { user in
                    HStack(spacing: 15.0) {
                        Circle()
                            .frame(width: 35,height: 35)
                        VStack(alignment: .leading){
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        if user.isVerified{
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                        }
                        VStack(content: {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        })
                    }

                }
//                ForEach(users, id: \.self) { name in
//                    HStack(spacing: 15.0) {
//                        Circle()
//                            .frame(width: 35,height: 35)
//                        Text(name)
//                    }
//                    .padding(.vertical,10)
//                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ModelPractiveView()
}

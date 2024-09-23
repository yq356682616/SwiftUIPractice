//
//  NavigationPacticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/2.
//

import SwiftUI

struct NavigationPacticeView: View {
    var body: some View {
//        NavigationView(content: {
//            NavigationLink(destination: Text("Destination")) { /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
//        })
        NavigationStack {
            ScrollView(content: {
                NavigationLink("Hello, world!") {
                    MyOtherScreen()
                }
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
            })
            .navigationTitle("All InBoxes")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar(.hidden)
//            .navigationBarItems(
//                leading: 
//                    HStack{
//                        Image(systemName: "person.fill")
//                        Image(systemName: "flame.fill")
//                        Image(systemName: "person.fill")
//                    },
////                trailing: Image(systemName: "gear"))
//                trailing: NavigationLink(destination: {
//                    MyOtherScreen()
//                }, label: {
//                    Image(systemName: "gear")
//                })
//                .tint(.red)
//            )
            //最新
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    HStack{
                        Image(systemName: "person.fill")
                        Image(systemName: "flame.fill")
                        Image(systemName: "person.fill")
                    }
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink(destination: {
                        MyOtherScreen()
                    }, label: {
                        Image(systemName: "gear")
                    })
                    .tint(.red)
                })
            }
            
            
        }
    }
}
struct MyOtherScreen: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea(.all)
                .navigationTitle("Grenn Screen!")
//                .toolbar(.hidden)
            VStack{
                Button("BACK BUTTON") {
                    dismiss()
                }
                NavigationLink("Click here") {
                    Text("Next Screen!")
                }
            }
        }
    }
}
#Preview {
    NavigationPacticeView()
}

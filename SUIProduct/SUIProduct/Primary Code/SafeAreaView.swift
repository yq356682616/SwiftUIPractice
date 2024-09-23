//
//  SafeAreaView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/29.
//

import SwiftUI

struct SafeAreaView: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .frame(maxWidth: .infinity,maxHeight: .infinity)
//            .background(.red)
        ScrollView{
            VStack{
                Text("Title goes here")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity,alignment: .leading)
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding(20)
                }
            }

        }
        .background(.red)
//        .ignoresSafeArea(.all)
    }
}

#Preview {
    SafeAreaView()
}

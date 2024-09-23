//
//  sheetPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/2.
//

import SwiftUI

struct sheetPracticeView: View {
    @State var showSheet: Bool = false
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea(.all)
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button")
                    .foregroundStyle(.green)
                    .font(.headline)
                    .padding(20)
                    .background(
                        Color.white
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    )
                    
                    
            })
            .fullScreenCover(isPresented: $showSheet, content: {
                 SecondScreen()
            })
//            .sheet(isPresented: $showSheet, content: {
//                SecondScreen()
//            })//底部弹出框
        }
    }
}
struct SecondScreen: View{
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        ZStack(alignment: .topLeading, content: {
            Color.red.ignoresSafeArea(.all)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding(20)
                    
                    
            })
        })
    }
}
#Preview {
    sheetPracticeView()
//    SecondScreen()
}

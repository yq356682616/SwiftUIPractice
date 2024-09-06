//
//  PopoverPaacticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/2.
//

//sheet
//animations
//transiton

import SwiftUI

struct PopoverPaacticeView: View {
    @State var showNewScreen: Bool = false
    var body: some View {
        ZStack(content: {
            Color.orange.ignoresSafeArea(.all)
            VStack(content: {
                Button("BUTTON") {
                    withAnimation(.spring) {
                        showNewScreen.toggle()
                    }
                        
                }
                .font(.largeTitle)
                Spacer()
            })
            //第一种
//            .sheet(isPresented: $showNewScreen, content: {
//                NewScreen()
//            })
            //第二种
//            ZStack{
//                if showNewScreen{
//                    NewScreen(showNewScreen: $showNewScreen)
//                        .padding(.top,100)
//                        .transition(.move(edge: .bottom))
//                }
//            }
//            .zIndex(2.0)
            //第三种
            NewScreen(showNewScreen: $showNewScreen)
                .padding(.top,100)
                .offset(y:showNewScreen ? 0 : UIScreen.main.bounds.height)
        })
    }
}

struct NewScreen: View{
//    @Environment(\.isPresented) var isPresented
//    @Environment(\.dismiss) var dismiss
    @Binding var showNewScreen: Bool
    var body: some View{
        ZStack(alignment:.topLeading, content: {
            Color.purple.ignoresSafeArea(.all)
            
            Button(action: {
                withAnimation(.spring) {
                    showNewScreen.toggle()
                }
//                dismiss()
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
    PopoverPaacticeView()
//    NewScreen()
}

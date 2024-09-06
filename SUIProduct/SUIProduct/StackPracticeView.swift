//
//  StackPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/26.
//

import SwiftUI

struct StackPracticeView: View {
    var body: some View {
//
//        VStack(alignment: .leading,spacing: 0,content: {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 200,height: 200)
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 150,height: 150)
//            Rectangle()
//                .fill(.orange)
//                .frame(width: 100,height: 100)
//        })
        
        
//        ZStack {
//            Rectangle()
//                .fill(.yellow)
//                .frame(width: 350,height: 500)
//            VStack{
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 150,height: 150)
//                Rectangle()
//                    .fill(.green)
//                    .frame(width: 100,height: 100)
//                HStack {
//                    Rectangle()
//                        .fill(.purple)
//                        .frame(width: 50,height: 50)
//                    
//                    Rectangle()
//                        .fill(.pink)
//                        .frame(width: 75,height: 75)
//                    
//                    Rectangle()
//                        .fill(.purple)
//                        .frame(width: 25,height: 25)
//                }
//                .background(.white)
//            }
//            .background(.black)
//            
//        }
        VStack(alignment: .center,spacing: nil , content: {
            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                .font(.caption)
                .foregroundStyle(.gray)
            Text("5")
                .underline()
        })
        
        
    }
}

#Preview {
    StackPracticeView()
}

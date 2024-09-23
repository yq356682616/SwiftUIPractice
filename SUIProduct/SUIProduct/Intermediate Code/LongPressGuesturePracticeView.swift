//
//  LongPressGuesturePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/9.
//

import SwiftUI

struct LongPressGuesturePracticeView: View {
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    var body: some View {
        VStack(content: {
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 10)
                .frame(height: 55)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(.gray)
            HStack(content: {
                Text("CLICK HERE")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50, pressing: { isPressing in
                        // start of press -> min duration
                        if isPressing{
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess{
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    },perform: {
                        //at the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    })
                Text("RESET")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            })
        })
        
        
        
        
        
        
        
        
        
        
        
        
        
//        Text(isComplete ? "COMPLETED" : "NOT COMPLETE")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : .gray)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
////            .onTapGesture {
////                isComplete.toggle()
////            }
//            .onLongPressGesture(minimumDuration: 5.0, maximumDistance: 50, perform: {
//                isComplete.toggle()
//            })
        
    }
}

#Preview {
    LongPressGuesturePracticeView()
}

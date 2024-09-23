//
//  DragGesturePracticeView2.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/9.
//

import SwiftUI

struct DragGesturePracticeView2: View {
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffserY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    var body: some View {
        ZStack(content: {
            Color.green.ignoresSafeArea()
            MySignUpView()
                .offset(y:startingOffsetY)
                .offset(y:currentDragOffserY)
                .offset(y:endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring, {
                                currentDragOffserY = value.translation.height
                            })
                        })
                        .onEnded({ value in
                            withAnimation(.spring, {
                                if currentDragOffserY < -150{
                                    endingOffsetY = -startingOffsetY
                               
                                }else if endingOffsetY != 0 && currentDragOffserY > 150{
                                    endingOffsetY = 0
                                }
                                currentDragOffserY = 0
                            })
                        })
                )
            Text("\(currentDragOffserY)")
        })
        .ignoresSafeArea(edges:.bottom)
    }
}

#Preview {
    DragGesturePracticeView2()
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20.0, content: {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 100)
            Text("This is the decription for our app. This is my favorite SwiftUI course and I recommend to all of my friends to subscribe to Swiftful Thinking!")
                .multilineTextAlignment(.center)
            Text("CERATE AN ACCOUNT")
                .foregroundStyle(.white)
                .font(.headline)
                .padding()
                .background(
                    Color.black
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                )
            Spacer()
        })
        .frame(maxWidth: .infinity)
        .background(
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .ignoresSafeArea(edges:[.bottom])
        )
    }
}

//
//  BackgroundAndOverlayView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/26.
//

import SwiftUI

struct BackgroundAndOverlayView: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .background(
//                Circle()
//                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing))
//                    .frame(width: 100,height: 100)
//            )
//            .background(
//                Circle()
//                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing))
//                    .frame(width: 120,height: 120)
//            )
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                    .frame(width: 100,height: 100)
                    .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle()
                            .fill(
                                Color.blue
                            )
                            .frame(width: 35,height: 35)
                            .shadow(color: .black, radius: 5,x: 0,y: 5)
                            .overlay(
                                Text("5")
                                    .font(.callout)
                                    .foregroundStyle(.white)
                            )
                        ,alignment: .bottomTrailing)
            )
    }
}

#Preview {
    BackgroundAndOverlayView()
}

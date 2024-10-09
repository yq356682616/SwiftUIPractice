//
//  VisualEffectPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/9.
//

import SwiftUI

struct VisualEffectPracticeView: View {
    
    @State private var showSpacer: Bool = false
    
    var body: some View {
//        GeometryReader {geometryProxy in
//            Text("\(geometryProxy.size.width)")
//                .padding()
//                .background(.red)
//                .grayscale(0)
//        }
//        .background(.green)
//        .frame(width: 100)
//        .padding()
        
        
//        VStack {
//            Text("Hello world adsfasdfasdf asdfasdfasdfasdfasdfasdfasdfadf")
//                .padding()
//                .background(.red)
//                .visualEffect { content, geometryProxy in
//                    content
//                        .grayscale(geometryProxy.frame(in: .global).minY < 300 ? 1 : 0)
////                    .grayscale(geometryProxy.size.width >= 200 ? 1 : 0)
//                }
//            if showSpacer{
//                Spacer()
//            }
//        }
//        .animation(.easeIn, value: showSpacer)
//        .onTapGesture {
//            showSpacer.toggle()
//        }
        
        ScrollView {
            VStack(spacing: 30.0) {
                ForEach(0..<100) { index in
                    Rectangle()
                        .frame(width: 300,height: 200)
                        .frame(maxWidth: .infinity)
                        .background(.orange)
                        .visualEffect { content, geometry in
                            content
                                .offset(x: geometry.frame(in: .global).minY * 0.5)
                        }
                }
            }
        }
    }
}

#Preview {
    VisualEffectPracticeView()
}

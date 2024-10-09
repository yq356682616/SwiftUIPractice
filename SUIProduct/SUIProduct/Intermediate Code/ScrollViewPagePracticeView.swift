//
//  ScrollViewPagePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/9.
//

import SwiftUI

struct ScrollViewPagePracticeView: View {
    @State private var scrollPosition: Int? = nil
    var body: some View {
        VStack {
            Button("SCROLL TO") {
                scrollPosition = (0..<20).randomElement()
            }
            ScrollView (.horizontal){
                HStack(spacing: 0) {
                    ForEach(0..<20) { index in
                        Rectangle()
                            .frame(width: 300,height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                Text("\(index)")
                                    .foregroundStyle(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .id(index)
                            .scrollTransition(.interactive.threshold(.visible(0.5))) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .offset(y: phase.isIdentity ? 0 : -100)
                            }
    //                        .containerRelativeFrame(.horizontal, alignment: .center)
                    }
                }
                .padding(.vertical, 100)
            }
            .ignoresSafeArea()
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            .scrollBounceBehavior(.basedOnSize)
            .scrollPosition(id: $scrollPosition, anchor: .center)
            .animation(.smooth, value: scrollPosition)
        }
        
        
        
        
//        ScrollView {
//            VStack(spacing: 0) {
//                ForEach(0..<10) { index in
//                    Rectangle()
//                        .overlay {
//                            Text("\(index)")
//                                .foregroundStyle(.white)
//                        }
//                        .frame(maxWidth: .infinity)
//                        .containerRelativeFrame(.vertical, alignment: .center)
//                }
//            }
//        }
//        .ignoresSafeArea()
//        .scrollTargetLayout()
//        .scrollTargetBehavior(.paging)
//        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    ScrollViewPagePracticeView()
}

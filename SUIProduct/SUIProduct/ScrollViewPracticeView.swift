//
//  ScrollViewPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/29.
//

import SwiftUI

struct ScrollViewPracticeView: View {
    var body: some View {
//        ScrollView(.vertical, showsIndicators: false,content: {
//            VStack {
//                ForEach(0..<50) { index in
//                    Rectangle()
//                        .fill(.blue)
//                        .frame(height: 500)
//                }
//            }
//        })
        
//        ScrollView(.horizontal, showsIndicators: false,content: {
//            HStack {
//                ForEach(0..<50) { index in
//                    Rectangle()
//                        .fill(.blue)
//                        .frame(width: 300, height: 300)
//                }
//            }
//        })
        ScrollView (.vertical,showsIndicators: false){
            LazyVStack{
                ForEach(0..<100) { index in
                    ScrollView(.horizontal,showsIndicators: false) {
                        LazyHStack{
                            ForEach(0..<20) { index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 200,height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewPracticeView()
}

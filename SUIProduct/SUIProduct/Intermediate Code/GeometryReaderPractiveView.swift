//
//  GeometryReaderPractiveView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/18.
//

import SwiftUI
//获取View的大小和位置
struct GeometryReaderPractiveView: View {
    
    func getPercentage(geo: GeometryProxy) -> Double{
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack{
                ForEach(0..<20) { index in
                    GeometryReader(content: { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40),
                                                      axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                            .padding()
                    })
                    .frame(width: 300,height: 250)
                    .padding(.vertical,100)
                }
            }
        }
        
        
        
//        GeometryReader {  geometry in
//            HStack(spacing: 0.0, content: {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: geometry.size.width * 0.6666)
//                Rectangle()
//                    .fill(.blue)
//            })
//            .ignoresSafeArea()
//        }
    }
}

#Preview {
    GeometryReaderPractiveView()
}

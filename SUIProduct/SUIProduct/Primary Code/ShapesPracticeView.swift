//
//  ShapesPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/23.
//

import SwiftUI

struct ShapesPracticeView: View {
    var body: some View {
        //Circle()
        //Ellipse()//椭圆
        //Capsule(style: .continuous)//胶囊
        //Rectangle()//矩形
        RoundedRectangle(cornerRadius: 50)
            //.fill(.red)
            //.foregroundColor(.blue)
            //.stroke(.red,lineWidth: 5)//点描边
            //.stroke(.red,style: StrokeStyle(lineWidth: 10,lineCap: .butt,dash: [30]))
            //.trim(from: 0.0,to: 0.6)//裁剪
            //.stroke(lineWidth: 10)
            .frame(width: 200,height: 100)
            //以上都可用
    }
}

#Preview {
    ShapesPracticeView()
}

//
//  ExtractSubviewsPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/29.
//

import SwiftUI

struct ExtractSubviewsPracticeView: View {
    var body: some View {
        ZStack(content: {
            Color.cyan.ignoresSafeArea(.all)
            contantLayer

        })

    }
    var contantLayer: some View{
        HStack(content: {
            MyItem(title: "Apples", count: 1, color: .red)
            MyItem(title: "Rrange", count: 10, color: .orange)
            MyItem(title: "bananas", count: 23, color: .yellow)
        })
    }
}

#Preview {
    ExtractSubviewsPracticeView()
}

struct MyItem: View {//提取子视图
    let title:String
    let count:Int
    let color:Color
    var body: some View {
        VStack(content: {
            Text("\(count)")
            Text(title)
        })
        .padding()
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

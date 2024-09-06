//
//  TextPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/23.
//

import SwiftUI

struct TextPracticeView: View {
    var body: some View {
        Text("hello world! ".lowercased())
//            .font(.caption)
//            .fontWeight(.black)
//            .underline(pattern: .solid,color: .red)//下划线
//            .strikethrough(pattern: .solid,color: .blue)//删除线
//            .italic()//斜体
            .font(.system(size: 20,weight: .black,design: .rounded))
//            .baselineOffset(10)//行间距
//            .kerning(1)//字符间距
//            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
            .frame(width: 300,height: 300,alignment: .leading)
            //.minimumScaleFactor(1)//多文字缩放比例
    }
}

#Preview {
    TextPracticeView()
}

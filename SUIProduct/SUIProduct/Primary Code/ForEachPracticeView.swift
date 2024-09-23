//
//  ForEachPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/28.
//

import SwiftUI

struct ForEachPracticeView: View {
    let data: [String] = ["Hi", "Hello", "Hey everyone"]
    let myString: String = "Hello"
    var body: some View {
        VStack(content: {
//            ForEach(0..<10) { index in
////                Text("Hi:\(index)")
//                HStack {
//                    Circle()
//                        .frame(width: 30,height: 30)
//                    Text("index is :\(index)")
//                }
//            }
            ForEach(data.indices,id:\.self) { index in
                Text("\(data[index]): \(index)")
            }
        })
    }
}

#Preview {
    ForEachPracticeView()
}

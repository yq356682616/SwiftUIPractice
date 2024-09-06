//
//  InitializerPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/28.
//

import SwiftUI

struct InitializerPracticeView: View {
    
    let backgroundColor: Color
    let count:Int
    let title:String
    init(count: Int, fruit: Fruit) {
        self.count = count
        if fruit == .apple{
            self.title = "Apples"
            self.backgroundColor = .red
        }else{
            self.title = "Oranges"
            self.backgroundColor = .orange
        }
    }
    enum Fruit{
        case apple
        case orange
    }
    var body: some View {
        VStack(spacing: 12,content: {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .underline()
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
        })
        .frame(width: 150,height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

#Preview {
    HStack(content: {
        InitializerPracticeView(count: 55, fruit: .orange)
        InitializerPracticeView(count: 100, fruit: .apple)
    })

}

//
//  HashablePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/19.
//

import SwiftUI

//struct MyCustomModel: Identifiable{
//    let id = UUID().uuidString
//    let title: String
//}
//不创建id 可以用hashable
struct MyCustomModel: Hashable{
    let title: String
    let subTitle: String
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + subTitle)
    }
}
struct HashablePracticeView: View {
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE", subTitle: "1"),
        MyCustomModel(title: "TWO", subTitle: "2"),
        MyCustomModel(title: "THREE", subTitle: "3"),
        MyCustomModel(title: "FOUR", subTitle: "4"),
        MyCustomModel(title: "FIVE", subTitle: "5"),
    ]
    var body: some View {
        ScrollView {
            VStack(spacing: 40.0, content: {
                ForEach(data, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
//                ForEach(data, id: \.self) { item in
//                    Text(item.hashValue.description)
//                        .font(.headline)
//                }
            })
        }
    }
}

#Preview {
    HashablePracticeView()
}

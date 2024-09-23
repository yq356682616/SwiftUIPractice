//
//  TypealiasPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/20.
//

import SwiftUI

struct MoviewModel{
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MoviewModel

struct TypealiasPracticeView: View {
    
//    @State var item: MoviewModel = MoviewModel(title: "Title", director: "Joe", count: 5)
    
    @State var item: TVModel = TVModel(title: "TV Title", director: "Emmily", count: 10)
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

#Preview {
    TypealiasPracticeView()
}

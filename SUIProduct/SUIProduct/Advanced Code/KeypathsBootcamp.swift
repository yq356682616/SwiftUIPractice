//
//  KeypathsBootcamp.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/28.
//

import SwiftUI

struct MyDateModel: Identifiable{
    let id = UUID().uuidString
    let title: String
    let count: Int
    let date: Date
}
extension Array{
    
    mutating func sortByKeyPath<T:Comparable>(_ keyPath: KeyPath<Element, T>, ascending: Bool = true){
        self.sort {item1, item2 in
            let value1 = item1[keyPath: keyPath]
            let value2 = item2[keyPath: keyPath]
            return ascending ? (value1 < value2) : (value1 > value2)
        }
    }
    
    func sortedByKeyPath<T:Comparable>(_ keyPath: KeyPath<Element, T>, ascending: Bool = true) -> [Element]{
        self.sorted { item1, item2 in
            let value1 = item1[keyPath: keyPath]
            let value2 = item2[keyPath: keyPath]
            return ascending ? (value1 < value2) : (value1 > value2)
        }
    }
}
struct KeypathsBootcamp: View {
    
    @AppStorage("user_count") var userCount: Int = 0
    @State private var dateArray: [MyDateModel] = []
    var body: some View {
        List {
            ForEach(dateArray) { item in
                VStack(alignment: .leading) {
                    Text(item.id)
                    Text(item.title)
                    Text("\(item.count)")
                    Text(item.date.description)
                }
                .font(.headline)
            }
        }
        .onAppear {
            var array = [
                MyDateModel(title: "Three", count: 3, date: .distantFuture),
                MyDateModel(title: "One", count: 1, date: .now),
                MyDateModel(title: "Two", count: 2, date: .distantPast)
            ]
//            let newArray = array.sortedByKeyPath(\.count,ascending: false)
//            dateArray = newArray
            array.sortByKeyPath(\.count, ascending: true)
            dateArray = array
//                let item = MyDateModel(title: "One", count: 1, date: .now)
//                let title = item.title
//                let title2 = item[keyPath: \.title]
//                screenTitle = title2
            }
    }
}

#Preview {
    KeypathsBootcamp()
}

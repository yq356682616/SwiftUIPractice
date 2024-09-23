//
//  ItemModel.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/14.
//

import Foundation

//Immutable Struct
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleteed: Bool
    
    init(id: String = UUID().uuidString,title: String, isCompleteed: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.isCompleteed = isCompleteed
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleteed: !isCompleteed)
    }
}

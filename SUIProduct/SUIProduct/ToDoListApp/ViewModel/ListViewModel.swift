//
//  ListViewModel.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/14.
//

import Foundation
/*
CRUD FUNCTIONS
 
 Creat
 Read
 Update
 Delete
 */
@Observable class ListViewModel{
    var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    let itemKey = "items_list"
    
    init() {
        getItme()
    }
    
    func getItme(){
//        let newItems = [
//            ItemModel(title: "This is first title!", isCompleteed: false),
//            ItemModel(title: "This is the second!", isCompleteed: true),
//            ItemModel(title: "Third!", isCompleteed: false)
//        ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedItems
        
    }
    func deleltaItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleteed: false)
        items.append(newItem)
    }
    func updateItem(item:ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompletion()
        }
    }
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}

//
//  UnitTestingBootCampViewModel.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/18.
//

import Foundation
import SwiftUI
import Combine


class UnitTestingBootcampViewModel: ObservableObject{
    
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    @Published var selectedItem: String? = nil
    var cancellable = Set<AnyCancellable>()
    let dataService: NewDataServiceProtocol
    init(isPremium: Bool, dataService: NewDataServiceProtocol = NewMockDataService(items: nil)) {
        self.isPremium = isPremium
        self.dataService = dataService
    }
    
    func addItem(item: String){
        guard !item.isEmpty else{return}
        self.dataArray.append(item)
    }
    
    func selectItem(item: String){
        if let x = dataArray.first(where: { $0 == item }){
            selectedItem = x
        }else{
            selectedItem = nil
        }
    }
    func saveItem(item: String)throws{
        guard !item.isEmpty else{
            throw DataError.noData
        }
        if let x = dataArray.first(where: { $0 == item }){
            print("Save item here!!!\(x)")
        }else{
            throw DataError.itemNotFound
        }
    }
    
    enum DataError: LocalizedError{
        case noData
        case itemNotFound
    }
    
    func downloadWithEscaping(){
        dataService.downloadItemsWithEscaping { [weak self]returnItems in
            self?.dataArray = returnItems
        }
    }
    func downloadWithCombine(){
        dataService.dowmLoadItemsWithCombine()
            .sink { _ in
                
            } receiveValue: { [weak self]retrunedItems in
                self?.dataArray = retrunedItems
            }
            .store(in: &cancellable)

    }
}

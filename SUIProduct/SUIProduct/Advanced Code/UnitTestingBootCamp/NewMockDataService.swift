//
//  NewMockDataService.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/21.
//

import Foundation
import SwiftUI
import Combine
protocol NewDataServiceProtocol{
    func downloadItemsWithEscaping(completion: @escaping (_ items: [String]) -> ())
    func dowmLoadItemsWithCombine() -> AnyPublisher<[String], Error>
}

class NewMockDataService: NewDataServiceProtocol{
    
    let items: [String]
    init(items: [String]?) {
        self.items = items ?? ["ONE","TWO","THREE"]
    }
    func downloadItemsWithEscaping(completion: @escaping (_ items: [String]) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(self.items)
        }
    }
    
    func dowmLoadItemsWithCombine() -> AnyPublisher<[String], Error>{
        Just(items)
            .tryMap { publishedItems in
                guard !publishedItems.isEmpty else{
                    throw URLError(.badServerResponse)
                }
                return publishedItems
            }
            .eraseToAnyPublisher()
    }
}

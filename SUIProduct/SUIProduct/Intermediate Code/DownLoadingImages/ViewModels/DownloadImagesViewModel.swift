//
//  DownloadImagesViewModel.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/29.
//

import Foundation
import Combine
class DownloadImagesViewModel: ObservableObject{
    @Published var dataArray: [PhotoModel] = []
    let dataService = PhotoModelDataService.instance
    var cancellables = Set<AnyCancellable>()
    init() {
        addSubscribers()
    }
    
    func addSubscribers(){
        dataService.$photoModels
            .sink { [weak self] returnPhotoModels in
                guard let self = self else{return}
                self.dataArray = returnPhotoModels
            }
            .store(in: &cancellables)
    }
}

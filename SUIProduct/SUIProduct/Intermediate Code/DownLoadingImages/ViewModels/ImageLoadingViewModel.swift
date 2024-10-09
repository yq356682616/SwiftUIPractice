//
//  ImageLoadingViewModel.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/29.
//

import Foundation
import SwiftUI
import Combine
class ImageLoadingViewModel: ObservableObject{
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    let manager = PhotoModelCacheManager.instance
    
    
    let urlString: String
    let imageKey: String
    init(url: String, key: String){
        urlString = url
        imageKey = key
        getImage()
    }
    
    func getImage(){
        if let saveImage = manager.get(key: imageKey){
            image = saveImage
            print("Getting savedImage")
        }else{
            downloadImage()
            print("Downloading image now!")
        }
    }
    
    func downloadImage(){
        isLoading = true
        guard let url = URL(string: urlString) else{
            isLoading = false
            return}
        URLSession.shared.dataTaskPublisher(for: url)
            .map{UIImage(data: $0.data) }
//            .map { (data, response) -> UIImage? in
//                return UIImage(data: data)
//            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else{return}
                self.isLoading = false
            } receiveValue: { [weak self] returnImage in
                guard
                    let self = self,
                let image = returnImage
                else{return}
                self.image = image
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancellables)

    }
}

//
//  CachePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/29.
//

import SwiftUI

class CacheManage{
    
    static let instance = CacheManage() //singleton
    private init(){//只能在类内创建
        
    }
    
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 //100mb
        return cache
    }()
    
    func add(image: UIImage, name: String) -> String{
        imageCache.setObject(image, forKey: name as NSString)
        return "Added to cache!"
    }
    func remove(name:String) -> String{
        imageCache.removeObject(forKey: name as NSString)
        return "Remove from cache!"
    }
    func get(name: String) -> UIImage?{
        return imageCache.object(forKey: name as NSString)
    }
}




class CacheViewModel: ObservableObject{
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    @Published var infoMessage: String = ""
    let imageName: String = "pic"
    let manage = CacheManage.instance
    init() {
        getImageFromAssetFolder()
    }
    
    func getImageFromAssetFolder(){
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache(){
        guard let image = startingImage else{return}
        infoMessage = manage.add(image: image, name: imageName)
    }
    
    func removeFromCache(){
        infoMessage = manage.remove(name: imageName)
    }
    
    func getFromCache(){
        if let returnImage = manage.get(name: imageName){
            cachedImage = returnImage
            infoMessage = "Got image from Cache"
        }else{
            cachedImage = nil
            infoMessage = "image not found in Cache"
        }
    }
}
struct CachePracticeView: View {
    
    @StateObject var vm = CacheViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                if let image = vm.startingImage{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200,height: 200)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Text(vm.infoMessage)
                    .font(.headline)
                    .foregroundStyle(.purple)
                HStack {
                    Button {
                        vm.saveToCache()
                    } label: {
                        Text("Save to Cache")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button {
                        vm.removeFromCache()
                    } label: {
                        Text("Delete From Cache")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                Button {
                    vm.getFromCache()
                } label: {
                    Text("Get From Cache")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                if let image = vm.cachedImage{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200,height: 200)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Spacer()
            }
            .navigationTitle("Cache PracticeView")
        }
    }
}

#Preview {
    CachePracticeView()
}

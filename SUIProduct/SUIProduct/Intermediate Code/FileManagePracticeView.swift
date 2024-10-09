//
//  FileManagePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/27.
//

import SwiftUI

class LocalFileManage{
    static let instance = LocalFileManage()
    let folderName = "MyApp_Image"
    init() {
        createFolderIfNeed()
    }
    func createFolderIfNeed(){
        guard let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .path() else{
            return
        }
        if !FileManager.default.fileExists(atPath: path){
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true,attributes: nil)
                print("Success creating folder.")
            } catch let error {
                print("Error creating folder.\(error)")
            }
        }
    }
    func deleteFolder(){
        guard let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .path() else{
            return
        }
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Success deleting folder.")
        } catch let error {
            print("Error deleting folder.\(error)")
        }
    }
    
    func saveImage(image: UIImage, name: String)-> String{
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(name: name)else{
            return "Error getting data."
 
        }
        //let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //let directory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        //let directory3 = FileManager.default.temporaryDirectory
        do {
            try data.write(to: path)
            print(path)
            return "Success saving!"
        } catch let error{
            return "Error saving. \(error)"
        }
    }
    
    func getImage(name: String)->UIImage?{
        guard
            let path = getPathForImage(name: name)?.path(),
            FileManager.default.fileExists(atPath: path)
        else{
            print("Error getting data.")
            return nil
        }
        return UIImage(contentsOfFile: path)
        
    }
    func deleteImage(name: String)-> String{
        guard
            let path = getPathForImage(name: name)?.path(),
            FileManager.default.fileExists(atPath: path)
        else{
            return "Error getting data."
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Successfully deleted."
        } catch let error {
            return "Error deleting image. \(error)"
        }
    }
    func getPathForImage(name: String) -> URL?{
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name).jpeg") else {
            print("Error getting path.")
            return nil
        }
        return path
    }
}

class FileManageViewModel: ObservableObject{
    @Published var image: UIImage? = nil
    let imageName: String = "pic"
    let manage = LocalFileManage.instance
    @Published var infoMessage: String = ""
    init() {
        getImageFromAssetsFolder()
        //getImagefromFileManage()
    }
    
    func getImageFromAssetsFolder(){
        image = UIImage(named: imageName)
    }
    func getImagefromFileManage(){
        image = manage.getImage(name: imageName)
    }
    func saveImage(){
        guard let image = image else{return}
        infoMessage = manage.saveImage(image: image, name: imageName)
    }
    func deleteImage(){
        infoMessage = manage.deleteImage(name: imageName)
        manage.deleteFolder()
    }
}



struct FileManagePracticeView: View {
    
    @StateObject var vm = FileManageViewModel()
    
    
    var body: some View {
        NavigationStack{
            VStack{
                if let image = vm.image{
                    Image(uiImage:image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300,height: 500)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                HStack{
                    Button {
                        vm.saveImage()
                    } label: {
                        Text("Save to FM")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Button {
                        vm.deleteImage()
                    } label: {
                        Text("Delete from FM")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                Text(vm.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.purple)
                Spacer()
            }
            .navigationTitle("File Manage")
        }
    }
}

#Preview {
    FileManagePracticeView()
}

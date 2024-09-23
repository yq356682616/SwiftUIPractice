//
//  DownloadWithEscapingPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/20.
//

import SwiftUI

//struct PostModel:Identifiable,Codable{
//    let userId: Int
//    let id: Int
//    let title: String
//    let body: String
//}



class DownloadWithEscapingViewModel: ObservableObject{
    @Published var posts: [PostModel] = []
    init() {
        getPost()
    }
    func getPost(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")else{return}
        downloadData(fromURL: url) { returnData in
            if let data = returnData{
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else{return}
                DispatchQueue.main.async {[weak self] in
                    self?.posts = newPosts
                }
            }else{
                print("No data returned.")
            }
        }
        
    }
    
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300
            else{
                print("Error Download data.")
                completionHandler(nil)
                return
            }
            completionHandler(data)
        }.resume()
    }
}

struct DownloadWithEscapingPracticeView: View {
    @StateObject var vm = DownloadWithEscapingViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading){
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    DownloadWithEscapingPracticeView()
}

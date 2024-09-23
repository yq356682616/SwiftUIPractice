//
//  DownloadWithCombinePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/21.
//

import SwiftUI
import Combine
struct PostModel:Identifiable,Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject{
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    init(){
        getPost()
    }
    
    func getPost(){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")else{return}
        //Combine
//        URLSession.shared.dataTaskPublisher(for: URLRequest(url: url))
        URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .background))//可有可无
            .receive(on: DispatchQueue.main)
            .tryMap(handlerOutput)
//            .tryMap { (data,response) -> Data in
//                guard let response = response as? HTTPURLResponse,
//                      response.statusCode >= 200 && response.statusCode < 300 else{
//                    throw URLError(URLError.badServerResponse)
//                }
//                
//                return data
//            }
            .decode(type: [PostModel].self, decoder: JSONDecoder())
//            .replaceError(with: [])
//            .sink(receiveValue: {[weak self]returnPost in
//                self?.posts = returnPost
//            })
            .sink { completion in
                switch completion{
                case .finished:
                    print("finisted!")
                case .failure(let error):
                    print("There was an error.\(error)")
                }
            } receiveValue: { [weak self]returnPost in
                self?.posts = returnPost
            }
            .store(in: &cancellables)

        
        
    }
    
    
    func handlerOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else{
            throw URLError(URLError.badServerResponse)
        }
        
        return output.data
    }
}

struct DownloadWithCombinePracticeView: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List{
            ForEach(vm.posts) { post in
                VStack {
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
    DownloadWithCombinePracticeView()
}

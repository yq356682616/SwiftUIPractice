//
//  DependencyInjectionPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/18.
//

import SwiftUI
import Combine




struct PostsModel: Identifiable, Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
protocol DataServiceProtocol{
    func getData() -> AnyPublisher<[PostsModel], Error>
}
class ProductionDataService: DataServiceProtocol{
    
//    static let instance = ProductionDataService()
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostsModel], Error>{
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [PostsModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}

class MockDataService: DataServiceProtocol{
    
    let testData: [PostsModel]
    init(data: [PostsModel]?) {
        self.testData = data ?? [PostsModel(userId: 1, id: 1, title: "One", body: "one"),
                                     PostsModel(userId: 2, id: 2, title: "Two", body: "two")]
    }
    
    
    
    func getData() -> AnyPublisher<[PostsModel], any Error> {
        Just(testData)
            .tryMap({ $0 })
            .eraseToAnyPublisher()
    }
}

class DependencyInjectionViewModel: ObservableObject{
    @Published var dataArray: [PostsModel] = []
    var cancelables = Set<AnyCancellable>()
    let dataService: DataServiceProtocol
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        loadPosts()
    }
    
    private func loadPosts(){
        dataService.getData()
            .sink { _ in
                
            } receiveValue: { [weak self] returnPosts in
                self?.dataArray = returnPosts
            }
            .store(in: &cancelables)

    }
}

struct DependencyInjectionPracticeView: View {
    
    @StateObject private var vm: DependencyInjectionViewModel
    init(dataService: DataServiceProtocol) {
        _vm = StateObject(wrappedValue: DependencyInjectionViewModel(dataService: dataService))
    }
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}

#Preview {
//    DependencyInjectionPracticeView(dataService: ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!))
    DependencyInjectionPracticeView(dataService: MockDataService(data: nil))
}

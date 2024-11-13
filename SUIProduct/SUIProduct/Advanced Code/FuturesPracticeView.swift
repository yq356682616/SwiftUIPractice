//
//  FuturesPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/24.
//

import SwiftUI
import Combine
class FuturesBootcampViewModel: ObservableObject{
    
    @Published var title: String = "Starting title"
    let url = URL(string: "https://www.goole.com")!
    var cancellable = Set<AnyCancellable>()
    init() {
        download()
    }
    
    func download(){
//        getCombinePublisher()
//            .sink { _ in
//                
//            } receiveValue: { [weak self] returnValue in
//                self?.title = returnValue
//            }
//            .store(in: &cancellable)
//        getEscapingClosure { [weak self] returnValue, error in
//            self?.title = returnValue
//        }
        getFuturePublisher()
            .sink { _ in
                
            } receiveValue: { [weak self] returnValue in
                self?.title = returnValue
            }
            .store(in: &cancellable)
    }
    
    func getCombinePublisher() -> AnyPublisher<String, URLError>{
        URLSession.shared.dataTaskPublisher(for: url)
            .timeout(1, scheduler: DispatchQueue.main)
            .map({ _ in
                return "New Value"
            })
            .eraseToAnyPublisher()
    }
    
    func getEscapingClosure(completionHandler: @escaping (_ value: String, _ error: Error?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            completionHandler("New Value 2", nil)
        }
        .resume()
    }
    
    func getFuturePublisher() -> Future<String, Error>{
        return Future { promise in
            self.getEscapingClosure { returnValue, error in
                if let error = error{
                    promise(.failure(error))
                }else{
                    promise(.success(returnValue))
                }
            }
        }
        
    }
    
    func doSomething(completion: @escaping (_ value: String)-> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            completion("NEW STRING")
        }
    }
    
    func doSomethingInTheFuture()->Future<String, Never>{
        return Future { promise in
            self.doSomething { value in
                promise(.success(value))
            }
        }
    }
}

struct FuturesPracticeView: View {
    
    @StateObject private var vm = FuturesBootcampViewModel()
    
    var body: some View {
        Text(vm.title)
    }
}

#Preview {
    FuturesPracticeView()
}

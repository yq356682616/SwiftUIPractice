//
//  AdvancedCombinePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/23.
//

import SwiftUI
import Combine
class AdvancedCombineDataService{
    
//    @Published var basicPublisher: String = "first publish"
//    let currentValuePublisher = CurrentValueSubject<String, Error>("first publish")//代替
    let passThroughPublisher = PassthroughSubject<Int, Error>()//不保存当前值防止内存占用
    let boolPublisher = PassthroughSubject<Bool, Error>()
    let intPublisher = PassthroughSubject<Int, Error>()
    init() {
        publishFakeData()
    }
    
    public func publishFakeData(){
        let item: [Int] = [1,2,3,4,5,6,7,8,9,10]
        for x in item.indices{
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
//                self.basicPublisher = item[x]
//                self.currentValuePublisher.send(item[x])
                self.passThroughPublisher.send(item[x])
                
                if (x > 4 && x < 8){
                    self.boolPublisher.send(true)
                    self.intPublisher.send(999)
                }else{
                    self.boolPublisher.send(false)
                }
                
                if x == item.indices.last{
                    self.passThroughPublisher.send(completion: .finished)
                }
            }
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
//            self.passThroughPublisher.send(1)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.passThroughPublisher.send(2)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            self.passThroughPublisher.send(3)
//        }
    }
}

class AdvancedCombineBootcampViewModel: ObservableObject{
    
    @Published var data:[String] = []
    @Published var dataBools:[Bool] = []
    @Published var error: String = ""
    
    let dataService = AdvancedCombineDataService()
    var cancellables = Set<AnyCancellable>()
    let multiCastPublisher = PassthroughSubject<Int, Error>()
    init() {
        addSubscribers()
    }
    
    private func addSubscribers(){
//        dataService.$basicPublisher
//        dataService.currentValuePublisher
//        dataService.passThroughPublisher
        
            //Sequence Operation 序列操作
        /*
//            .first()
//            .first(where: {$0 > 4})
//            .tryFirst(where: { int in
//                if int == 3{
//                    throw URLError(.badServerResponse)
//                }
//                return int > 1
//            })
        
//            .last()//一直不结束直到最后一个发送结束消息
//            .last(where: { $0 < 4 })
//            .tryLast(where: { int in
//                if int == 3{
//                    throw URLError(.badServerResponse)
//                }
//                return int > 1
//            })
        
//            .dropFirst(3)
        
//            .drop(while: { $0 < 5 }) //只能小于
//            .tryDrop(while: { int in
//                if int == 15{
//                    throw URLError(.badServerResponse)
//                }
//                return int < 6
//            })
            
//            .prefix(4)//前四个
//            .prefix(while: { $0 < 5 })
//            .tryPrefix(while: T##(Int) throws -> Bool)
            
//            .output(at: 1)
//            .output(in: 2..<4)
        */
            //Mathematice Operation 数学操作
        /*
//            .max()
//            .max(by: { int1, int2 in
//                return int1 < int2
//            })
//            .tryMax(by: T##(Int, Int) throws -> Bool)
//            .min()
//            .min(by: T##(Int, Int) -> Bool)
//            .tryMin(by: T##(Int, Int) throws -> Bool)
        */
            //Filter/ Reducing Operation 筛选操作
        /*
//            .map({ String($0) })
//            .tryMap({ int in
//                if int == 5{
//                    throw URLError(.badServerResponse)
//                }
//                return String(int)
//            })
//            .compactMap({ int in//去空压缩
//                if int == 5{
//                    return nil
//                }
//                return String(int)
//            })
//            .tryCompactMap(T##transform: (Int) throws -> T?##(Int) throws -> T?)
//            .filter({ ($0 > 3) && ($0 < 7)})
//            .tryFilter(T##isIncluded: (Int) throws -> Bool##(Int) throws -> Bool)
//            .removeDuplicates()//删除重复的 挨着的数据
//            .removeDuplicates(by: { int1, int2 in
//                return int1 == int2
//            })
//            .tryRemoveDuplicates(by: T##(Int, Int) throws -> Bool)
//            .replaceNil(with: 5)
//            .replaceEmpty(with: [])
//            .replaceError(with: "DEFAULT VALUE")
//            .scan(0, { existingValue, newValue in//累计
//                return existingValue + newValue
//            })
//            .scan(0, { $0 + $1 })
//            .scan(0, +)
//            .tryScan(T##initialResult: T##T, T##nextPartialResult: (T, Int) throws -> T##(T, Int) throws -> T)
//            .reduce(0, { existingValue, newValue in//产生一个最终值
//                return existingValue + newValue
//            })
//            .reduce(0, +)
//            .map({ String($0) })
//            .collect()//集合在一起发布
//            .collect(3)//每3个一起合并
//            .allSatisfy({ $0 < 50 })//是否所有的都满足条件
        */
            //Timeing Operation 时间操作
        /*
//            .debounce(for: 0.75, scheduler: DispatchQueue.main)//抖，
//            .delay(for: 5, scheduler: DispatchQueue.main)
//            .measureInterval(using: DispatchQueue.main)
//            .map({ stride in
//                return "\(stride.timeInterval)"
//            })
//            .throttle(for: 5, scheduler: DispatchQueue.main, latest: true)//节流5秒发布一次
//            .retry(3)
//            .timeout(0.75, scheduler: DispatchQueue.main)
        */
            //Multiple Publishers/Subscribers
        /*
//            .combineLatest(dataService.boolPublisher, dataService.intPublisher)
//            .compactMap({ (int, bool) in
//                if bool{
//                    return String(int)
//                }
//                return nil
//            })
//            .compactMap({ $1 ? String($0) : nil})
//            .compactMap({ (int1, bool, int2) in
//                if bool{
//                    return String(int1)
//                }
//                return "n/a"
//            })//第二三个跟随第一个发布
//            .merge(with: dataService.intPublisher)//合并
//            .zip(dataService.boolPublisher, dataService.intPublisher)//以最少次数的发布
//            .map({ tuple in
//                return String(tuple.0) + tuple.1.description + String(tuple.2)
//            })
//            .tryMap({ int in
//                if int == 5{
//                    throw URLError(.badServerResponse)
//                }
//                return int
//            })
//            .catch({ error in
//                return self.dataService.intPublisher//如果抛出异常则切换返回的发布者
//            })
        */
        let sharedPublisher = dataService.passThroughPublisher
            .share()
//            .multicast {//多播放
//                PassthroughSubject<Int, Error>()
//            }
            .multicast(subject: multiCastPublisher)
        
        sharedPublisher
            .map({ String($0) })
            .sink { completion in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    self.error = "ERROR:\(error.localizedDescription)"
                    break
                }
            } receiveValue: {[weak self] returnValue in
                self?.data.append(returnValue)
            }
            .store(in: &cancellables)
        
        sharedPublisher
            .map({ $0 > 5 ? true : false})
            .sink { completion in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    self.error = "ERROR:\(error.localizedDescription)"
                    break
                }
            } receiveValue: {[weak self] returnValue in
                self?.dataBools.append(returnValue)
            }
            .store(in: &cancellables)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            sharedPublisher
                .connect()
                .store(in: &self.cancellables)
        }

    }
}

struct AdvancedCombinePracticeView: View {
    
    @StateObject private var vm = AdvancedCombineBootcampViewModel()
    
    var body: some View {
        ScrollView{
            HStack {
                VStack {
                    ForEach(vm.data, id: \.self) {
                        Text($0)
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                    if !vm.error.isEmpty{
                        Text(vm.error)
                    }
                }
                VStack {
                    ForEach(vm.dataBools, id: \.self) {
                        Text($0.description)
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    AdvancedCombinePracticeView()
}

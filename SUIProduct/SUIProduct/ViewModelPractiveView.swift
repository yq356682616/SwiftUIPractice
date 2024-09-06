//
//  ViewModelPractiveView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/4.
//

import SwiftUI
struct FruitModel: Identifiable{
    let id:String = UUID().uuidString
    var name: String
    let count: Int
    
}
//可观察类
//ObservableObject 可观察对象协议
//@Published 属性包装器 把属性标记为可观察行
//@ObservedObject 属性包装器  可以不被当前view持有 生命周期与View可以不一致
//@StateObject 属性包装器  当前view持有 生命周期与View一致
class FruitViewModel:ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    init(){
        getFruits()
    }
    func getFruits(){
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Watermelon", count: 88)
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }
    }
    func deletaFruit(index: IndexSet){
        fruitArray.remove(atOffsets: index)
    }
}
struct ViewModelPractiveView: View {
//    @State var fruitArray: [FruitModel] = [
//        FruitModel(name: "Apples", count: 5)
//    ]
//    @ObservedObject var fruitViewModel:FruitViewModel = FruitViewModel()//观察对象：用于传递到其它视图
    @StateObject var fruitViewModel:FruitViewModel = FruitViewModel()//状态对象：用在创建初始化
    var body: some View {
        NavigationStack {
            List {
                if fruitViewModel.isLoading{
                    ProgressView()
                }else{
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack{
                            Text("\(fruit.count)")
                                .foregroundStyle(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deletaFruit)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Fruit List")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        RandomScreen(fruitViewModel: fruitViewModel)
                    } label: {
                        Image(systemName: "arrow.right")
                            .font(.headline)
                            .foregroundStyle(.gray)
                    }
                }
            })
        }
    }
}


struct RandomScreen:View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var fruitViewModel: FruitViewModel//观察对象
    var body: some View {
        ZStack(content: {
            Color.green.ignoresSafeArea(.all)
            VStack{
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundStyle(.white)
                        .font(.headline)
                }
            }
        })
    }
}
#Preview {
    ViewModelPractiveView()
//    RandomScreen()
}

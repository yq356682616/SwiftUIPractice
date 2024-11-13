//
//  GenericesPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/11.
//

import SwiftUI
//泛型
struct StringModel{
    let info: String?
    
    func removeInfo() -> StringModel{
        StringModel(info: nil)
    }
}
struct BoolModel{
    let info: Bool?
    
    func removeInfo() -> BoolModel{
        BoolModel(info: nil)
    }
}

struct GenericeModel<T>{
    let info: T?
    func removeInfo() -> GenericeModel{
        GenericeModel(info: nil)
    }
}


class GenericeViewModel: ObservableObject{
    @Published var stringModel = StringModel(info: "Hello, world!")
    @Published var boolModel = BoolModel(info: true)
    @Published var genericStringModel = GenericeModel(info: "Hello,world")
    @Published var genericBoolModel = GenericeModel(info: true)
    func removeData(){
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
//    @Published var dataArray: [String] = []
//
//    init() {
//        dataArray = ["One","Two","Three"]
//    }
//    func removeDataFromDataArray(){
//        dataArray.removeAll()
//    }
}
//传递View
struct GenericeView<T:View>: View {
    let content: T
    let title: String
    var body: some View {
        VStack{
            Text(title)
            content
        }
    }
}
struct GenericesPracticeView: View {
    @StateObject private var vm = GenericeViewModel()
    var body: some View {
        VStack {
            GenericeView(content: Text("custom Content"), title: "NewView")
            //GenericeView(title: "New view!")
            Text(vm.stringModel.info ?? "no data")
            Text(vm.boolModel.info?.description ?? "no data")
            Text(vm.genericStringModel.info ?? "no data")
            Text(vm.genericBoolModel.info?.description ?? "no data")
//            ForEach(vm.dataArray, id: \.self) { item in
//                Text(item)
//                    .onTapGesture {
//                        vm.removeDataFromDataArray()
//                    }
//            }
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

#Preview {
    GenericesPracticeView()
}

//
//  BacktgroundThreadPractiveView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/20.
//

import SwiftUI

@Observable class BackroundThreadViewModel{
    var dataArray: [String] = [
        
    ]
    func fetchData(){
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            print("CHECT 1:\(Thread.isMainThread)")
            print("CHECT 1:\(Thread.current)")
            DispatchQueue.main.async {
                self.dataArray = newData
                print("CHECT 2:\(Thread.isMainThread)")
                print("CHECT 2:\(Thread.current)")
            }
        }
    }
    func downloadData() -> [String]{
        var data: [String] = []
        for x in 0..<100{
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BacktgroundThreadPractiveView: View {
    @State var vm = BackroundThreadViewModel()
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10, content: {
                Text("LOAD DATA")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(.red)
                }
            })
        }
    }
}

#Preview {
    BacktgroundThreadPractiveView()
}

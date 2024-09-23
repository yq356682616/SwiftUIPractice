//
//  WeakSelfPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/20.
//

import SwiftUI



struct WeakSelfPracticeView: View {
    
    @AppStorage("count") var count: Int?
    
    init() {
        self.count = 0
    }
    var body: some View {
        NavigationStack {
            NavigationLink("Naviggate") {
                WeakSelfSceondScreen()
            }
            .navigationTitle("Screen 1")
        }
        .overlay(alignment: .topTrailing) {
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct WeakSelfSceondScreen:View {
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    var body: some View {
        Text("Second View")
            .font(.largeTitle)
            .foregroundStyle(.red)
        if let data = vm.data{
            Text(data)
        }
    }
}

class WeakSelfSecondScreenViewModel:ObservableObject{
    @Published var data: String? = nil
    init(){
        print("INITIALIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    func getData(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 100) { [weak self] in
            self?.data = "New Data"
        }
        //立即释放掉
    }
    
    deinit{
        print("DEINITIZLIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
}

#Preview {
    WeakSelfPracticeView()
}

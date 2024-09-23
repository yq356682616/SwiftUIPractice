//
//  EscapingPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/20.
//

import SwiftUI

class EscapingViewModel: ObservableObject{
    @Published var text: String = "Hello"
    func getData(){
//        downloadData3 {[weak self] returnData in
//            self?.text = returnData
//        }
//        downloadData4 {[weak self] returnResult in
//            self?.text = returnResult.data
//        }
        downloadData5{ [weak self] returnResult in
            self?.text = returnResult.data
        }
    }
    
    func downloadData() -> String{
        
        
        
        
        return "New data!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> ()){
        completionHandler("New Data!")
    }
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler("New Data!")
        }
    }
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
}
struct DownloadResult{
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()
struct EscapingPracticeView: View {
    @StateObject var vm = EscapingViewModel()
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingPracticeView()
}

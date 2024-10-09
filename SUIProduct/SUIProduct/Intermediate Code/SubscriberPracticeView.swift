//
//  SubscriberPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/21.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject{
    @Published var count: Int = 0
//    var timer: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldText: String = ""
    @Published var testIsValid: Bool = false
    
    @Published var showButton: Bool = false
    init() {
        setUpTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addTextFieldSubscriber(){
        $textFieldText
            .debounce(for: .seconds(2), scheduler: DispatchQueue.main)//事件之间的延时
            .map { text -> Bool in
                if text.count > 3{
                    return true
                }
                return false
            }
//            .assign(to: \.testIsValid, on: self)
            .sink(receiveValue: { [weak self]isValid in
                self?.testIsValid = isValid
            })
            .store(in: &cancellables)
    }
    func setUpTimer(){
//        timer = Timer
//            .publish(every: 1, on: .main, in: .common)
//            .autoconnect()
//            .sink { [weak self] _ in
//                guard let self = self else{return}
//                self.count += 1
//        
//                if count >= 10{
//                    self.timer?.cancel()
//                }
//            }
        
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else{return}
                self.count += 1
                
//                if count >= 10{
//                    for item in self.cancellables{
//                        item.cancel()
//                    }
//                }
            }
            .store(in: &cancellables)
    }
    
    func addButtonSubscriber(){
        $testIsValid
            .combineLatest($count)
            .sink { [weak self](isValid, count) in
                guard let self = self else{return}
                if isValid && count >= 10{
                    self.showButton = true
                }else{
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
}

struct SubscriberPracticeView: View {
    @StateObject var vm = SubscriberViewModel()
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            Text(vm.testIsValid.description)
            TextField("Type something here ...", text: $vm.textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .font(.headline)
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(alignment: .trailing) {
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundStyle(.red)
                            .opacity(
                                vm.textFieldText.count < 1 ? 0.0 :
                                vm.testIsValid ? 0.0 : 1.0
                            )
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                            .opacity(vm.testIsValid ? 1.0 : 0.0)
                    }
                    .font(.title)
                    .padding(.trailing)
                }
            Button {
                
            } label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .opacity(vm.showButton ? 1.0 : 0.5)
            }
            .disabled(!vm.showButton)

        }
        .padding()
    }
}

#Preview {
    SubscriberPracticeView()
}

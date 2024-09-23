//
//  IfLetGuardPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/4.
//

import SwiftUI

struct IfLetGuardPracticeView: View {
    @State var currentUserID: String? = nil
    @State var displayText: String? = nil
    @State var isLoading: Bool = false
    var body: some View {
        NavigationStack {
            VStack(content: {
                Text("Here we are practicing sage coding!")
                if let text = displayText{
                    Text(text)
                        .font(.title)
                }
                if isLoading{
                    ProgressView()
                }
                Spacer()
            })
            .navigationTitle("Safe coding")
            .onAppear(perform: {
                loadData()
            })
        }
    }
    func loadData(){
        if let userID = currentUserID{
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "This is the new data! UserID is \(userID)"
                isLoading = false
            }
        }else{
            displayText = "Error. This is no User ID!"
        }
    }
    
    func loadData2(){
        guard let userID = currentUserID else{
            displayText = "Error. This is no User ID!"
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is the new data! UserID is \(userID)"
            isLoading = false
        }
    }
}

#Preview {
    IfLetGuardPracticeView()
}

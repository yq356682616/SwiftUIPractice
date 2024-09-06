//
//  EnvironmentObjectPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/5.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject{
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    func getData(){
        self.dataArray.append(contentsOf: ["iPhone","iPad","iMac","Apple Watch"])
    }
}

struct EnvironmentObjectPracticeView: View {
    @StateObject var viewModel:EnvironmentViewModel = EnvironmentViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.dataArray, id: \.self) {
                    item in
                    NavigationLink {
                        DetailView(selectedItem: item)
                    } label: {
                        Text(item)
                    }
                }
            }
            .navigationTitle("iOS Devices")
        }
        .environmentObject(viewModel)
    }
}
struct DetailView:View {
    let selectedItem: String
    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea(.all)
            NavigationLink {
                FinalView()
            } label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundStyle(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }

        }
    }
}

struct FinalView:View {
    @EnvironmentObject var viewModel: EnvironmentViewModel
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20.0, content: {
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
                    Button("changen") {
                        viewModel.dataArray[0] = "123123"
                    }
                })
                .foregroundStyle(.white)
                .font(.largeTitle)
            }
        }
    }
}
#Preview {
    EnvironmentObjectPracticeView()
//    detailView(selectedItem: "iPhone")
//    FinalView()
    
}

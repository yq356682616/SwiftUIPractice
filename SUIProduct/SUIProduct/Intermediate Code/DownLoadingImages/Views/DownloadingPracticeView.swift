//
//  DownloadingPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/29.
//

import SwiftUI


struct DownloadingPracticeView: View {
    @StateObject var vm = DownloadImagesViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.dataArray) { model in
                    DownloadingImagesRow(model: model)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Downloading Images!")
        }
    }
}

#Preview {
    DownloadingPracticeView()
}

//
//  ObservablePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/13.
//

import SwiftUI
@Observable class ObservableViewModel{
    var title: String = "Some title"
}



struct ObservablePracticeView: View {
    @State private var viewModel = ObservableViewModel()
    var body: some View {
        VStack(spacing: 40.0, content: {
            Button(viewModel.title) {
                viewModel.title = "new title!"
            }
            SomeChildView(viewModel: $viewModel)
            SomeThirdView()
        })
        .environment(viewModel)
    }
}

struct SomeChildView: View {
    @Binding var viewModel: ObservableViewModel
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "ggggff"
        }
    }
}
struct SomeThirdView: View {
    @Environment(ObservableViewModel.self) var viewModel: ObservableViewModel
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "afdasdkfjkl"
        }
    }
}
#Preview {
    ObservablePracticeView()
}

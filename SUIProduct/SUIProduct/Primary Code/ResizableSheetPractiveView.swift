//
//  ResizableSheetPractiveView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/10.
//

import SwiftUI

struct ResizableSheetPractiveView: View {
    @State private var showSheet: Bool = false
    @State private var detents: PresentationDetent = .large
    var body: some View {
        Button("Click me!") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet, content: {
            MyNextView(detents: $detents)
//                .presentationDetents([.medium,.large])
//                .presentationDragIndicator(.hidden)
//                .interactiveDismissDisabled()
//                .presentationDetents([.fraction(0.5)])
//                .presentationDetents([.height(600)])
        })
    }
}

struct MyNextView:View {
    @Binding var detents:PresentationDetent
    
    var body: some View {
        ZStack(content: {
            Color.red.ignoresSafeArea()
            VStack(content: {
                Button("20%") {
                    detents = .fraction(0.2)
                }
                Button("medium") {
                    detents = .medium
                }
                Button("large") {
                    detents = .large
                }
            })
        })
        .presentationDetents([.fraction(0.2),.medium,.large], selection: $detents)
    }
}
#Preview {
    ResizableSheetPractiveView()
}

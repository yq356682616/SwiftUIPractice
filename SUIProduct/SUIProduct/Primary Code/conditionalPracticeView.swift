//
//  conditionalPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/30.
//

import SwiftUI

struct conditionalPracticeView: View {
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var isLoading:Bool = false
    var body: some View {
        VStack(spacing: 20, content: {
            Button("is Loading:\(isLoading.description)") {
                isLoading.toggle()
            }
            if isLoading{
                ProgressView()
            } else {
                
            }
//            Button("Circle Button：\(showCircle.description)") {
//                showCircle.toggle()//真变假，假变真
//            }
//            Button("Rectangle Button \(showRectangle.description)") {
//                showRectangle.toggle()
//            }
//            if showCircle{
//                Circle()
//                    .frame(width: 100,height: 100)
//            }
//            if showRectangle{
//                Rectangle()
//                    .frame(width: 100,height: 100)
//            }
//            if showCircle || showRectangle{
//                RoundedRectangle(cornerRadius: 25)
//                    .frame(width: 200,height: 200)
//            }
//            Spacer()
        })
    }
}

#Preview {
    conditionalPracticeView()
}

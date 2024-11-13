//
//  MatchedGeometryEffectPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/10.
//

import SwiftUI
//可以做动画
struct MatchedGeometryEffectPracticeView: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var nameSpace
    var body: some View {
        VStack {
            if !isClicked{
                Circle()
                    .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                    .frame(width: 100, height: 100)
            }
            Spacer()
            if isClicked{
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                    .frame(width: 300, height: 200)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

#Preview {
//    MatchedGeometryEffectPracticeView()
    MatchedGeometryEffectExample2()
}

//可以做选择器
struct MatchedGeometryEffectExample2: View {
    
    let categories: [String] = ["Home","Popular","Saved"]
    @State private var selected: String = "Home"
    @Namespace private var nameSpace2
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack {
                    if selected == category{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "cateGory_background", in: nameSpace2)
                            .frame(width: 35, height: 10)
                            .offset(y: 10)
                    }
                    Text(category)
                        .foregroundStyle(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring) {
                        selected = category
                    }
                }
            }
        }
    }
}

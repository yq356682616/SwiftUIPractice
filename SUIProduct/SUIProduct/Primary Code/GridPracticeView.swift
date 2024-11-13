//
//  GridPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/29.
//

import SwiftUI

struct GridPracticeView: View {
    let columns:[GridItem] = [
        GridItem(.flexible(),spacing: 6,alignment: nil),
        GridItem(.flexible(),spacing: 6,alignment: nil),
        GridItem(.flexible(),spacing: 6,alignment: nil)
//        GridItem(.adaptive(minimum: 150, maximum: 400),spacing: nil,alignment: nil)//自适应
//        GridItem(.fixed(50),spacing: nil,alignment: nil) //固定宽度
//        GridItem(.flexible(),spacing: nil,alignment: nil) // 灵活
    ]
    var body: some View {
        ScrollView{
            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            LazyVGrid(columns: columns,
                      alignment: .center,
                      spacing: 6,
                      pinnedViews: [.sectionHeaders],//悬浮
                      content: {
                Section {
                    ForEach(0..<50) { index in
                        Rectangle()
                            .frame(height: 150)
                    }
                } header: {
                    Text("section 1")
                        .foregroundStyle(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.blue)
                        .padding()
                }

                
                Section {
                    ForEach(0..<50) { index in
                        Rectangle()
                            .fill(.green)
                            .frame(height: 150)
                    }
                } header: {
                    Text("section 2")
                        .foregroundStyle(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.red)
                        .padding()
                }

//                ForEach(0..<50) { index in
//                    Rectangle()
//                        .frame(height: 150)
//                }
            })
//            LazyVGrid(columns: columns) {
//                ForEach(0..<50) { index in
//                    Rectangle()
//                        .frame(height: 150)
//                }
//            }
        }
    }
}

#Preview {
    GridPracticeView()
}

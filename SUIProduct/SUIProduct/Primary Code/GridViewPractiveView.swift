//
//  GridViewPractiveView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/12.
//

import SwiftUI

struct GridViewPractiveView: View {
    var body: some View {
        Grid(alignment: .center, horizontalSpacing: 8,verticalSpacing: 8) {
            ForEach(0..<4) { rowIndex in
                GridRow(alignment: .top) {
                    ForEach(0..<4) { columIndex in
                        let cellNumber = (rowIndex * 4) + (columIndex + 1)
                        if cellNumber == 7{
                            EmptyView()
//                                Color.green
//                                    .gridCellUnsizedAxes([.horizontal, .vertical])
                        }else{
                            cell(int: cellNumber)
                                .gridCellColumns(cellNumber == 6 ? 2 : 1)//改变列数
                                .gridCellAnchor(.leading)//对齐方式
                                .gridColumnAlignment(cellNumber == 1 ? .trailing :
                                                        cellNumber == 4 ? .leading :.center)
                        }
                    }
                }
            }
        }
        
        
//        Grid {
//            GridRow {
//                cell(int: 1)
//                cell(int: 2)
//                cell(int: 3)
//            }
//            Divider()
////                .gridCellUnsizedAxes(.horizontal)
////            cell(int: 33333333333333)
//            GridRow {
//                cell(int: 4)
//                cell(int: 5)
//            }
//        }
    }
    
    private func cell(int: Int) -> some View{
        Text("\(int)")
            .frame(height: int == 10 ? 20 : nil)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
    }
}

#Preview {
    GridViewPractiveView()
}

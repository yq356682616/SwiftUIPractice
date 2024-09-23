//
//  ListRowView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/13.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack(content: {
            Image(systemName: item.isCompleteed ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleteed ? .green : .red)
            Text(item.title)
            Spacer()
        })
        .font(.title2)
        .padding(.vertical,8)
    }
}

#Preview {
//    var itemt1 = ItemModel(title: "First item!", isCompleteed: false)
//    var itemt2 = ItemModel(title: "Second item!", isCompleteed: false)
    Group {
        ListRowView(item:ItemModel(title: "First item!", isCompleteed: false))
        ListRowView(item:ItemModel(title: "Second item!", isCompleteed: true))
        
    }
}

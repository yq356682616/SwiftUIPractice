//
//  SwipeActionPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/6.
//

import SwiftUI

struct SwipeActionPracticeView: View {
    @State var fruits: [String] = [
        "apple",
        "orange",
        "banana",
        "peach"
    ]
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    .swipeActions(edge: .trailing,allowsFullSwipe: true) {
                        Button("Archive") {
                            
                        }
                        .tint(.green)
                        Button("Save") {
                            
                        }
                        .tint(.blue)
                        Button("Junl") {
                            
                        }
                        .tint(.black)
                    }
                    .swipeActions(edge: .leading,allowsFullSwipe: false) {
                        Button("Share") {
                            
                        }
                        .tint(.yellow)
                    }
            }
            .onDelete(perform: delete)
        }
    }
    func delete(indexSet: IndexSet){
        
    }
}

#Preview {
    SwipeActionPracticeView()
}

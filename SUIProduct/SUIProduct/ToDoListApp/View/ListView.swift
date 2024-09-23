//
//  ListView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/13.
//

import SwiftUI

struct ListView: View {
    
    @Environment(ListViewModel.self) var listViewModel: ListViewModel
    
    var body: some View {
        ZStack(content: {
            if listViewModel.items.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleltaItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        })
        .listStyle(.plain)
        .navigationTitle("Todo List📝")
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        })
    }
}

#Preview {
    NavigationStack {
        ListView()
            .environment(ListViewModel())
    }
}


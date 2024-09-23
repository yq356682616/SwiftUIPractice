//
//  ListPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/2.
//

import SwiftUI

struct ListPracticeView: View {
    @State var fruits: [String] = [
        "apple",
        "orange",
        "banana",
        "peach"
    ]
    @State var veggies: [String] = [
        "tomato",
        "potat",
        "carrot"
    ]
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(fruits,id:\.self) { fruit in
                        Text(fruit.capitalized)
                            .font(.caption)
                            .foregroundStyle(.white)
                            .padding(.vertical)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.blue)
                } header: {
                    HStack {
                        Text("FRUITS")
                        Image(systemName: "flame.fill")
                    }
                    .font(.headline)
                    .foregroundColor(.orange)
                }
                Section {
                    ForEach(veggies,id:\.self) { veggies in
                        Text(veggies.capitalized)
                    }
                } header: {
                    Text("Veggies")
                        .foregroundStyle(.purple)
                }

            }
            .listStyle(.grouped)
            .navigationTitle("Grocey List")
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    addButton
                }
            }
        }
        .tint(.red)
    }
    var addButton:some View{
        Button("Add") {
            add()
        }
    }
    func delete(indexSet:IndexSet){
        fruits.remove(atOffsets: indexSet)
    }
    func move(indices:IndexSet,newOffset:Int){
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    func add(){
        fruits.append("Coconut")
    }
}

#Preview {
    ListPracticeView()
}

//
//  NavigationSplitPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/12.
//

import SwiftUI
//For ipad macos VisionOS
struct NavigationSplitPracticeView: View {
    @State private var visibility: NavigationSplitViewVisibility = .all
    @State private var selectedCategory: FoodCategory? = nil
    @State private var selectedFruit: Fruit? = nil
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            List(FoodCategory.allCases, id: \.rawValue, selection: $selectedCategory) {category in
//                Button(category.rawValue.capitalized) {
//                    selectedCategory = category
//                }
                NavigationLink(category.rawValue.capitalized, value: category)
            }
//            List {
//                ForEach(FoodCategory.allCases, id: \.self) { category in
//                    Button(category.rawValue.capitalized) {
//                        selectedCategory = category
//                    }
//                }
//            }
            .navigationTitle("Categories")
        } content: {
            if let selectedCategory{
                Group {
                    switch selectedCategory {
                    case .fruits:
                        List(Fruit.allCases, id: \.rawValue, selection: $selectedFruit) {fruit in
//                            Button(fruit.rawValue.capitalized) {
//                                selectedFruit = fruit
//                            }
                            NavigationLink(fruit.rawValue.capitalized, value: fruit)
                        }
//                        List {
//                            ForEach(Fruit.allCases, id: \.self) { fruit in
//                                Button(fruit.rawValue.capitalized) {
//
//                                    selectedFruit = fruit
//                                }
//                            }
//                        }
                    case .vegetables:
                        EmptyView()
                    case .meats:
                        EmptyView()
                    }
                }
                .navigationTitle(selectedCategory.rawValue.capitalized)
            }else{
                Text("Selecet a category to begin!")
            }
        } detail: {
            if let selectedFruit{
                Text("Your selected: \(selectedFruit.rawValue.capitalized)")
                    .font(.largeTitle)
                    .navigationTitle(selectedFruit.rawValue.capitalized)
            }else{
                Text("Selecet something!")
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    NavigationSplitPracticeView()
}
enum FoodCategory: String, CaseIterable{
    case fruits, vegetables, meats
}
enum Fruit:String, CaseIterable{
    case apple, banana, orange
}

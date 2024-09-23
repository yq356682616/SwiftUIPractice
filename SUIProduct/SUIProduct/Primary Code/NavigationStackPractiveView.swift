//
//  NavigationStackPractiveView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/9.
//

import SwiftUI

struct NavigationStackPractiveView: View {
    let fruits = ["Apple","Orange","Banana"]
    @State private var stackPath: [String] = []
    var body: some View {
//        NavigationStack {
        NavigationStack(path: $stackPath) {//path决定是否能跳转
            
            ScrollView {
                
                VStack(content: {
                    Button("Super sqeue!") {
//                        stackPath.append("Coconut")
                        stackPath.append(contentsOf: [
                            "Coconut","Watermelon","Mango"
                        ])
                        //直接跳到
                    }
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit) {
                            Text(fruit)
                        }
                    }
                    .padding()
                    ForEach(0..<10) { index in
                        NavigationLink(value: index) {
                            Text("click me: \(index)")
                        }
                    }
                    .padding()
                })
            }
            .navigationTitle("Nac Practice View")
            .navigationDestination(for: Int.self) { value in
                MySecondScreen(value: value)
            }
            .navigationDestination(for: String.self) { value in
                Text("Screen \(value) ")
            }
        }
    }
}
struct MySecondScreen:View {
    let value: Int
    init(value: Int) {
        self.value = value
        print("SCREEN \(value)")
    }
    var body: some View {
        Text("Screen \(value) ")
    }
}
#Preview {
    NavigationStackPractiveView()
}

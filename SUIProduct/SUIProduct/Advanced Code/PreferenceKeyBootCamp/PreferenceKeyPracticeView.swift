//
//  PreferenceKeyPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/12.
//

import SwiftUI

struct PreferenceKeyPracticeView: View {
    
    @State private var text: String = "Hello, world!"
    
    var body: some View {
        NavigationStack {
            VStack {
                SecondScreen2(text: text)
            }
            .navigationTitle("Navigation Title")
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
            self.text = value
        }
    }
}
extension View{
    func customTitle(_ text: String) -> some View{
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}
#Preview {
    PreferenceKeyPracticeView()
}

struct SecondScreen2:View {
    let text: String
    @State private var newValue: String = ""
    var body: some View {
        Text(text)
            .onAppear(perform: getDataFromDatabase)
            .customTitle(newValue)
    }
    func getDataFromDatabase(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.newValue = "NEW VALUE FROM DATABASE"
        }
    }
}

struct CustomTitlePreferenceKey: PreferenceKey{
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

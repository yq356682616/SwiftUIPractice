//
//  TogglePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/3.
//

import SwiftUI
//开关


struct TogglePracticeView: View {
    @State var toggleIsOn: Bool = false
    var body: some View {
        Group {
            VStack {
                HStack{
                    Text("status:")
                    Text(toggleIsOn ? "Online":"Offline")
                }
                .font(.title)
                Toggle(isOn: $toggleIsOn, label: {
                    Text("Change Status")
                })
                .tint(.purple)
                Spacer()
            }
            
            .padding(.horizontal,100)
        }
    }
}

#Preview {
    TogglePracticeView()
}

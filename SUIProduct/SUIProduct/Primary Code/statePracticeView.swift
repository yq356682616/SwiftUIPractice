//
//  statePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/29.
//

import SwiftUI

struct statePracticeView: View {
    @State var backgroundColor: Color = Color.green
    @State var myTitle:String = "My Title"
    @State var count: Int = 0
    var body: some View {
        ZStack{
            //background
            backgroundColor
                .ignoresSafeArea()
            //content
            VStack(spacing: 20,content: {
                Text("\(myTitle)")
                    .font(.title)
                Text("Count： \(count)")
                    .font(.headline)
                    .underline()
                HStack(spacing: 20,content: {
                    Button("Button 1") {
                        backgroundColor = .red
                        myTitle = "button 1 wa pressed"
                        count += 1
                    }
                    Button("button 2") {
                        backgroundColor = .purple
                        myTitle = "button 2 wa pressed"
                        count += 1
                    }
                })
            })
            .foregroundColor(.white)
        }

    }
}

#Preview {
    statePracticeView()
}

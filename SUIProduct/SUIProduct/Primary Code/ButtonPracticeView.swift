//
//  ButtonPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/29.
//

import SwiftUI

struct ButtonPracticeView: View {
    @State var title:String = "This is my Title"
    var body: some View {
        VStack {
            Text(title)
            Button("Press me!") {
                self.title = "Button was pressed"
            }
            .accentColor(.red)
            
            Button(action: {
                self.title = "Button #2 was pressed"
            }, label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal,20)
                    .background {
                        Color.blue
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                    }
            })
            
            Button(action: {
                self.title = "Button #2"
            }, label: {
                Circle()
                    .fill(.white)
                    .frame(width: 75,height: 75)
                    .shadow(radius: 10)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
            })
            Button(action: {
                self.title = "Finish"
            }, label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.gray)
                    .padding()
                    .padding(.horizontal,10)
                    .background(
                        Capsule()
                            .stroke(.gray, lineWidth: 2.0)
                    )
            })
        }
    }
}

#Preview {
    ButtonPracticeView()
}

//
//  SliderPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/3.
//

import SwiftUI

struct SliderPracticeView: View {
    @State var sliderValue: Double = 3
    @State var color: Color = .red
    var body: some View {
        VStack {
            Text("rating:")
            Text(
                String(format: "%.0f", sliderValue)      //"\(sliderValue)"
            )
            .foregroundStyle(color)
            //Slider(value: $sliderValue)
            //Slider(value: $sliderValue, in: 1...5)
            //Slider(value: $sliderValue, in: 1...5, step:1)
            Slider(value: $sliderValue,
                   in: 1...5,
                   step:1.0,
                   onEditingChanged: { _ in
                        color = .green
                   },
                   minimumValueLabel: 
                        Text("1")
                            .font(.headline)
                            .foregroundStyle(.orange)
                   ,
                   maximumValueLabel: Text("5"),
                   label: {
                        Text("Title")
                   }
            )
            .tint(.red)
        }
    }
}

#Preview {
    SliderPracticeView()
}

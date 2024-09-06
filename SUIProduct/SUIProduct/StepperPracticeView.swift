//
//  StepperPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/3.
//

import SwiftUI

struct StepperPracticeView: View {
    @State var stepperValue: Int = 10
    @State var widthIncrements:CGFloat = 0
    var body: some View {
        VStack {
            Stepper("Stepper:\(stepperValue)", value: $stepperValue)
                .padding(50)
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100 + widthIncrements,height: 100)
            Stepper("Stepper 2") {
                incrementWidth(amount: 10)
            } onDecrement: {
                incrementWidth(amount: -10)
            }

        }
    }
    func incrementWidth(amount: CGFloat){
        withAnimation(.easeInOut) {
            widthIncrements += amount
        }
    }
}

#Preview {
    StepperPracticeView()
}

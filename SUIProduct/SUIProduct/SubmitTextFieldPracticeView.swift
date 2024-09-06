//
//  SubmitTextFieldPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/6.
//

import SwiftUI

struct SubmitTextFieldPracticeView: View {
    @State private var text:String = ""
    var body: some View {
        TextField("Placeholder...", text: $text)
            .submitLabel(.route)
            .onSubmit {
                print("Something to the console!")
            }
    }
}

#Preview {
    SubmitTextFieldPracticeView()
}

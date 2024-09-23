//
//  AnyLayoutPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/11.
//

import SwiftUI

struct AnyLayoutPracticeView: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    var body: some View {
        VStack {
            Text("Horizontal: \(horizontalSizeClass.debugDescription)")
            Text("Vertical: \(verticalSizeClass.debugDescription)")
            
            
            let layout: AnyLayout = horizontalSizeClass == .compact ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
            layout{
                Text("Alpha")
                Text("Beta")
                Text("Gamma")
            }
//            if horizontalSizeClass == .compact{
//                VStack(content: {
//                    Text("Alpha")
//                    Text("Beta")
//                    Text("Gamma")
//                })
//            }else{
//                HStack(content: {
//                    Text("Alpha")
//                    Text("Beta")
//                    Text("Gamma")
//                })
//            }
        }
    }
}

#Preview {
    AnyLayoutPracticeView()
}

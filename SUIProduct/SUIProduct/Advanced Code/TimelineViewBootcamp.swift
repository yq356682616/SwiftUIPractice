//
//  TimelineViewBootcamp.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/25.
//

import SwiftUI

//秒级时间可做复杂的动画
struct TimelineViewBootcamp: View {
    
    @State private var startTime: Date = .now
    @State private var pauseAnimation: Bool = false
    var body: some View {
        VStack {
//            TimelineView(.animation(minimumInterval: 1, paused: pauseAnimation)) { context in
            TimelineView(.animation(minimumInterval: 0.01, paused: pauseAnimation)) { context in
                Text("\(context.date)")
                Text("\(context.date.timeIntervalSince1970)")
//                let seconds = Calendar.current.component(.second, from: context.date)
                let seconds = context.date.timeIntervalSince(startTime)
                Text("\(seconds)")
                
                if context.cadence == .live{
                    Text("Cadence: Live")
                }else if context.cadence == .minutes{
                    Text("Cadence: Minutes")
                }else if context.cadence == .seconds{
                    
                    Text("Cadence: Seconds")
                }
                Rectangle()
                    .frame(
                        width: seconds < 10 ? 50 : seconds < 30 ? 200 : 400,
                        height: 100)
                    .animation(.spring, value: seconds)
            }
            
            Button(pauseAnimation ? "Play" : "Pause") {
                pauseAnimation.toggle()
            }
        }
    }
}

#Preview {
    TimelineViewBootcamp()
}

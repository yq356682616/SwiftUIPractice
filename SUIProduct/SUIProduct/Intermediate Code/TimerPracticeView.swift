//
//  TimerPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/21.
//

import SwiftUI

struct TimerPracticeView: View {
    
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    //currrent Time
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    //Countdown
//    @State var count: Int = 10
//    @State var finishedText: String? = nil
    //Countdown to date
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    func updateTimeRamaining(){
        let remaining = Calendar.current.dateComponents([.minute,.second], from: Date(), to: futureDate)
        //let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(minute) minutes,\(second) seconds"
    }
    //Animation counter
    @State var count: Int = 1
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
//            Text(dateFormatter.string(from: currentDate))
//            Text(finishedText ?? "\(count)")
//            Text(timeRemaining)
//                .font(.system(size: 100,weight: .semibold, design: .rounded))
//                .foregroundStyle(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
            
            
//            HStack(spacing: 15.0) {
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 200)
//            .foregroundStyle(.white)
            
            TabView(selection:$count) {
                Rectangle()
                    .foregroundStyle(.red)
                    .tag(1)
                Rectangle()
                    .foregroundStyle(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundStyle(.green)
                    .tag(3)
                Rectangle()
                    .foregroundStyle(.orange)
                    .tag(4)
                Rectangle()
                    .foregroundStyle(.pink)
                    .tag(5)
            }
            .frame(height: 200)
            .tabViewStyle(.page)
            
        }
        .onReceive(timer) { _ in
//            if count <= 1{
//                finishedText = "Wow!"
//            }else{
//                count -= 1
//            }
            
//            updateTimeRamaining()
//            withAnimation(.easeInOut(duration: 0.5)) {
//                count = count == 3 ? 0 : count + 1
//            }
            withAnimation(.default) {
                count = count == 5 ? 0 : count + 1
            }
        }
    }
}

#Preview {
    TimerPracticeView()
}

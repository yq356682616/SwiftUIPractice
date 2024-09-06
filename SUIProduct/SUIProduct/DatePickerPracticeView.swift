//
//  DatePickerPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/3.
//

import SwiftUI

struct DatePickerPracticeView: View {
    @State var selectedDate:Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018))!
    let endingDate: Date = Date()
    var dateFormatter: DateFormatter{
        let formmatter = DateFormatter()
        formmatter.dateStyle = .short
        formmatter.timeStyle = .long
        return formmatter
    }
    var body: some View {
        VStack{
            Text("SELECTED DATE IS:")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            //        DatePicker("Select a Date", selection: $selectedDate,displayedComponents: [.date,.hourAndMinute])
                    DatePicker("Select a date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date,.hourAndMinute])
                        .tint(.red)
            //            .datePickerStyle(.graphical)
            //            .datePickerStyle(.wheel)
                        .datePickerStyle(.compact)
        }

    }
}

#Preview {
    DatePickerPracticeView()
}

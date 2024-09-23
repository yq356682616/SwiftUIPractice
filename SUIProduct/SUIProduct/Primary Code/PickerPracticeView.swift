//
//  PickerPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/3.
//

import SwiftUI

struct PickerPracticeView: View {
    @State var selection: String = "Most Recrnt"
    let filterOptions: [String] = [
        "Most Recrnt",
        "Most Popular",
        "Most Liked"
    ]
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    var body: some View {
        
//        Picker(selection: $selection) {
//            ForEach(filterOptions.indices, id: \.self) { index in
//                Text(filterOptions[index])
//                    .tag(filterOptions[index])
//            }
//        } label: {
//            Text("Picker")
//        }
//        .pickerStyle(.segmented)
        //.background(.red)

        //不管用
        Picker(selection: $selection) {
            ForEach(filterOptions, id: \.self) { option in
                HStack{
                    Text("\(option)")
                    Image(systemName: "heart.fill")
                }
                .tag(option)
            }
        } label: {
//            HStack{
//                Text("Fliter:")
//                Text(selection)
//            }
//            .font(.headline)
//            .foregroundStyle(.white)
//            .padding()
//            .padding(.horizontal)
//            .background(.blue)
//            .shadow(color: .blue.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,x: 0,y: 10)
        }
        .pickerStyle(.menu)
        .tint(.pink)

//        Menu {
//            ForEach(filterOptions, id: \.self) { option in
//                HStack(content: {
//                    Button("\(option)",systemImage: "heart.fill") {
//                        selection = option
//                    }
//                })
//            }
//        } label: {
//            HStack{
//                Text("Fliter:")
//                Text(selection)
//            }
//            .font(.headline)
//            .foregroundStyle(.white)
//            .padding()
//            .padding(.horizontal)
//            .background(.blue)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .shadow(color: .blue.opacity(0.3), radius: 10,x: 0,y: 10)
//        }
//        .menuStyle(.automatic)

//        VStack{
//            HStack{
//                Text("Age:")
//                Text(selection)
//            }
//            Picker(selection: $selection) {
//                ForEach(18..<100) { number in
//                    Text("\(number)").tag("\(number)")
//                        .font(.headline)
//                        .foregroundStyle(.red)
//                }
//            } label: {
//                Text("Picker")
//            }
//            .pickerStyle(.wheel)
//            //.background(.gray.opacity(0.3))
//        }
    }
}

#Preview {
    PickerPracticeView()
}

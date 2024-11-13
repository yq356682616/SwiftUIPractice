//
//  CustomBindingsBootcamp.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/25.
//

import SwiftUI

extension Binding where Value == Bool{
    init<T>(value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue{
                value.wrappedValue = nil
            }
        }
    }
    
}

struct CustomBindingsBootcamp: View {
    
    @State var title: String = "Start"
    
    @State private var errorTitle: String? = nil
//    @State private var showError: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
            ChildView(title: $title)
            ChildView2(title: title) { newTitle in
                title = newTitle
            }
            ChildView3(title: $title)
            
            ChildView3(title: Binding(get: {
                return title
            }, set: { newValue, _ in
                title = newValue
            }))
//            Text(showError.description)
            Button("CLICK ME!") {
                errorTitle = "NEW ERROR!!!!"
//                showError.toggle()
            }
        }
        .alert(errorTitle ?? "Error", isPresented: Binding(value: $errorTitle)) {
            Button("OK") {
                
            }
        }
//        .alert(errorTitle ?? "Error", isPresented: Binding(get: {
////            return errorTitle != nil ? true : false
//            errorTitle != nil
//        }, set: { newValue in
//            if !newValue{
//                errorTitle = nil
//            }
//        })) {
//            Button("OK") {
//                
//            }
//        }
        
//        .alert(errorTitle ?? "Error", isPresented: $showError) {
//            Button("OK") {
//                
//            }
//        }
    }
}

struct ChildView: View {
    
    @Binding var title: String
    var body: some View {
        Text(title)
            .onAppear {
//                title = "NEW TITLE"
            }
    }
}

struct ChildView2: View {
    let title: String
    let setTitle: (String) -> Void
    var body: some View {
        Text(title)
            .onAppear {
//                setTitle("NEW TITLE2")
            }
    }
}

struct ChildView3: View {
    
    var title: Binding<String>
    
    var body: some View {
        Text(title.wrappedValue)
            .onAppear {
//                title.wrappedValue = "NEW TITLE3"
            }
    }
}
#Preview {
    CustomBindingsBootcamp()
}

//
//  AddView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/13.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ListViewModel.self) var listViewModel: ListViewModel
    var textFieldBackgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(
                        Color(UIColor.secondarySystemBackground)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(alertTitle, isPresented: $showAlert) {}
    }
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3{
            alertTitle = "Your new todo item must be at least 3 characters long!!!😡🤬🤬"
            showAlert.toggle()
            return false
        }
        return true
    }
//    func getAlert() -> Alert{
//        return Alert(title: Text(alertTitle))
//    }
}

#Preview {
    NavigationStack {
        AddView()
            .preferredColorScheme(.light)
            .environment(ListViewModel())
    }
}
#Preview {
    NavigationStack {
        AddView()
            .preferredColorScheme(.dark)
            .environment(ListViewModel())
    }
}

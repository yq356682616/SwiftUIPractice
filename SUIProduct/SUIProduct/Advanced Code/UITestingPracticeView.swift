//
//  UITestingPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/21.
//

import SwiftUI

class UITestingBootcampViewModel: ObservableObject{
    let placeholderText: String = "Add name here..."
    @Published var textFieldText: String = ""
    @Published var currentUserisSignedIn: Bool
    
    init(currentUserisSignedIn: Bool) {
        self.currentUserisSignedIn = currentUserisSignedIn
    }
    func signUpButtonPressed(){
        guard !textFieldText.isEmpty else{return}
        currentUserisSignedIn = true
        
        
        
    }
}


struct UITestingPracticeView: View {
    
    @StateObject private var vm : UITestingBootcampViewModel
    init(currentUserisSignedIn: Bool){
        _vm = StateObject(wrappedValue: UITestingBootcampViewModel(currentUserisSignedIn: currentUserisSignedIn))
    }
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,.black]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            ZStack {
                if vm.currentUserisSignedIn{
                    SignedInHomeView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .trailing))
                }
                if !vm.currentUserisSignedIn{
                    signUpLayer
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
            }
        }
    }
}

#Preview {
    UITestingPracticeView(currentUserisSignedIn: true)
}
extension UITestingPracticeView{
    private var signUpLayer: some View{
        VStack {
            TextField(vm.placeholderText, text: $vm.textFieldText)
                .font(.headline)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .accessibilityIdentifier("SignUpTextField")
            Button {
                withAnimation(.spring()) {
                    vm.signUpButtonPressed()
                }
            } label: {
                Text("Sign up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .cornerRadius(10)
                    .accessibilityIdentifier("SignUpButton")
            }

        }
        .padding()
    }
}

struct SignedInHomeView: View {
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20.0) {
                Button {
                    showAlert.toggle()
                } label: {
                    Text("show welcome alert!")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(.red)
                        .cornerRadius(10)
                }
                .accessibilityIdentifier("ShowAlertButton")
                .alert(isPresented: $showAlert) {
                    return Alert(title: Text("Welcome to the app!"))
                }
                NavigationLink {
                    Text("Destination")
                } label: {
                    Text("Navigate")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
                .accessibilityIdentifier("NavigationLinkToDestination")

            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}

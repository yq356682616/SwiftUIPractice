//
//  OnboradingView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/5.
//

import SwiftUI
struct OnboradingView: View {
    //Onboarding State:
    /*
     0 - Welcome screen
     1 - Add name
     2 - Add age
     3 - Add gender
     */
    @State var onboradingState: Int = 0
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    //
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge:Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    var body: some View {
        ZStack{
            //content
            ZStack(content: {
                switch onboradingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameScection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(.green)
                }
            })
            //buttons
            VStack(content: {
                Spacer()
                bottomButton
            })
            .padding(30)
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
    }
}

#Preview {
    OnboradingView().background(.purple)
}
// MARK: COMPONENTS
extension OnboradingView{
    private var bottomButton: some View{
        Text(onboradingState == 0 ? "SIGN UP" :
                onboradingState == 3 ? "FINISH" : "NEXT")
            .font(.headline)
            .foregroundStyle(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    private var welcomeSection: some View{
        VStack(spacing: 40.0){
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200,height: 200)
                .foregroundStyle(.white)
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .overlay (
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundStyle(.white)
                    , alignment: .bottom
            )
            Text("This is the #1 app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI techniques")
                .fontWeight(.medium)
                .foregroundStyle(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addNameScection: some View{
        VStack(spacing: 40.0){
            Spacer()
            Text("What's your name?.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            TextField("Your name here...", text: $name)
                .font(.headline)
                .frame(height: 50)
                .padding(.horizontal)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View{
        VStack(spacing: 40.0){
            Spacer()
            Text("What's your age?.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Slider(
                value: $age,
                   in: 18...100,
                   step: 1
            )
            .tint(.white)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addGenderSection:some View{
        VStack(spacing: 40.0){
            Spacer()
            Text("What's your gender?.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Menu {
                Button("Male") {
                    gender = "Male"
                }
                Button("Female") {
                    gender = "Female"
                }
                Button("Non-Binary") {
                    gender = "Non-Binary"
                }

            } label: {
                Text(gender.count > 1 ? gender : "Select a gender")
                    .font(.headline)
                    .foregroundStyle(.purple)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

//            Picker(selection: $gender) {
//                Text("Male").tag("Male")
//                Text("Female").tag("Female")
//                Text("Non-Binary").tag("Non-Binary")
//            } label: {
//                Text(gender.count > 1 ? gender : "Select a gender")
//                    .font(.headline)
//                    .foregroundStyle(.purple)
//                    .frame(height: 55)
//                    .frame(maxWidth: .infinity)
//                    .background(.white)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//            }
//            .pickerStyle(.menu)

            Spacer()
            Spacer()
        }
        .padding(30)
    }
}
// MARK: FUNCTIONS
extension OnboradingView{
    func handleNextButtonPressed(){
        //GO TO NEXR SECTION
        switch onboradingState{
        case 1:
            guard name.count >= 3 else{
                showAlert(title:"Your name must be at least 3 characters long! 😤")
                return
            }
        case 3:
            guard gender.count > 1 else{
                showAlert(title: "Please select a gender before moving forward!😠")
                return
            }
            
        default:
            break
        }
        if onboradingState == 3{
            //sign in
            signIn()
        }else{
            withAnimation(.spring) {
                onboradingState += 1
            }
        }
    }
    func signIn(){
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.easeInOut) {
            currentUserSignedIn = true
        }
    }
    func showAlert(title:String){
        alertTitle = title
        showAlert.toggle()
    }
}

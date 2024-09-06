//
//  AlertPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/2.
//

import SwiftUI

struct AlertPracticeView: View {
    @State var showAlert:Bool = false
    @State var alertType:MyAlerts? = nil
    @State var backgroundColor: Color = .yellow
//    @State var alertTitle:String = ""
//    @State var alertMessage:String = ""
    enum MyAlerts{
        case success
        case error
    }
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea(.all)
            VStack {
                Button("button 1") {
                    alertType = .error
//                    alertTitle = "ERROR UPLOADING VIDEO"
//                    alertMessage = "The video could not be uploaded"
                    showAlert.toggle()
                }
                Button("button 2") {
                    alertType = .success
//                    alertTitle = "Successfully uploaded video 😀"
//                    alertMessage = "Your video is now public!"
                    showAlert.toggle()
                }
            }
            .alert(isPresented: $showAlert, content: {
                getAlert()
            })
        }
    }
    func getAlert()->Alert{
//        return Alert(title: Text("This is the title"),
//              message: Text("Here we will describe the error."),
//                     primaryButton: .destructive(Text("DELEDE"), action: {
//            backgroundColor = .red
//        }),
//              secondaryButton: .cancel())
//        return Alert(title: Text(alertTitle),
//                     message: Text(alertMessage),
//                     dismissButton: .default(Text("OK")))
        switch alertType {
        case .success:
            return Alert(title: Text("There wan an error!"))
        case .error:
            return Alert(title: Text("There wan a success!"),message: nil,dismissButton: .default(Text("OK"), action: {
                backgroundColor = .green
            }))
        case nil:
            return Alert(title: Text("ERROR"))
        }
    }
}

#Preview {
    AlertPracticeView()
}

//
//  MarkupsAndDocumentationPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/4.
//

import SwiftUI

struct MarkupsAndDocumentationPracticeView: View {
    
    //MARK: PROPERTIES
    @State var data: [String] = [
        "Apples",
        "Oranges",
        "Bananas"
    ]
    @State var showAlert: Bool = false
    
    //MARK: BODY
    
    // working copy - things to do 
    //1) fix title
    //2) fix alert
    //3) fix something else
    
    /*
    
     working copy - things to do
     1) fix title
     2) fix alert
     3) fix something else
     
     */
    
    
    var body: some View {
        NavigationStack {//START: NAV
            ZStack {
                //background
                Color.red.ignoresSafeArea(.all)
                //foreground
                foregroundLayer
                .navigationTitle("Documentation")
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("ALERT") {
                            showAlert.toggle()
                        }
                    }
                })
                .alert(isPresented: $showAlert, content: {
                    getAlert(text: "This is the alert!")
            })
            }
        }//END: NAV
    }
    /// This is the foreggroun layer tha holds a scrollView
    private var foregroundLayer:some View{
        ScrollView(content: {//START: SCROLLV
            Text("Hello")
            ForEach(data, id: \.self) { name in
                Text(name)
                    .font(.headline)
                
            }
        })//END: SCROLLV
    }
    //MARK: FUNCTIONS
    
    /// Gets an alert with a specified title
    ///
    ///This function created and returns an alert immediately.The alert will have a title base on the text parameter but it will NOT have a message
    ///```
    ///getAlert(text: "Hi") -> Alert(title: Text("Hi"))
    ///
    ///```
    /// - Warning: There os no additional message in this Alert
    /// - Parameter text: This is the title for the alert
    /// - Returns: Return an alert with a title
    func getAlert(text: String) -> Alert{
        return Alert(title: Text(text))
    }
}

#Preview {
    MarkupsAndDocumentationPracticeView()
}

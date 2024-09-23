//
//  ActionSheetPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/2.
//

import SwiftUI

struct ActionSheetPracticeView: View {
    @State var showActionSheet: Bool = false
    @State var actionSheetOption: ActionSheetOptions = .isOtherPost
    enum ActionSheetOptions{
        case isMyPost
        case isOtherPost
    }
    var body: some View {
        VStack {
            HStack(content: {
                Circle().frame(width: 30,height: 30)
                Text("@username")
                Spacer()
                Button(action: {
                    actionSheetOption = .isMyPost
                    showActionSheet.toggle()
                }, label: {
                    Image(systemName:"ellipsis")
                })
            })
            .padding(.horizontal)
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
            Spacer()
        }
//        .actionSheet(isPresented: $showActionSheet, content:getActionSheet)
        .confirmationDialog("This is a title", isPresented: $showActionSheet, titleVisibility: .visible) {
            let shareButton = Button("Share") {
                
            }
            let reprotButton = Button("reprot",role: .destructive) {
                
            }
            let deleteButton = Button("delete",role: .destructive) {
                
            }
            let cancelButton = Button("cancel", role: .cancel) {
                
            }
            switch actionSheetOption {
            case .isMyPost:
                shareButton
                reprotButton
                deleteButton
                cancelButton
            case .isOtherPost:
                shareButton
                reprotButton
                cancelButton
            }
        } message: {
            Text("This is a meaage")
        }

    }
    let button1: ActionSheet.Button = .default(Text("DEFAULT"))
    let button2: ActionSheet.Button = .destructive(Text("DESTRUCTIVE"))
    let button3: ActionSheet.Button = .cancel()
    func getActionSheet()->ActionSheet{
        let shareButton: ActionSheet.Button = .default(Text("Share")) {
            
        }
        let reprotButton: ActionSheet.Button = .destructive(Text("Report")) {
            
        }
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete")) {
            
        }
        let cancelButton: ActionSheet.Button = .cancel()
        let title = Text("What would you like to do?")
        switch actionSheetOption {
        case .isMyPost:
            return ActionSheet(title: title,
                               message: nil,
                               buttons: [shareButton,reprotButton,deleteButton,cancelButton])
        case .isOtherPost:
            return ActionSheet(title: title,
                               message: nil,
                               buttons: [shareButton,reprotButton,cancelButton])
        }
//        return ActionSheet(title: Text("This is a title"))
//        return ActionSheet(title: Text("This is a title"),
//                           message: Text("This is a meaage"),
//                           buttons: [button1,button1,button1,button1,button2,button3])
    }
}

#Preview {
    ActionSheetPracticeView()
}

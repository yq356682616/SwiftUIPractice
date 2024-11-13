//
//  SUIProductApp.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/8/22.
//
/*
 MVVM Architecture
    
 Model - data point
 
 
 */
import SwiftUI

@main
struct SUIProductApp: App {
    
//    @State var listViewModel: ListViewModel = ListViewModel()
    let currentUserIsSignedIn: Bool
    init(){
//        let userIsSignIn: Bool = CommandLine.arguments.contains("-UITest_startSignedIn") ? true : false
        self.currentUserIsSignedIn = ProcessInfo.processInfo.arguments.contains("-UITest_startSignedIn") ? true : false
//        let value = ProcessInfo.processInfo.environment["-UITest_startSignedIn"]
//        let userIsSignedIn: Bool = value == "true" ? true : false
//        self.currentUserIsSignedIn = userIsSignedIn
    }
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
//            NavigationStack {
//                ListView()
//            }
//            .environment(listViewModel)
//            GeometryReaderPractiveView()
//            LocalNotificationPracticeView()
//            WeakSelfPracticeView()
//            CodablePracticeView()
//            DownloadWithEscapingPracticeView()
//            DownloadWithCombinePracticeView()
//            DownloadingPracticeView()
//            UITestingPracticeView(currentUserisSignedIn: currentUserIsSignedIn)
//            CloudKitUserBootcamp()
//            PropertyWrapperBootcamp()
//            PropertyWrapper2Bootcamp()
            
            LocationView()
                .environmentObject(vm)
        }
    }
}

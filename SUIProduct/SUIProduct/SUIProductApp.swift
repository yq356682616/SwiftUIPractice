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
            DownloadingPracticeView()
        }
    }
}

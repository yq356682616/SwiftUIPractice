//
//  LocalNotificationPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/19.
//

import SwiftUI
import UserNotifications
import CoreLocation
class NotificationManager{
    static let instance = NotificationManager()
    
    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert,.sound,.badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error{
                print("Error :\(error)")
            }else{
                print("Success")
            }
            
        }
    }
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification!"
        content.subtitle = "This was soooo easy!"
        content.sound = .default
        content.badge = 1
        
        // time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        // calender
//        var dateComponents = DateComponents()
//        dateComponents.hour = 11
//        dateComponents.minute = 36
//        dateComponents.weekday = 1
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        // location
        let coordinates = CLLocationCoordinate2D(latitude: 48.00,
                                     longitude: 50.00)
        let region = CLCircularRegion(center: coordinates,
                                      radius: 100,
                                      identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = true
        let trigger = UNLocationNotificationTrigger(region: region,repeats: true)
        
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
struct LocalNotificationPracticeView: View {
    var body: some View {
        VStack(spacing: 40.0) {
            Button("Request parmission") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule notification") {
                NotificationManager.instance.scheduleNotification()
            }
            Button("Cancel notification") {
                NotificationManager.instance.cancelNotification()
            }
        }
        .onAppear(perform: {
            UNUserNotificationCenter.current().setBadgeCount(0)
        })
    }
}

#Preview {
    LocalNotificationPracticeView()
}

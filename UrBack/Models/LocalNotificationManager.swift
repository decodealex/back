//
//  LocalNotificationManager.swift
//  UrBack
//
//  Created by Oleksandr Kovalyshyn on 21.08.2019.
//  Copyright © 2019 Oleksandr Kovalyshyn. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationManager {
    var notifications = [String]()
    
    func listScheduledNotifications() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { notifications in
            for notification in notifications {
                print(notification)
            }
        }
    }
    
    private func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            
            if granted == true && error == nil {
                self.scheduleNotifications()
            }
        }
    }
    
    func schedule() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            
            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization()
            case .authorized, .provisional:
                self.scheduleNotifications()
            default:
                break // Do nothing
            }
        }
    }
    
    private func scheduleNotifications() {

            let center = UNUserNotificationCenter.current()
            let content      = UNMutableNotificationContent()
            content.title    = "Title l"
            content.body     = "body doby"
            content.sound    = .default

//            var dateComponents = DateComponents()
//            dateComponents.hour = 12
//            dateComponents.minute = 56
//            dateComponents.second = 15
//
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)

            UNUserNotificationCenter.current().add(request) { error in

                guard error == nil else { return }

                print("Notification scheduled! --- ID = \(dateComponents)")
            }
    }
}

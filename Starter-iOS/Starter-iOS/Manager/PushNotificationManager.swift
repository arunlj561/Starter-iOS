//
//  PushNotificationManager.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 4/13/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

struct PushNotificationManager {
    static func allowToPushNotification() {
        let application = UIApplication.shared
        
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            
            
            
            
            center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                
                guard error == nil else {
                    //Display Error.. Handle Error.. etc..
                    return
                }
                
                if granted {
                    
                    application.registerForRemoteNotifications()
                }
                else {
                    //Handle user denying permissions..
                }
            }
            
            //Register for remote notifications.. If permission above is NOT granted, all notifications are delivered silently to AppDelegate.
            application.registerForRemoteNotifications()
        }
        else {
            let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
        }

    }
    
    static func sendDeviceToken(_ deviceToken: String) {
        AppData.save(.DeviceToken, value: deviceToken)
    }
    
    static func handlePushNotification(_ userInfo: [AnyHashable: Any], state: UIApplicationState) {
        switch state {
        case .inactive:
            // Launch via push notification
            break
        case .active:
            break
        case .background:
            break
        }
    }

    
}

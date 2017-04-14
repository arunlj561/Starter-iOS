//
//  AppDelegate.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 3/1/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import UserNotifications
import  UserNotificationsUI



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if AppData.get(.FirstLaunch) == nil {
            // First launching
            AppData.save(.FirstLaunch, value: false )
        } else {
            if AppData.get(.IsLoggedIn) == nil{
                // Take to Login Screen
            }else{
                User.loadUser()
                // Take to Home screen
            }
            RealmManager.migrate()
        }
        
        // Launch via push notification
        if let launch = launchOptions {
            if let userInfo = launch[UIApplicationLaunchOptionsKey.remoteNotification] as? [AnyHashable: Any] {
                PushNotificationManager.handlePushNotification(userInfo, state: application.applicationState)
            }
        }
        
        App.setupDefaultAppearance()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        application.applicationIconBadgeNumber = 0
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    
    }
    
    // MARK:- PUSH NOTIFICATION DELEGATES
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        PushNotificationManager.handlePushNotification(userInfo, state: application.applicationState)
    }
    
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        application.registerForRemoteNotifications()
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        PushNotificationManager.sendDeviceToken(deviceTokenString)
    }
    
    // MARK : Did Receive notiifcation iOS 10.0
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        PushNotificationManager.handlePushNotification(response.notification.request.content.userInfo, state: UIApplication.shared.applicationState)
    }

    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        PushNotificationManager.handlePushNotification(notification.request.content.userInfo, state: UIApplication.shared.applicationState)
    }

}


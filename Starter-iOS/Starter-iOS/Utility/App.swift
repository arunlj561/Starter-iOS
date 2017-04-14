//
//  App.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 4/13/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import UIKit
struct App {
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
 
    
    static let bundleID = Bundle.main.bundleIdentifier!
    static let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    static let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    
    struct AppColor {
        static let main = UIColor.red
    }
    
    struct Font {
        static func main(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        static func subtitle(size: CGFloat) -> UIFont {
            return UIFont(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        static func description(size: CGFloat) -> UIFont {
            return UIFont(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
    
    
    static func setupDefaultAppearance() {
        // Icon color on Nav
        
        UINavigationBar.appearance().tintColor = AppColor.main
        
        // Text color on Nav
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: AppColor.main]
        
        // Text color (UIButton & UIAlertView & ...)
//        UIView.appearance().tintColor = Color.main
    }
    
}

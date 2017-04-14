//
//  AppData.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 4/13/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
struct AppData {
    fileprivate static let userDefaults = UserDefaults.standard
    
    static func save(_ key: AppDataKey, value: Any) {
        userDefaults.set(value, forKey: key.rawValue)
        userDefaults.synchronize()
    }
    
    static func get<T>(_ key: AppDataKey) -> T? {
        return userDefaults.object(forKey: key.rawValue) as? T
    }
    
}

enum AppDataKey: String {
    case DeviceToken
    case FirstLaunch
    case IsLoggedIn
}

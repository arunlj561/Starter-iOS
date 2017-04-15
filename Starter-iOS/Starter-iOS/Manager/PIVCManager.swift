//
//  Starter - iOSManager.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/18/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit


class PIVCManager: NSObject {
    var currentUser : User?
    static let sharedInstance: PIVCManager = {
        
        var sharedInstance:PIVCManager = PIVCManager()
        
       return sharedInstance
    }()
    
    required convenience public init(coder decoder: NSCoder) {
        self.init()
    }
    
    
}

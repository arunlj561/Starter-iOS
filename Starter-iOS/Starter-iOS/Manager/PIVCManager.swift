//
//  Starter - iOSManager.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/18/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import AutoCoding

class PIVCManager: NSObject {
    var currentUser : User?
    static let sharedInstance: PIVCManager = {
        
        var sharedInstance:PIVCManager = PIVCManager()
        
       return sharedInstance
    }()
    
    required convenience public init(coder decoder: NSCoder) {
        self.init()
    }
    
    class func save(){
      
        
        self.write(toFile:Utils.filePath(file: "/PIVC").path , atomically: true  )
    }
}

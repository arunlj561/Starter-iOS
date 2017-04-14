//
//  Employee.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 4/13/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
import ObjectMapper

class Employee: Object{
    
    dynamic var userID : String?
    dynamic var firstName : String?
    dynamic var lastname : String?
    
     override static func primaryKey() -> String?{
        return "userID"
    }
    
    required convenience init?(map: Map) {
        self.init()
        mapping(map: map)
    }
}

extension Employee {
    static func getAll()  {
        
    }
}

extension Employee : Mappable {
   
    func mapping(map: Map) {
        userID    <- map["userID"]
        firstName <- map["firstName"]
        lastname  <- map["lastname"]
    }

}

//
//  UserData.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/27/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import ObjectMapper


class User : NSObject, Mappable{
    
    var agentId : String?
    var name : String?
    var mobileNo : Int?
    var authString : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return User()
    }
    required init?(map: Map){
        super.init()
    }
    private override init(){
        super.init()
    }
    
    func mapping(map: Map)
    {
        agentId <- map["agentId"]
        name <- map["name"]
        mobileNo <- map["mobileNo"]
        authString <- map["authString"]
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
        agentId = aDecoder.decodeObject(forKey: "agentId") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        mobileNo = aDecoder.decodeObject(forKey: "mobileNo") as? Int
        authString = aDecoder.decodeObject(forKey: "authString") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc override func encode(with aCoder: NSCoder)
    {
        if agentId != nil{
            aCoder.encode(agentId, forKey: "agentId")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if mobileNo != nil{
            aCoder.encode(mobileNo, forKey: "mobileNo")
        }
        
        if authString != nil {
            aCoder.encode(authString, forKey: "authString")
        }
        
    }
    
    class func loadUser(){
        let keychain = KeychainWrapper()
        PIVCManager.sharedInstance.currentUser = keychain.myObject(forKey: "CurrentUser") as! User?
    }
    
    
    func saveUser(){
        let keychain = KeychainWrapper()
        keychain.mySetObject(self, forKey: "CurrentUser")
        keychain.writeToKeychain()
    }
    


    
}

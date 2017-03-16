//
//  Policy.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/30/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//


import Foundation
import ObjectMapper


class Policy : NSObject, Mappable{
    
    var advisorName : String?
    var custId : String?
    var custName : String?
    var policyName : String?
    var policyNumber : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return Policy()
    }
    required init?(map: Map){
        super.init()
    }
    private override init(){
        super.init()
    }

    
    func mapping(map: Map)
    {
        advisorName <- map["advisorName"]
        custId <- map["custId"]
        custName <- map["custName"]
        policyName <- map["policyName"]
        policyNumber <- map["policyNumber"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
        advisorName = aDecoder.decodeObject(forKey: "advisorName") as? String
        custId = aDecoder.decodeObject(forKey: "custId") as? String
        custName = aDecoder.decodeObject(forKey: "custName") as? String
        policyName = aDecoder.decodeObject(forKey: "policyName") as? String
        policyNumber = aDecoder.decodeObject(forKey: "policyNumber") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    
    @objc override func encode(with aCoder: NSCoder)
    {
        if advisorName != nil{
            aCoder.encode(advisorName, forKey: "advisorName")
        }
        if custId != nil{
            aCoder.encode(custId, forKey: "custId")
        }
        if custName != nil{
            aCoder.encode(custName, forKey: "custName")
        }
        if policyName != nil{
            aCoder.encode(policyName, forKey: "policyName")
        }
        if policyNumber != nil{
            aCoder.encode(policyNumber, forKey: "policyNumber")
        }
        
    }
    
}

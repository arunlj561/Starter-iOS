//
//	RootClass.swift
//
//	Create by Arun Jangid on 27/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class RootClass : NSObject, Mappable{

    var data : [String : Any]?
	var msg : String?
	var status : String?


	class func newInstance(map: Map) -> Mappable?{
		return RootClass()
	}
    
	required init?(map: Map){
        super.init()
    }
	private override init(){
        super.init()
    }

	func mapping(map: Map)
	{
		data <- map["data"]
		msg <- map["msg"]
		status <- map["status"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
        super.init(coder: aDecoder)!
         data = aDecoder.decodeObject(forKey: "data") as? [String : Any]
         msg = aDecoder.decodeObject(forKey: "msg") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc override func encode(with aCoder: NSCoder)
	{
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if msg != nil{
			aCoder.encode(msg, forKey: "msg")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}

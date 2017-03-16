//
//  APIHandler.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/30/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import Alamofire

class APIHandler{
    
    
    class func loginUser(username:String, password:String, withSuccess success:@escaping(_ res:User)->() )  {
        Manager.sharedInstance.requesrtURLwithKeypath(url:  APIRouter.loginUser(params: ["username" : username, "password": password])) { (response : User) in
            success(response)
        }
    }
    
    class func registerUser(param:Parameters, withSuccess success:@escaping(_ res:User)->()) {
        Manager.sharedInstance.requesrtURLwithKeypath(url: APIRouter.registerUser(parameters: param)) { (userRegistered:User) in
            success(userRegistered)
        }
    }
    
    class func fetchUserPolicy(param: Parameters, withSuccess success:@escaping(_ policy: Policy) -> ()){
        Manager.sharedInstance.requesrtURLwithKeypath(url: APIRouter.fetchPolicy(parmeters: param)) { (policy:Policy) in
            success(policy)
        }
    }
    
    class func sendUserSignature(param: Parameters, withSuccess success:@escaping(_ signature: RootClass) -> ()) {
        Manager.sharedInstance.requestUrl(url: APIRouter.sendSignature(params: param)) { (rootClass:RootClass) in
            success(rootClass)
        }
    }
    
}

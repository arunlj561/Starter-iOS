//
//  APIHandler.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/30/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import Alamofire

class LoginHandler{
    
    
    class func loginUser(username:String, password:String, withSuccess success:@escaping(_ res:User)->() )  {
        
        NetworkManager.sharedInstance.requesrtURLwithKeypath(url: LoginRouter.loginUser(params: ["username" : username, "password": password]), withSuccess: { (response:User) in
            success(response)
        }, withFailure: { (err:Error) in
           print("Failure")
        })
    }
    
    class func registerUser(param:Parameters, withSuccess success:@escaping(_ res:User)->()) {
        NetworkManager.sharedInstance.requesrtURLwithKeypath(url: LoginRouter.registerUser(parameters: param), withSuccess: { (userRegistered:User) in
            success(userRegistered)
        }, withFailure: { (err:Error) in
            print("Failure")
        })
    }
    
    class func fetchUserPolicy(param: Parameters, withSuccess success:@escaping(_ policy: Policy) -> ()){
        NetworkManager.sharedInstance.requesrtURLwithKeypath(url: LoginRouter.fetchPolicy(parmeters: param), withSuccess: { (policy:Policy) in
            success(policy)
        }, withFailure: { (err:Error) in
            print("Failure")
        })
    }
    
    class func sendUserSignature(param: Parameters, withSuccess success:@escaping(_ signature: RootClass) -> ()) {
        NetworkManager.sharedInstance.requestUrl(url: LoginRouter.sendSignature(params: param), withSuccess: { (rootClass:RootClass) in
            success(rootClass)
        }, withFailure: { (err:Error) in
            print("Failure")
        })
    }
    
}

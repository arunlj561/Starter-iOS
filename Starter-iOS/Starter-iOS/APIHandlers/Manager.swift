//
//  Manager.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/24/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import Reqres

class Manager: SessionManager {
    static let sharedInstance: Manager = Manager()
    static let manager: Manager = {
        let configuration = Reqres.defaultSessionConfiguration()
        let manager = Manager(configuration: configuration)
        
        return manager
    }()
    
    func requestUrl<T:Mappable>(url: URLRequestConvertible, withSuccess success:@escaping (_ response: T) -> ()) {
        Utils.addHUD()
    
        Alamofire.request(url).validate().responseObject { (response :DataResponse<T>) in
            Utils.hideHUD()
            guard response.result.isSuccess else{
                Utils.showAlert(message: (response.result.error?.localizedDescription)!, action: {
                    
                })
                return
            }
            let root:RootClass = response.result.value as! RootClass
            if root.status  == "Fail"{
                Utils.showAlert(message: (root.msg!), action: {
                    
                })
            }else{
                
                success(response.result.value!)
            }
        }
        
     
    }
    
    func requesrtURLwithKeypath<T:Mappable>(url:URLRequestConvertible, withSuccess success:@escaping (_ response:T) -> () ){
        Utils.addHUD()
        Alamofire.request(url).responseObject(queue: nil, keyPath: "data", mapToObject: nil, context: nil) { (response:DataResponse<T>) in
            Utils.hideHUD()
            guard response.result.isSuccess else{
                Utils.showAlert(message: (response.result.error?.localizedDescription)!, action: {
                    
                })
                return
            }
            guard (response.result.value?.toJSON().count)! > 0 else{
                Utils.showAlert(message:"Error, please try again", action: {
                    
                })
                return
            }
            
            
           success(response.result.value!)
            
        }
    }
    
    func requesrtURLwithKeypathForArray<T:Mappable>(keypath:String,forURL url:URLRequestConvertible, withSuccess success:@escaping (_ response:[T]) -> () ){
        Alamofire.request(url).responseArray(queue: nil, keyPath: keypath, context: nil) { (response :DataResponse<[T]>) in
            Utils.hideHUD()
            guard response.result.isSuccess else{
                Utils.showAlert(message: (response.result.error?.localizedDescription)!, action: {
                    
                })
                return
            }
            guard (response.result.value?.first?.toJSON().count)! > 0 else{
                Utils.showAlert(message:"Error, please try again", action: {
                    
                })
                return
            }
            
            
            success((response.result.value)!)
            
            
            
        }
    }

    
    func requestUrlForArrayResponse<T:Mappable>(url: URLRequestConvertible, withSuccess success:@escaping (_ response: [T]) -> ()) {
        Utils.addHUD()
        Alamofire.request(url).responseArray { (response:DataResponse<[T]>) in
            Utils.hideHUD()
//            print(“response.result.isSuccess \(response.result.isSuccess)“)
            guard response.result.isSuccess else{
                Utils.showAlert(message: (response.result.error?.localizedDescription)!, action: {
                    
                })
                return
            }
            
            success(response.result.value!)
            
        }
        
        
    }
    
    
}

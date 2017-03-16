//
//  Utils.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/18/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
import HexColors


class Utils{
    
    struct topView {
      static let topController = UIApplication.shared.windows.first
    }
    
    struct filePath {
        let file : String
        var path : String {
          return   (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first?.appending(file))!
        }
    }
    
   class func showAlert(title:String?, message:String , buttonTitle:String,  controller:UIViewController, shouldDismiss:Bool, action:@escaping ()->())  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonTitle, style: .default) { (act:UIAlertAction) in
            if shouldDismiss == true{
                alertController.dismiss(animated: true, completion: nil)
            }
            action()
        })
        
        topView.topController?.rootViewController?.present(alertController, animated: true, completion: nil)
  
    }
    
   class func showAlert(title:String, message:String , buttonTitle:String, cancelButton:String, controller:UIViewController, shouldDismiss:Bool, action:@escaping ()->())  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonTitle, style: .default) { (act:UIAlertAction) in
            if shouldDismiss == true{
                alertController.dismiss(animated: true, completion: nil)
            }
            action()
        })
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (act:UIAlertAction) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        
        topView.topController?.rootViewController?.present(alertController, animated: true, completion: nil)
        
    }
    
   class  func showAlert(message: String, action:@escaping ()->()){
        showAlert(title: "", message: message, buttonTitle: "Okay", controller: (topView.topController?.rootViewController)!, shouldDismiss: true) {
                action()
        }
    }
    
    class func addHUD(){
        MBProgressHUD.showAdded(to: topView.topController!, animated: true)
    }
    
    class func hideHUD() {
        MBProgressHUD.hide(for: topView.topController!, animated: true)
    }
    
    class func showHUDwithText(text:String){
       let hud = MBProgressHUD.showAdded(to: topView.topController!, animated: true)
        hud.label.text = text
    }
    
    
    
}

extension UIColor{
//    class func hexColor(rgba: String) -> UIColor {
//        return hx_color(withHexRGBAString: rgba)!
//    }
}

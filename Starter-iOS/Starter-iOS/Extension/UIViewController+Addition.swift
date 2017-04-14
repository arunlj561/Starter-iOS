//
//  UIViewController.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 4/13/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func setBackBarTitle(_ title: String = "") {
        let backButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButtonItem
    }
    
    func setBackBarImage(_ image:String = ""){
        let backButtonItem = UIBarButtonItem(image: UIImage(named: image), style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButtonItem
    }
    
    

    
}

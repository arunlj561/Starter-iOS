//
//  PresentFilterViewController.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 4/15/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit

class PresentFilterViewController: BaseViewController {

    // DECLARE HANDLER FROM WHERE YOU NEED TO SEND DATA
    // STRING CAN BE REPLACED BY ANY OBJECT WHAT YOU WANT TO SEND
    var actionHandler : ((String) -> ())!
    var cancelHandler : ((String) -> ())!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionApply(_ sender: Any) {
        // DECLARE HANDLER
        actionHandler("Apply Tapped")
        self.dismiss(animated: true, completion: nil)
        
    }

    @IBAction func actionCancel(_ sender: Any) {
        // DECLARE HANDLER
        cancelHandler("Cancel Tapped")
        self.dismiss(animated: true, completion: nil)
    }
    

}

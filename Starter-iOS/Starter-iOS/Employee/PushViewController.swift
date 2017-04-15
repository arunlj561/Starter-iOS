//
//  PushViewController.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 4/15/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit

class PushViewController: BaseViewController {

    var actionHandler : ((String) -> ())!
    var cancelHandler : ((String) -> ())!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    @IBAction func actionApply(_ sender: UIButton) {
        // DECLARE HANDLER
         actionHandler("Apply Tapped")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionCancel(_ sender: Any) {
        // DECLARE HANDLER
        cancelHandler("Cancel Tapped")
        self.navigationController?.popViewController(animated: true)
    }

}

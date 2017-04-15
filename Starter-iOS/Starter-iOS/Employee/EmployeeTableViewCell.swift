//
//  ExampleTableViewCell.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 3/22/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelText: UILabel!
    var buttonHandler: ((String, Employee) -> ())!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    var _datasource:Employee?
    
    var datasource:Employee {
        get {
            return self.datasource
        }
        set {
            
            _datasource = newValue
            labelText.text = newValue.firstName
        }    
    }
    
    
    @IBAction func actionButton(_ sender: Any) {
        self.buttonHandler("Success", _datasource!)
    }
}

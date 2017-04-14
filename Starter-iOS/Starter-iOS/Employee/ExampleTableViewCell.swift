//
//  ExampleTableViewCell.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 3/22/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit

class ExampleTableViewCell: UITableViewCell {

    @IBOutlet weak var labelText: UILabel!
    var buttonHandler: ((String, User) -> ())!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var _datasource:User?
    
    var datasource:User {
        get {
            return self.datasource
        }
        set {
            
            _datasource = newValue
            labelText.text = newValue.authString
        }
        
    }
    @IBAction func actionButton(_ sender: Any) {
        self.buttonHandler("Success", _datasource!)
    }
}

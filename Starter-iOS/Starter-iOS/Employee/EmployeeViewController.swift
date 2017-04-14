//
//  ViewController.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 3/1/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController {

    var datasource = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PhotoManager.runIfAuthorized(self) { info in
            
        }
        PhotoManager().openCamera("", sourceType: .photoLibrary, controller: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController : UITableViewDelegate{
    
    
}

extension ViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ExampleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ExampleTableViewCell", for: indexPath) as! ExampleTableViewCell
        
        cell.datasource = datasource[indexPath.row]
        
        cell.buttonHandler = { button, userData in
            
        }
        return cell
    }
}

// MARK :
extension ViewController {
    
}

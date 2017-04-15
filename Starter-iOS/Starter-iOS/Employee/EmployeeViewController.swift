//
//  ViewController.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 3/1/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import ObjectMapper

class EmployeeViewController: UIViewController {

    @IBOutlet weak var employeeTableView: UITableView!
    var datasource = [Employee]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasource.append(Employee(map: Map(mappingType: .fromJSON, JSON: ["userID":"12","firstName":"John","lastName":"Doe"]))!)
        datasource.append(Employee(map: Map(mappingType: .fromJSON, JSON: ["userID":"12","firstName":"Rocky","lastName":"Romeo"]))!)
        
        // UNCOMMENT THIS TO OPEN PHOTO GALLERY
        /*
        PhotoManager.runIfAuthorized(self) { info in
            
        }
        PhotoManager().openCamera("", sourceType: .photoLibrary, controller: self)
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "PresentFilterViewController"?:
            let destinationNav: UINavigationController = segue.destination as! UINavigationController
            
            let destinationVC:PresentFilterViewController = destinationNav.topViewController as! PresentFilterViewController
            
            // UNLESS YOU DEFINE HANDLER IT WILL CRASH ON ANY BUTTON TAP
            destinationVC.actionHandler = { info in
                // DO WHATEVER YOU WANT TO DO
                print(info)
            }
            
            destinationVC.cancelHandler = { info in
                // DO WHATEVER YOU WANT TO DO
                print(info)
                
            }
            break
        case "PushViewController"?:
            let destinationVC:PushViewController = segue.destination as! PushViewController
            
            // UNLESS YOU DEFINE HANDLER IT WILL CRASH ON ANY BUTTON TAP
            destinationVC.actionHandler = { info in
                // DO WHATEVER YOU WANT TO DO
                print(info)
            }
            // UNLESS YOU DEFINE HANDLER IT WILL CRASH ON ANY BUTTON TAP
            destinationVC.cancelHandler = { info in
                // DO WHATEVER YOU WANT TO DO
                print(info)
                
            }
            break
        default:
            break
        }
    }
}

extension EmployeeViewController : UITableViewDelegate{
    
    
}

extension EmployeeViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EmployeeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
        
        cell.datasource = datasource[indexPath.row]
        
        
        cell.buttonHandler = { data, userData in
            print(data)
            print(userData)
        }
        return cell
    }
}

// MARK :
extension EmployeeViewController {
    
}

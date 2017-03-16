//
//  MenuTableViewController.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/23/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.instatiateView(controllerName: AppConstants.MenuList.NavFetchPolicyViewController.rawValue)
            break
        default:
            self.instatiateView(controllerName: AppConstants.MenuList.NavFetchPolicyViewController.rawValue)
            break
        }
    }
    
    func instatiateView(controllerName:String){
        self.frostedViewController.contentViewController =
        self.storyboard?.instantiateViewController(withIdentifier: controllerName)
        self.frostedViewController.hideMenuViewController()
    }
   
   
}

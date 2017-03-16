//
//  HomeViewController.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/23/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import Foundation
import REFrostedViewController

class HomeViewController: REFrostedViewController {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: AppConstants.StoryBoardID.NavFetchPolicyViewController.rawValue)
        self.menuViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: AppConstants.StoryBoardID.MenuTableViewController.rawValue)
        self.limitMenuViewSize = true
        self.menuViewSize = CGSize(width: (UIScreen.main.bounds.size.width * 0.8), height: UIScreen.main.bounds.size.height)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }    
}

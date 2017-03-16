//
//  BaseViewController.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/18/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import RxSwift

struct datasource<T> {
    var items = [T]()
    mutating func  additems(item:T)  {
        items.append(item)
    }
}
class BaseViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        var intData = 5
        withUnsafeMutablePointer(to: &intData) { ( p)  in
            
        }
        
        
        
        
    }
    
    func ptrFromAddress(p:UnsafeMutablePointer<Int>) -> UnsafeMutablePointer<Int>
    {
        return p
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")

        self.navigationController?.navigationBar.tintColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func toggleDrawer(){
        self.frostedViewController.presentMenuViewController()
    }
    

}

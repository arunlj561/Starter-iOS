//
//  SignUpTableViewController.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/19/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ObjectMapper

class SignUpTableViewController: BaseTableViewController {

    let disposeBag = DisposeBag()
    
    @IBOutlet var firstName:UITextField!
    @IBOutlet var lastName:UITextField!
    @IBOutlet var mobileNo:UITextField!
    @IBOutlet var agentID:UITextField!
    @IBOutlet var email:UITextField!
    @IBOutlet var password:UITextField!
    @IBOutlet var confirmPassword:UITextField!
    
    @IBOutlet var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emailValid = email.rx.text.orEmpty
            .map{ $0.isValidEmail() == true}
        .shareReplay(1)
        
        emailValid.bindTo(mobileNo.rx.isEnabled)
        .addDisposableTo(disposeBag)
        
        let mobileCount = mobileNo.rx.text.orEmpty
            .map{ self.isValidMobileNo(text: $0) == true}
            .shareReplay(1)
        
        mobileCount.bindTo(password.rx.isEnabled)
        .addDisposableTo(disposeBag)
        
        
        
        let passwordValid = password.rx.text.orEmpty
            .map{$0.isValidPassword() == true}
            .shareReplay(1)
        
        passwordValid
            .bindTo(confirmPassword.rx.isEnabled)
            .addDisposableTo(disposeBag)
        
        let confirmPasswordValid = confirmPassword.rx.text.orEmpty
            .map{$0 == self.password.text && $0.characters.count > 2}
            .shareReplay(1)
        
        confirmPasswordValid.bindTo(submitButton.rx.isEnabled)
            .addDisposableTo(disposeBag)
        
        
        submitButton.rx.tap
            .subscribe(onNext: {[weak self] in self?.actionSignUpUser((self?.submitButton!)!) })
            .addDisposableTo(disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
     func actionSignUpUser(_ sender: UIButton) {
        
        APIHandler.registerUser(param: ["name":firstName.text! + lastName.text!,
                                        "agentId" : agentID.text!,
                                        "mobileNo": mobileNo.text!]) { (registedUser:User) in
                PIVCManager.sharedInstance.currentUser = registedUser
                PIVCManager.sharedInstance.currentUser?.saveUser()
        }
        
        
    }
    
    func isValidMobileNo(text:String) -> Bool{
        if text.characters.count == 10{
            agentID.becomeFirstResponder()
            return true
        }
        return false
    }
   
}

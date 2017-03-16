//
//  LoginViewController.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/18/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import UIKit
import Alamofire
import RxCocoa
import RxSwift



class LoginViewController: BaseViewController {

    @IBOutlet var forgotButton: UIButton!
    @IBOutlet var password: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var signUpButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Create observable
        let loginTextValid = username.rx.text.orEmpty
            .map{ $0.isValidEmail() == true}
            .shareReplay(1)
        
        //Binding or subscribing if above condition is valid do below step
        loginTextValid
            .bindTo(password.rx.isEnabled)
            .addDisposableTo(disposeBag)

        
        let passwordCountValid = password.rx.text.orEmpty
            .map{ $0.isValidPassword() == true}
            .shareReplay(2)
        
        passwordCountValid
        .bindTo(loginButton.rx.isEnabled)
        .addDisposableTo(disposeBag)
        
        
        // Observer for text in Login Field
        let loginT = username
            .rx
            .text
            .throttle(0.01, scheduler: MainScheduler.instance)
            .map { self.setupTextObserver(text: $0!) }
        
        loginT
            .subscribe(onNext: { $0})
            .addDisposableTo(disposeBag)
        
        let passwordTextValid = password
            .rx
            .text.throttle(0.01, scheduler:MainScheduler.instance)
            .map{ self.passwordTextObserver(text: $0!) }
        
        passwordTextValid
            .subscribe(onNext: {$0})
            .addDisposableTo(disposeBag)
    
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in self?.actionLoginUser((self?.loginButton)!) })
            .addDisposableTo(disposeBag)

        
        forgotButton
            .rx
            .tap
            .subscribe(onNext: {[weak self] in self?.actionForgotPassword((self?.forgotButton)!)}).addDisposableTo(disposeBag)
        
        signUpButton.rx.tap
            .subscribe(onNext: {[weak self] in self?.actionSignUp((self?.signUpButton)!)}).addDisposableTo(disposeBag)
        

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //To make login 
    
    func actionLoginUser(_ sender: UIButton) {
        
        APIHandler.loginUser(username: username.text!, password: password.text!) { (logedUser:User) in
            PIVCManager.sharedInstance.currentUser = logedUser
            PIVCManager.sharedInstance.currentUser?.saveUser()
            self.performSegue(withIdentifier: AppConstants.StoryBoardID.OTPVerifyViewController.rawValue, sender: logedUser)
        }
        
    }
    
    func actionSignUp(_ sender : UIButton){
        self.performSegue(withIdentifier: AppConstants.StoryBoardID.SignUpTableViewController.rawValue, sender: self)
    }
    
    //
    func setupTextObserver(text:String){
        print("\(text)")
    }
    
    func passwordTextObserver(text:String){
        print("\(text)")
    }
    

    func actionForgotPassword(_ sender :UIButton){
        let  alert = UIAlertController(title: "Forgot Password", message: "Enter AgentID", preferredStyle: .alert)
    
        alert.addTextField { (text :UITextField) in
            text.placeholder = "Enter AgentID here"
        }
        alert.addAction(UIAlertAction(title: "SUBMIT", style: .default, handler: { (action:UIAlertAction) in
            self.performSegue(withIdentifier: AppConstants.StoryBoardID.OTPVerifyViewController.rawValue, sender: self)

        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action :UIAlertAction) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == AppConstants.StoryBoardID.SignUpTableViewController.rawValue {
            
        }
        
        if segue.identifier == AppConstants.StoryBoardID.OTPVerifyViewController.rawValue{
          
        }
    }
    
    
}



    

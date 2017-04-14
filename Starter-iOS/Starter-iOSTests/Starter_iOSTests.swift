//
//  Starter_iOSTests.swift
//  Starter-iOSTests
//
//  Created by Arun Jangid on 4/11/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import XCTest
import Pods_Starter_iOS

class Starter_iOSTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
        
        
    }
    
    func testPasswordValid() {
        let password = "ArunJ0770!"
        XCTAssert(self.isValidPass(password), "Valid password")
        
    }
    
    func testPasswordShortLength(){
        let passOne = "arunlj"
        XCTAssert(self.isValidPass(passOne), "Password length too short")
    }
    
    
    func testPasswordOnlyCharcters(){
        let passOne = "arunljaj"
        XCTAssert(self.isValidPass(passOne), "Password Contains only characters")
    }
    
    func testPasswordOnlyNumbers(){
        let passOne = "12345678"
        XCTAssert(self.isValidPass(passOne), "Password Contains only Numbers")
    }
    
    func testPasswordCombinationNoUppercaseLetterAndNumber(){
        let passOne = "arunlj1234"
        XCTAssert(self.isValidPass(passOne), "Password Contains Combination with all lower case")
    }
    
    func testPasswordCombinationUpperLetterAndNumber(){
        let passOne = "ARUNLJ1234"
        XCTAssert(self.isValidPass(passOne), "Password Contains Combination with all upper case")
    }
    
    func testPassword(){
        let passOne = "ARUnJ1234!"
        XCTAssert(self.isValidPass(passOne), "Password Valid")
    }

    
    func testEmail(){
        XCTAssert(self.isValidEmail(email: "arunlj561"), "Email is not valid")
    }
    
    func testEmailWithoutHostName(){
        XCTAssert(self.isValidEmail(email: "arunlj561@"), "Email is not valid, Does Not contain host name")
    }
    
    func testEmailWithoutLettersAfterDot(){
        XCTAssert(self.isValidEmail(email: "arunlj561@gmail"), "Email is not valid, Does Not contain host name")
    }
    
    func testEmailCorrect(){
        XCTAssert(self.isValidEmail(email: "arunlj561@gmail.com"), "Email is not valid, Does Not contain host name")
    }
    
    func testPerformanceExample() {
        self.measure {
            
        }
    }
    
    func isValidPass(_ pass :String) -> Bool {
        let upperCaseChars = NSCharacterSet(charactersIn: "ABCDEFGHIJKLKMNOPQRSTUVWXYZ")
        let lowerCaseChars = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
        
        //Too Long or too short
        if  pass.characters.count < 8 || pass.characters.count > 20{
            return false
        }
        
        var rang = pass.rangeOfCharacter(from: .letters)
        if rang == nil {
            //No letters, please Enter combination of characters & numbers
            print("No letters, please Enter combination of characters & numbers")
            return false
        }
        
        rang = pass.rangeOfCharacter(from: .decimalDigits)
        
        if rang == nil {
            print("No Numbers.Please Enter Combination of Character & Number")
            return false
        }
        
        rang = pass.rangeOfCharacter(from: upperCaseChars as CharacterSet)
        
        if rang == nil {
            print(")No UpperCase.Please Enter Combination of Upper & Lower Case")
            return false
        }
        
        rang = pass.rangeOfCharacter(from: lowerCaseChars as CharacterSet)
        if rang == nil{
            print( "No UpperCase.Please Enter Combination of Upper & Lower Case")
            return false
        }
        
        return true
    }
    
    func isValidEmail(email :String) -> Bool{
        let validString = "[A-Za-z]{1}[A-Za-z0-9-].+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", validString)
        return emailTest.evaluate(with: email)

    }
    
}

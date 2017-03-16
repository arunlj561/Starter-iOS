//
//  StringExtension.swift
//  Starter - iOS
//
//  Created by Arun Jangid on 1/19/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func isValidPassword() -> Bool {
        let upperCaseChars = NSCharacterSet(charactersIn: "ABCDEFGHIJKLKMNOPQRSTUVWXYZ")
        let lowerCaseChars = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
        
        //Too Long or too short
        if  self.characters.count < 8 || self.characters.count > 20{
            return false
        }
        
        var rang = self.rangeOfCharacter(from: .letters)
        if rang == nil {
            //No letters, please Enter combination of characters & numbers
            print("No letters, please Enter combination of characters & numbers")
            return false
        }
        
        rang = self.rangeOfCharacter(from: .decimalDigits)
        
        if rang == nil {
            print("No Numbers.Please Enter Combination of Character & Number")
            return false
        }
        
        rang = self.rangeOfCharacter(from: upperCaseChars as CharacterSet)
        
        if rang == nil {
            print(")No UpperCase.Please Enter Combination of Upper & Lower Case")
            return false
        }
        
        rang = self.rangeOfCharacter(from: lowerCaseChars as CharacterSet)
        if rang == nil{
                      print( "No UpperCase.Please Enter Combination of Upper & Lower Case")
            return false
        }
        
        return true
    }
    
    func isValidEmail() -> Bool{
        let validString = "[A-Za-z]{1}[A-Za-z0-9-].+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", validString)
        return emailTest.evaluate(with: self)
    }

    func localized() -> String  {
       return NSLocalizedString(self, comment: "")
    }
    
    func letterize() -> [String] {
        return self.characters.map { String($0) }
    }
    
    static func getTimeStamp() -> String{
        return Date().timeIntervalSince1970.description.components(separatedBy: ".").first!
    }
    
    static func encodeImageToString(_ image: UIImage) -> String{
        return (UIImageJPEGRepresentation(image, 0.5)?.base64EncodedString(options: .lineLength64Characters))!
    }
    
    func decodeImageAndSave() -> String{
        let writeImage = Data(base64Encoded: self, options: .ignoreUnknownCharacters)!
        let filePath = "/" + String.getTimeStamp() + ".jpg"
        guard (try? writeImage.write(to:URL(fileURLWithPath: Utils.filePath(file: filePath).path))) != nil else {
            print("Error While Saving Image")
            return ""
        }
        return filePath
    }

   static func getBasicAuthorizationFor(_ username:String, password:String) -> String{
    
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: .lineLength64Characters)
        
        return "Basic \(base64Credentials)"
    }
    
    

}

//
//  Utilities.swift
//  customauth
//
//  Created by Christopher Ching on 2019-05-09.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import Foundation
import UIKit
import Amplify
import AmplifyPlugins

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 2.0
        button.tintColor = UIColor.white
    }
    
    static func styleFilledTextField(_ textfield:UITextView) {
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
//        // Remove border on text field
//        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.layer.cornerRadius = 25
        button.tintColor = UIColor.systemGreen
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    // Check if field is filled or not
    static func fieldData(_ field: UITextField) ->String {
        return field.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    //    Return Error Message or nil
    static func validateFields(_ fieldsToCheck: Array<UITextField>) -> String? {
        //        Check if all are filled
        for field in fieldsToCheck[1..<fieldsToCheck.count] {
            if Utilities.fieldData(field) == ""{
                return "Please fill all fields"
            }
        }
        return nil
    }
    
//    
//    static func findifOnline() -> Bool {
//        _ = Amplify.Auth.fetchAuthSession { result in
//                switch result {
//                case .success(let session):
//                    print("Is user signed in - \(session.isSignedIn)")
//                    return session.isSignedIn
//                case .failure(let error):
//                    print("Fetch session failed with error \(error)")
//                }
//            }
//    }
}

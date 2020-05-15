//
//  Utilities.swift
//  customauth
//
//  Created by Christopher Ching on 2019-05-09.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        textfield.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 1.00, alpha: 1.00)
        textfield.layer.cornerRadius = 20
        textfield.borderStyle = .roundedRect
        
        // Create the bottom line
        //let bottomLine = CALayer()
        
        //bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        //bottomLine.backgroundColor = UIColor(red: 0.17, green: 0.87, blue: 0.54, alpha: 1.00).cgColor
        
        //Remove border on text field
        //textfield.borderStyle = .none
        
        // Add the line to the text field
        //textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor(red: 0.17, green: 0.87, blue: 0.54, alpha: 1.00)
        button.layer.cornerRadius = 20
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1.00).cgColor
        button.layer.cornerRadius = 20
        button.tintColor = UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1.00)
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}

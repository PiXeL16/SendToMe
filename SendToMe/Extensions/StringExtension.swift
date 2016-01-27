//
//  StringExtensions.swift
//  SendToMe
//
//  Created by Chris Jimenez on 1/26/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation

// MARK: - Util extension for strings
extension String
{
    
    /**
     Validated if the string is a valid email address
     
     - returns: valid email or not
     */
    public func isValidEmail() -> Bool
    {
        //Valid email reg expresion
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        //Create the predicate with the expresion
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        //Check the value of the string
        return emailTest.evaluateWithObject(self)
    }
    

    /// Returns the localized string value
    var localized: String {
            return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
    

}


//
//  EmailDataStorage.swift
//  SendToMe
//
//  Created by Chris Jimenez on 1/26/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation

/// Simple data storage using NSUserDefault to store the email value set
public struct EmailDataStorage {
    
    let defaults = NSUserDefaults.init(suiteName: "group.com.greenpixels.sendtome")
    
    public init(){}
    
    private enum StorageKeys{
        
        static let emailKey = "SendToMeEmail"
    }
    
    /// Has saved an email address/
    public var hasEmailSaved :Bool{
        
        return !getEmail().isEmpty
    }
    
    
    /**
     Returns the email value saved
     
     - returns: <#return value description#>
     */
    public func getEmail() -> String{
        
        var emailValue = ""
        if let email = defaults?.stringForKey(StorageKeys.emailKey) {
            emailValue = email
        }
        return emailValue
    }
    
    
    
    /**
     Save an email value in the local storage
     
     - parameter email: email value
     */
    public func saveEmail(email:String){
        
        defaults?.setValue(email, forKey: StorageKeys.emailKey)
        
        defaults?.synchronize()
        
        print("Email \(email) saved")
    }
    
    
    /**
     Clear the value of the email in the storage
     */
    public func clearEmail()
    {
    
        defaults?.removeObjectForKey(StorageKeys.emailKey)
        
        print("Email cleared")
    }
    
}

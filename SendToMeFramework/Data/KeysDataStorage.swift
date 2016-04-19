//
//  KeysDataStorage.swift
//  SendToMe
//
//  Created by Christopher Jimenez on 4/19/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

/// Simple data storage using NSUserDefault to store the email value set
public struct KeysDataStorage {
    
    let defaults = NSUserDefaults.init(suiteName: "group.com.greenpixels.sendtome")
    
    public init(){}
    
    private enum StorageKeys{
        
        static let mailgunApiKey = "MailgunApiKey"
        static let clientDomainKey = "ClientDomainKey"
    }
    
    public func getMailgunApiKey() -> String{
        
        var mailgunApiKey = ""
        if let mailgunApi = defaults?.stringForKey(StorageKeys.mailgunApiKey) {
            mailgunApiKey = mailgunApi
        }
        return mailgunApiKey
    }
    
    public func saveMailgunApiKey(mailgunApi:String){
        
        defaults?.setValue(mailgunApi, forKey: StorageKeys.mailgunApiKey)
        
        defaults?.synchronize()
        
        print("Mailgun API saved")
    }
    
    
    public func getClientDomain() -> String{
        
        var clientDomain = ""
        if let domain = defaults?.stringForKey(StorageKeys.clientDomainKey) {
            clientDomain = domain
        }
        return clientDomain
    }
    
    public func saveClientDomainKey(clientDomain:String){
        
        defaults?.setValue(clientDomain, forKey: StorageKeys.clientDomainKey)
        
        defaults?.synchronize()
        
        print("Client Domain API saved")
    }
    
    
    
}

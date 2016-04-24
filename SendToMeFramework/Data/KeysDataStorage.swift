//
//  KeysDataStorage.swift
//  SendToMe
//
//  Created by Christopher Jimenez on 4/19/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

/// Simple data storage using NSUserDefault to store the email value set
public struct KeysDataStorage {
    
        /// Domain to be shared
    let defaults = NSUserDefaults.init(suiteName: "group.com.greenpixels.sendtome")
    
    public init(){}
    
        /// Storage keys
    private enum StorageKeys{
        
        static let mailgunApiKey = "MailgunApiKey"
        static let clientDomainKey = "ClientDomainKey"
    }
    
    /**
     Gets the mailgun api key previously saved
     
     - returns: mailgun api key
     */
    public func getMailgunApiKey() -> String{
        
        var mailgunApiKey = ""
        if let mailgunApi = defaults?.stringForKey(StorageKeys.mailgunApiKey) {
            mailgunApiKey = mailgunApi
        }
        return mailgunApiKey
    }
    
    /**
     Saves the Mailgun Api key
     
     - parameter mailgunApi: mailgun APi key
     */
    public func saveMailgunApiKey(mailgunApi:String){
        
        defaults?.setValue(mailgunApi, forKey: StorageKeys.mailgunApiKey)
        
        defaults?.synchronize()
        
        print("Mailgun API saved")
    }
    
    
    /// Has an Mailun Api key saved
    public var hasMailgunApiKeySaved: Bool{
        
        return !getMailgunApiKey().isEmpty
        
    }
    
    /**
     Clear the value of the email in the storage
     */
    public func clearMailgunKey()
    {
        
        defaults?.removeObjectForKey(StorageKeys.mailgunApiKey)
        
        print("mailgun API cleared")
    }
    
    
    /**
     Gets the client domain key
     
     - returns: client domain key previously saved
     */
    public func getClientDomain() -> String{
        
        var clientDomain = ""
        if let domain = defaults?.stringForKey(StorageKeys.clientDomainKey) {
            clientDomain = domain
        }
        return clientDomain
    }
    
    /**
     Saves the client domain key
     
     - parameter clientDomain: client domain key
     */
    public func saveClientDomainKey(clientDomain:String){
        
        defaults?.setValue(clientDomain, forKey: StorageKeys.clientDomainKey)
        
        defaults?.synchronize()
        
        print("Client Domain API saved")
    }
    
    
        /// Variable to know if we have a domain client saved or not
    public var hasClientDomainSaved: Bool{
        
        return !getClientDomain().isEmpty
    }
    
    /**
     Clear the value of the email in the storage
     */
    public func clearClientDomain()
    {
        
        defaults?.removeObjectForKey(StorageKeys.mailgunApiKey)
        
        print("client domain API cleared")
    }
    
    
    
}

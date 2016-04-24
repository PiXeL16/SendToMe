//
//  EmailDataStorageSpecs.swift
//  SendToMe
//
//  Created by Chris Jimenez on 1/26/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import Nimble
import Quick
import SendToMeFramework

class KeysDataStorageSpecs: QuickSpec {
    
    override func spec() {
        
        let keysStorage = KeysDataStorage()
        let apiKey = "testest1234"
        let domain = "testtest.com"
        
        it("save and gets api key succesfully"){
            
            
            keysStorage.saveMailgunApiKey(apiKey)
            
            expect(keysStorage.hasMailgunApiKeySaved).to(beTruthy())
            expect(keysStorage.getMailgunApiKey()).to(equal(apiKey))
            
            keysStorage.clearMailgunKey()
        }
        
        it("saves and gets domain succesfully")
        {
            
            keysStorage.saveClientDomainKey(domain)
            
            expect(keysStorage.hasClientDomainSaved).to(beTruthy())
            expect(keysStorage.getClientDomain()).to(equal(domain))
            
            keysStorage.clearClientDomain()
            
        }
        
    }
    
}

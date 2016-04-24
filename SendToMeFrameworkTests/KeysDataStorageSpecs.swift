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
        
        it("save and gets api key succesfully"){
            
            
            keysStorage.saveMailgunApiKey(apiKey)
            
            expect(keysStorage.hasMailgunApiKeySaved).to(beTruthy())
            expect(keysStorage.getMailgunApiKey()).to(equal(apiKey))
            
            keysStorage.clearMailgunKey()
        }
        
//        it("clear saved email succesfuly")
//        {
//            
//            emailStorage.saveEmail(email)
//            
//            expect(emailStorage.hasEmailSaved).to(beTruthy())
//            
//            emailStorage.clearEmail()
//            
//            expect(emailStorage.hasEmailSaved).to(beFalsy())
//        }
        
        
    }
    
}

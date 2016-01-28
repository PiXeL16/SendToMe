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

class EmailDataStorageSpecs: QuickSpec {
    
    override func spec() {
        
        let emailStorage = EmailDataStorage()
        let email = "test@test.com"
        
        it("save email and get email succesfully"){
            
            
            emailStorage.saveEmail(email)
            
            expect(emailStorage.hasEmailSaved).to(beTruthy())
            expect(emailStorage.getEmail()).to(equal(email))
            
            emailStorage.clearEmail()
        }
        
        it("clear saved email succesfuly")
            {
                
                emailStorage.saveEmail(email)
                
                expect(emailStorage.hasEmailSaved).to(beTruthy())
                
                emailStorage.clearEmail()
                
                expect(emailStorage.hasEmailSaved).to(beFalsy())
        }
        
        
    }
    
}

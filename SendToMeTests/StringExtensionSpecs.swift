//
//  StringExtensionSpecs.swift
//  SendToMe
//
//  Created by Chris Jimenez on 1/26/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import Nimble
import Quick
import SendToMe

class StringExtensionSpecs: QuickSpec{
    
    override func spec() {
        
        it("email is valid"){
            
            let email: String  = "test@test.com"
            
            expect(email.isValidEmail()).to(beTruthy())
        }
        
        it("email is invalid")
        {
            let email:String = "test.com"
            
            expect(email.isValidEmail()).to(beFalse())
                
        }
        
        it("text is correctly localized")
        {
            let text = "app_name".localized
            
            expect(text).to(equal("Send to Me"))
        }
        
    }
    
    
}

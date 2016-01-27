//
//  DelayerSpecs.swift
//  SendToMe
//
//  Created by Chris Jimenez on 1/27/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import Nimble
import Quick
import SendToMe

//Specs for the delayer class
class DelayerSpecs: QuickSpec {
    
    override func spec() {
        
        let timeout: NSTimeInterval = 3
        
        it("delays for 2 seconds"){
            
            var value = false
            
            Delayer.delay(2, closure: { () -> () in
                value = true
            })
            
            expect(value).toEventually(beTruthy(),timeout:timeout)
        }
    }

}

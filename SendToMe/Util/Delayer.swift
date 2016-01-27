//
//  Delayer.swift
//  SendToMe
//
//  Created by Chris Jimenez on 1/26/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation

//Small util to suply a delayer to be use arround classes when needed
public class Delayer {
    
    /**
     Delays a call to a closure by your seconds
     
     - parameter delay:   Seconds to delay the call of the closure
     - parameter closure: closure to be call
     */
    public class func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

}

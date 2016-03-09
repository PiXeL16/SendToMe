//
//  Keys.swift
//  SendToMe
//
//  Created by Chris Jimenez on 1/30/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import  Keys

public struct Keys
{
    
    public static let keys = SendtomeKeys();
    public static let mailgunApiKey = keys.mailgun_api()
    public static let fromEmail = keys.from_email()
    
    public static let clientDomain = "mg.sendtomeapp.com"
    
    
}

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
    public static let mandrill_api_key = keys.mandrill_api_key()
    public static let from_email = keys.from_email_address()
    
}

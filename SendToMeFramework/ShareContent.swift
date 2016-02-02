//
//  ShareContent.swift
//  SendToMe
//
//  Created by Chris Jimenez on 1/30/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation

//Share content with the information to share of the content
public struct ShareContent {
    
    //Title of the URL to share
    public let title:String?
    //URL to share
    public let url:String?
    
    public init(title:String?, url:String?)
    {
        self.title = title
        self.url = url
    }
    
}

//
//  ShareContent.swift
//  SendToMe
//
//  Created by Chris Jimenez on 1/30/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation

//Class that will contain information about the sharing content
public struct ShareContent {
    
    //Title of the URL to share
    let title:String?
    //URL to share
    let url:String?
    
    public init(title:String?, url:String?)
    {
        self.title = title
        self.url = url
    }
    
}

//
//  EmailBuilder.swift
//  SendToMe
//
//  Created by Chris Jimenez on 1/30/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import SwiftMailgun
import SendToMeFramework

/// Email builder that will build the email object based on the sharing content
public class EmailBuilder
{
    
    /**
     Builds the email object based on the sharing content
     
     - parameter sharingContent: sharing content
     
     - returns: returns email object
     */
    public class func buildEmailWithSharingContent(sharingContent:ShareContent, comment:String?)->MailgunEmail
    {
        let emailObject = MailgunEmail()
        let emailDataStorage = EmailDataStorage()
        
        var emailSubject = "app_name".localized
        
        //If we got a title use that for the email subject if not use the app name
        if let urlTitle = sharingContent.title
        {
            emailSubject  = urlTitle
        }
        else if let comment = comment where !comment.isEmpty
        {
            emailSubject = comment
        }
        
        emailObject.to = emailDataStorage.getEmail()
        emailObject.subject = emailSubject
        emailObject.from = "Send to Me <\(Keys.fromEmail)>"
        emailObject.html = "<i>\(comment!)</i></br>\(sharingContent.url!)"
        
        return emailObject
    }
    
}
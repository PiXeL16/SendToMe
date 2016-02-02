//
//  EmailBuilder.swift
//  SendToMe
//
//  Created by Chris Jimenez on 1/30/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import SwiftMandrill
import SendToMeFramework

/// Email builder that will build the email object based on the sharing content
public class EmailBuilder
{
    
    /**
     Builds the email object based on the sharing content
     
     - parameter sharingContent: sharing content
     
     - returns: returns email object
     */
    public class func buildEmailWithSharingContent(sharingContent:ShareContent, comment:String?)->MandrillEmail
    {
        let emailObject = MandrillEmail()
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
        
        let mandrillTo = MandrillTo(email: emailDataStorage.getEmail())
        
        emailObject.to = [mandrillTo]
        emailObject.subject = emailSubject
        emailObject.from = Keys.from_email
        emailObject.fromName = "app_name".localized
        emailObject.html = "\(comment!)</br>\(sharingContent.url!)"
        
        return emailObject
    }
    
}
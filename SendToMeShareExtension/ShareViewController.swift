//
//  ShareViewController.swift
//  SendToMeShareExtension
//
//  Created by Chris Jimenez on 1/27/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import UIKit
import Social
import SendToMeFramework
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title  = "Send to Me"
      
        self.loadPreviewView()
        
        
        
    }
    
    override func loadView(){
        
        super.loadView()
        
        //Sets the textview placeholder
        self.placeholder = "Add a comment to your email"
        
        //Clear the default sharing text
        self.textView.text = ""
        //Hacking way of making the textview think we did a backspace so it shows the placeholder, for seome reason it wont show with out this
        self.textView.replaceRange(self.textView.selectedTextRange!, withText: "")
        
        
    }
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        // Reset Post button text. //Kind of ugly...
        for item in (self.navigationController?.navigationBar.items)! {
            if let rightItem = item.rightBarButtonItem {
                rightItem.title = "Send"
                break
            }
        }
        
        
    }

    override func didSelectPost() {
        
        
        let emailDataStorage = EmailDataStorage()
        
        guard emailDataStorage.hasEmailSaved else
        {
           exitWithErrorAndShowMessage ("email_saved_error".localized)
           return
        }
        
        if let item = extensionContext?.inputItems.first as? NSExtensionItem {
            
            let contentExtractor = ShareContentExtractor()
            
            do
            {
                try contentExtractor.extractContentFromNSExtensionItem(item){ shareContent in
                
                    if let shareContent = shareContent
                    {
                        
                        print(shareContent)
                        
                         self.extensionContext!.completeRequestReturningItems([], completionHandler: nil)
                        
                    }else
                    {
                        self.exitWithErrorAndShowMessage ("data_extraction_error".localized)
                       
                        
                    }
                }
            }catch
            {
                self.exitWithErrorAndShowMessage ("data_extraction_error".localized)
            }

        }
        
        super.didSelectPost()
    }
    
    /**
     Exit an show error message
     
     - parameter message: error message to show
     */
    func exitWithErrorAndShowMessage(message:String)
    {
        
        let alert = UIAlertController(title: "Send to Me", message:message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: { (action: UIAlertAction!) -> () in self.extensionContext!.cancelRequestWithError(NSError(domain: message, code: 0, userInfo: nil)) }))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    override func configurationItems() -> [AnyObject]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}

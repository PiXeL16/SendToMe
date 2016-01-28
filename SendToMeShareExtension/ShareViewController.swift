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
        
    }
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        // Reset Post button text.
        for item in (self.navigationController?.navigationBar.items)! {
            if let rightItem = item.rightBarButtonItem {
                rightItem.title = "Send"
                break
            }
        }
        
        
    }

    override func didSelectPost() {
        

        
//        if let item = extensionContext?.inputItems.first as? NSExtensionItem {
//            if let itemProvider = item.attachments?.first as? NSItemProvider {
//                if itemProvider.hasItemConformingToTypeIdentifier("public.url") {
//                    itemProvider.loadItemForTypeIdentifier("public.url", options: nil, completionHandler: { (url, error) -> Void in
//                        if let shareURL = url as? NSURL {
//                            
//                            print(shareURL)
//                            // send url to server to share the link
//                        }
////                        self.extensionContext?.completeRequestReturningItems([], completionHandler:nil)
//                    })
//                }
//            }
//        }
        
        if let item = extensionContext?.inputItems.first as? NSExtensionItem {
            if let itemProvider = item.attachments?.first as? NSItemProvider {
                let propertyList = String(kUTTypePropertyList)
                if itemProvider.hasItemConformingToTypeIdentifier(propertyList) {
                    
                    itemProvider.loadItemForTypeIdentifier(propertyList, options: nil, completionHandler: { (item, error) -> Void in
                                        let dictionary = item as! NSDictionary
                                        NSOperationQueue.mainQueue().addOperationWithBlock {
                                            let results = dictionary[NSExtensionJavaScriptPreprocessingResultsKey] as! NSDictionary
                                            let titleString = results["title"] as? String
                                            let urlString = results["currentUrl"] as? String
                                            
                                            print(titleString)
                                            print(urlString)
                                            
                                        }
                                    })
                }
                
            }
        }

        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext!.completeRequestReturningItems([], completionHandler: nil)
    }

    override func configurationItems() -> [AnyObject]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}

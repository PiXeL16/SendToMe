//
//  ShareContentExtractor.swift
//  SendToMe
//
//  Created by Chris Jimenez on 1/30/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import MobileCoreServices

//Class in charge of extracting content of URL and pages using the extensionContext inputItems
public class ShareContentExtractor{
    
    
    //Error Type
    enum ExtractorError:ErrorType{
        case NoContent
        case ExtractionError(description:String)
    }
    
    /**
     Extract the content from a ExtentionItem
     
     - parameter extentionItem:     Extention Item
     - parameter completionHandler: Response Closure
     */
    public func extractContentFromNSExtensionItem(extentionItem:NSExtensionItem, completionHandler:(ShareContent?) -> Void) throws -> Void
        
    {
        
        if let itemProvider = extentionItem.attachments?.first as? NSItemProvider {
            let propertyList = String(kUTTypePropertyList)
            if itemProvider.hasItemConformingToTypeIdentifier(propertyList) {
                
                return extractPropertyList(itemProvider, completionHandler: completionHandler)
                
            }
            else if itemProvider.hasItemConformingToTypeIdentifier("public.url") {
                
                 return extractPublicUrl(itemProvider, completionHandler: completionHandler)
            }
            else
            {
                throw ExtractorError.NoContent
            }
        }
    }
    
    /**
     Extract the information of the item provider if it has a property list(Website)
     
     - parameter itemProvider:      item provider
     - parameter completionHandler: completion handler
     */
    public func extractPropertyList(itemProvider:NSItemProvider, completionHandler:(ShareContent?) -> Void) -> Void
    {
        let propertyList = String(kUTTypePropertyList)
        
        itemProvider.loadItemForTypeIdentifier(propertyList, options: nil, completionHandler: { (item, error) -> Void in
            
            
            let dictionary = item as! NSDictionary
            NSOperationQueue.mainQueue().addOperationWithBlock {
                if let results = dictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary {
                    
                    let titleString = results["title"] as? String
                    let urlString = results["currentUrl"] as? String
                    
                    let shareContent = ShareContent(title:titleString, url: urlString)
                    
                    return completionHandler(shareContent)
                }else{
                    return completionHandler(nil)
                }
            }
        })
    }
    
    
    /**
     Extract the public url of an item provider
     
     - parameter itemProvider:      itemProvider with the url content
     - parameter completionHandler: completion handler
     */
    public func extractPublicUrl(itemProvider:NSItemProvider, completionHandler:(ShareContent?) -> Void) -> Void
    {
        itemProvider.loadItemForTypeIdentifier("public.url", options: nil, completionHandler: { (url, error) -> Void in
            if let shareURL = url as? NSURL {
                
                let urlString = shareURL.absoluteString
                
                let shareContent = ShareContent(title:nil, url: urlString)
                
                return completionHandler(shareContent)
                
            }
            else
            {
                 return completionHandler(nil)
            }
        })
    }
    
    
}

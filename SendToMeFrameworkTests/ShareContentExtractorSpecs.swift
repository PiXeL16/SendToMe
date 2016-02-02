//
//  ShareContentExtractorSpecs.swift
//  SendToMe
//
//  Created by Chris Jimenez on 2/1/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import Nimble
import Quick
import SendToMeFramework
import MobileCoreServices

//Specs of the share content extractor
class ShareContentExtractorSpecs: QuickSpec{
    
    override func spec() {
        
        let shareContentExtractor = ShareContentExtractor()
         let timeout: NSTimeInterval = 2
        
        it("its share content valid property list"){
            
            let extentionItem = NSExtensionItem()
            
            //Creates teh property list
            let itemProvider = NSItemProvider(item: [NSExtensionJavaScriptPreprocessingResultsKey:["title":"test","currentUrl":"www.test.com"]], typeIdentifier: kUTTypePropertyList as String)
            
            //Add the attachments
            extentionItem.attachments = [itemProvider]
            
            var result:ShareContent? = nil

            do{
            try shareContentExtractor.extractContentFromNSExtensionItem(extentionItem){ shareContent in
                
                    result = shareContent
            }
            }catch{}
            
            expect(result).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.title).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.url).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.url).toEventually(equal("www.test.com"))
            expect(result!.title).toEventually(equal("test"))
        }
        
        
        it("its share content invalid property list"){
            
            let extentionItem = NSExtensionItem()
            
            //Creates teh property list
            let itemProvider = NSItemProvider(item: ["test":"test"], typeIdentifier: kUTTypePropertyList as String)
            
            //Add the attachments
            extentionItem.attachments = [itemProvider]
            
            var result:ShareContent? = ShareContent(title: "", url: "")
            
            do{
                try shareContentExtractor.extractContentFromNSExtensionItem(extentionItem){ shareContent in
                    
                    result = shareContent
                }
            }catch{}
            
            expect(result).toEventually(beNil(),timeout:timeout)
            
        }
        
        
        it("its share content valid url"){
            
            let extentionItem = NSExtensionItem()
            
            //Creates teh property list
            let itemProvider = NSItemProvider(item: NSURL(string:"www.apple.com"), typeIdentifier:ShareContentExtractor.ExtractionTypes.PublicURL.rawValue)
            
            //Add the attachments
            extentionItem.attachments = [itemProvider]
            
            var result:ShareContent? = nil
            
            do{
                try shareContentExtractor.extractContentFromNSExtensionItem(extentionItem){ shareContent in
                    
                    result = shareContent
                }
            }catch{}
            
            expect(result).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.url).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.url).toEventually(equal("www.apple.com"),timeout:timeout)
            
        }
        
        it("its share content file valid url"){
            
            let extentionItem = NSExtensionItem()
            
            //Creates teh property list
            let itemProvider = NSItemProvider(item: NSURL(string:"www.apple.com"), typeIdentifier:ShareContentExtractor.ExtractionTypes.PublicFileURL.rawValue)
            
            //Add the attachments
            extentionItem.attachments = [itemProvider]
            
            var result:ShareContent? = nil
            
            do{
                try shareContentExtractor.extractContentFromNSExtensionItem(extentionItem){ shareContent in
                    
                    result = shareContent
                }
            }catch{}
            
            expect(result).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.url).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.url).toEventually(equal("www.apple.com"),timeout:timeout)
            
        }
        
        it("its share content plain text valid"){
            
            let extentionItem = NSExtensionItem()
            
            //Creates teh property list
            let itemProvider = NSItemProvider(item: "test", typeIdentifier:ShareContentExtractor.ExtractionTypes.PublicPlainText.rawValue)
            
            //Add the attachments
            extentionItem.attachments = [itemProvider]
            
            var result:ShareContent? = nil
            
            do{
                try shareContentExtractor.extractContentFromNSExtensionItem(extentionItem){ shareContent in
                    
                    result = shareContent
                }
            }catch{}
            
            expect(result).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.url).toEventuallyNot(beNil(),timeout:timeout)
            expect(result!.url).toEventually(equal("test"),timeout:timeout)
            
        }
        
        
        it("its share content invalid"){
            
            let extentionItem = NSExtensionItem()
            
            //Creates teh property list
            let itemProvider = NSItemProvider(item: "test", typeIdentifier:"")
            
            //Add the attachments
            extentionItem.attachments = [itemProvider]
            
            var result = false
            
            do{
                try shareContentExtractor.extractContentFromNSExtensionItem(extentionItem){ shareContent in
                    
                }
            }catch{
                result = true
            }
            
            expect(result).to(beTrue())
            
        }

        
        
    }
    
}

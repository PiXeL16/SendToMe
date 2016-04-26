//
//  VersionUtil.swift
//  ClickerApp
//
//  Created by Christopher Jimenez on 3/17/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation

/// Util to get and parse the current App version
public struct VersionUtil{
    
    /**
     Gets the app version as a string
     
     - returns: App version
     */
    public static func getAppVersion() -> String?{
        
        
        let versionObject: AnyObject? = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]
        
        let version = versionObject as? String
        
        return version
        
    }
    
}

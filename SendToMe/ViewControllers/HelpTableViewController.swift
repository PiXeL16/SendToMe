//
//  AboutTableViewController.swift
//  SendToMe
//
//  Created by Chris Jimenez on 4/24/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import UIKit

class HelpTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - DataSource
extension HelpTableViewController{
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch(indexPath.section, indexPath.row)
        {
        case(0,2):
            self.rateApp()
            
        case(0,3):
            self.showTwitter()
            
        case(0,4):
            self.showGithub()
            
        default:
            break
            
        }
    }
    
    
    /**
     Opens the rate app url
     */
    private func rateApp(){
        
        UIApplication.sharedApplication().openURL(NSURL(string: Constants.iTunesURL)!)
        
    }
    
    /**
     Opens the twitter app link
     */
    private func showTwitter(){
        
        UIApplication.sharedApplication().openURL(NSURL(string: Constants.twitterURL)!)
    }
    
    /**
     Opens the github app link
     */
    private func showGithub(){
        
        UIApplication.sharedApplication().openURL(NSURL(string: Constants.githubURL)!)
    }
    
    
}



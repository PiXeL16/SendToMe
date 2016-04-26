//
//  AboutViewController.swift
//  SendToMe
//
//  Created by Christopher Jimenez on 4/26/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var versionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.versionLabel.text = "Version \(VersionUtil.getAppVersion()!)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

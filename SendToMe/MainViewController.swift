//
//  ViewController.swift
//  SendToMe
//
//  Created by Chris Jimenez on 1/22/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import UIKit
import IBAnimatable

class MainViewController: UIViewController {
    @IBOutlet weak var stackView: AnimatableStackView!

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var saveEmailButton: AnimatableButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func saveEmailClicked(sender: AnyObject) {
        
        if isValid(){
            
            self.saveEmailButton.setTitle("Email Saved", forState: UIControlState.Normal)
            saveEmailButton.zoomIn()
            
        }else {
            
            //Shakes the stackview to show an error
            stackView.shake()

        }
    }
    
    /**
     Check if the form is valid
     
     - returns: form is valid
     */
    private func isValid() -> Bool{
        
        var returnValue = false
        
        if emailTextField.text!.isValidEmail()
        {
            returnValue = true
        }
        
        return returnValue
        
    }
    
}


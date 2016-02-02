
//
//  SendToMeUITests.swift
//  SendToMeUITests
//
//  Created by Chris Jimenez on 1/22/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import XCTest
import SendToMeFramework

class SendToMeUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        
        //Clean after the test
        clearEmailStorage()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        
    }
    
    
    func testSaveEmail()
    {
        
        let yourEmailAddressTextField = app.textFields["emailTextField"]
        
        //Ugly but thats the only way to hold for the sliding animation to finish before pressing
        sleep(1)
        
        
        yourEmailAddressTextField.tap()
        yourEmailAddressTextField.typeText("test@test.com")
        app.buttons["saveEmailButton"].tap()
        
        
        XCTAssertEqual(yourEmailAddressTextField.placeholderValue, "Using email test@test.com")
        
       
    }
    
    
    func testSaveInvalidEmail()
    {
        
        let yourEmailAddressTextField = app.textFields["emailTextField"]
        let emailButton = app.buttons["saveEmailButton"]
        
        //Ugly but thats the only way to hold for the sliding animation to finish before pressing
        sleep(1)
        
        
        yourEmailAddressTextField.tap()
        yourEmailAddressTextField.typeText("test")
        emailButton.tap()
        
        XCTAssertTrue(yourEmailAddressTextField.value as! String == "test")
        
    }
    
    
    
    func clearEmailStorage()
    {
        
        let emailDataStorage = EmailDataStorage()
        emailDataStorage.clearEmail()
    }
    
}

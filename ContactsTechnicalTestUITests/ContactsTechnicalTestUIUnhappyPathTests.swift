//
//  ContactsTechnicalTestUIUnhappyPathTests.swift
//  ContactsTechnicalTestUITests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest

// Must reset device settings to use this test case (Simulator -> Hardware -> Erase All Contents and Settings).

class ContactsTechnicalTestUIUnhappyPathTests: XCTestCase {
    
    // MARK: - Initial Setup
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
        
        addUIInterruptionMonitor(withDescription: "Contacts Permission Alert") { (permissionsAlert) -> Bool in
            if permissionsAlert.staticTexts["This app needs your contacts for displaying their details within the app."].exists {
                // Contacts Permission Alert
                let dontAllowButton = permissionsAlert.buttons["Don’t Allow"]
                if dontAllowButton.exists {
                    dontAllowButton.tap()
                }
            } else {
                // Error Alert
                let okbutton = permissionsAlert.buttons["OK"]
                if okbutton.exists {
                    okbutton.tap()
                }
            }
            
            return true
        }
        
        // Allow UI interruption monitor to start working
        XCUIApplication().navigationBars["contactList.navigationBar"].tap()
    }
    
    // Tests that no contacts are loaded in table view if permissions are denied
    func test_permissionsDenied_noContactsLoadedInList() {
        let app = XCUIApplication()
        
        let contactsTable = app.tables["contactList.contactsTableView"]
        XCTAssert(contactsTable.cells.count == 0)
    }
}

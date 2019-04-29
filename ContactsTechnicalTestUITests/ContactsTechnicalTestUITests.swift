//
//  ContactsTechnicalTestUITests.swift
//  ContactsTechnicalTestUITests
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest

class ContactsTechnicalTestUITests: XCTestCase {

    // MARK: - Initial Setup
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
        
        addUIInterruptionMonitor(withDescription: "Contacts Permission Alert") { (permissionsAlert) -> Bool in
            let okButton = permissionsAlert.buttons["OK"]
            if okButton.exists {
                okButton.tap()
            }
            
            return true
        }
        
        // Allow UI interruption monitor to start working
        XCUIApplication().navigationBars["contactList.navigationBar"].tap()
    }
    
    // MARK: - Helper Functionality
    
    // Checks if Contact List screen is currently onscreen
    private func isContactListScreenShowing(app: XCUIApplication) -> Bool {
        let contactsListTable = app.tables["contactList.contactsTableView"]
        let contactDetailFavouriteButton = app.buttons["contactDetail.favouriteButton"]
        
        if contactsListTable.waitForExistence(timeout: 2) {
            return contactsListTable.exists && !contactDetailFavouriteButton.exists
        } else {
            return false
        }
    }
    
    // Checks if Contact Detail screen is currently onscreen
    private func isContactDetailScreenShowing(app: XCUIApplication) -> Bool {
        let contactsListTable = app.tables["contactList.contactsTableView"]
        let contactDetailFavouriteButton = app.buttons["contactDetail.favouriteButton"]

        if contactDetailFavouriteButton.waitForExistence(timeout: 2) {
            return !contactsListTable.exists && contactDetailFavouriteButton.exists
        } else {
            return false
        }
    }
    
    // Automatically navigates to the Contact Detail screen
    private func navigateToContactDetailScreen(app: XCUIApplication) {
        let contactsListTable = app.tables["contactList.contactsTableView"]
        let contactCell = contactsListTable.cells.element(matching: .cell,
                                                          identifier: "contactList.contactsTableView.cell_0_0")
        if contactCell.waitForExistence(timeout: 3) {
            contactCell.tap()
        }
    }
    
    // MARK: - UI Testing Logic
    
    func test_contactDetail_backButtonRendered() {
        let app = XCUIApplication()
        
        navigateToContactDetailScreen(app: app)
        
        XCTAssert(app.buttons["contactDetail.backButton"].exists)
    }
    
    // Test that cell tap navigates to Contact Detail screen
    func test_contactListCellSelected_navigatesToContactDetailScreen() {
        let app = XCUIApplication()
        
        navigateToContactDetailScreen(app: app)
        
        XCTAssert(isContactDetailScreenShowing(app: app))
    }
    
    // Test that back button tap navigates back to Contacts List screen
    func test_contactDetailBackButtonTapped_navigatesToContactListScreen() {
        let app = XCUIApplication()
        
        navigateToContactDetailScreen(app: app)
        
        let contactDetailBackButton = app.buttons["contactDetail.backButton"]
        contactDetailBackButton.tap()
        
        XCTAssert(isContactListScreenShowing(app: app))
    }
    
    // Test that keyboard appears when tapping on the search field
    func test_contactList_searchBarKeyboardShowing() {
        let app = XCUIApplication()

        // Tap search field
        let searchField = app.textFields["contactList.searchField"]
        searchField.tap()
        
        // Check keyboard appearance
        XCTAssertTrue(app.keyboards.count > 0)
    }
    
    // Test that keyboard is dismissed when 'done' button is tapped
    func test_contactList_keyboardHidesWhenDoneButtonTapped() {
        let app = XCUIApplication()
        
        // Tap search field
        let searchField = app.textFields["contactList.searchField"]
        searchField.tap()
        
        // Simulates keyboard dismissal
        if app.keys.element(boundBy: 0).exists {
            app.typeText("\n")
        }
        
        // Check keyboard dismissal
        XCTAssertEqual(app.keyboards.count, 0)
    }
}

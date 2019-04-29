//
//  ContactDetailRouterTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactDetailRouterTests: XCTestCase {

    // MARK: - Lifecycle Methods
    
    override func setUp() {
        // No setup required
    }

    override func tearDown() {
        // No teardown required
    }
    
    // MARK: - Unit Tests

    func test_contactDetailRouter_routesToPreviousControllerOnBackEvent() {
        let testPreviousController = UIViewController()
        let testController = UIViewController()
        let navigationController = UINavigationController(rootViewController: testPreviousController)
        navigationController.pushViewController(testController, animated: true)
        
        let router = ContactDetailRouter(delegate: nil)
        router.controller = testController
        
        router.handleBack(isFavourite: true, contactIdentifier: "")
        
        XCTAssert(navigationController.topViewController! == testPreviousController)
    }
}

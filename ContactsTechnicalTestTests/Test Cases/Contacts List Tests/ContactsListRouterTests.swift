//
//  ContactsListRouterTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactsListRouterTests: XCTestCase {

    // MARK: - Lifecycle Methods
    
    override func setUp() {
        // No setup required
    }

    override func tearDown() {
        // No teardown required
    }

    // MARK: - Unit Tests

    func test_contactDetailRouter_routesToContactDetail() {
        let testController = UIViewController()
        let navigationController = UINavigationController(rootViewController: testController)
        
        let router = ContactsListRouter()
        router.controller = testController
        
        router.handleSelectedContact(contact: PartialContactMockBuilder.buildMock())
        
        let expectation = XCTestExpectation(description: "Wait for navigation stack to update.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            XCTAssert(navigationController.visibleViewController! is ContactDetailViewController)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}

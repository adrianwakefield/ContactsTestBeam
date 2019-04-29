//
//  ContactsListViewControllerTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactsListViewControllerTests: XCTestCase {

    // MARK: - Lifecycle Methods
    
    override func setUp() {
        // No setup required
    }

    override func tearDown() {

    }
    
    // MARK: - Unit Tests

    func test_contactListViewController_initWithCoder() {
        let archiver = NSKeyedArchiver(requiringSecureCoding: true)
        let mainView = ContactsListViewController(coder: archiver)
        XCTAssertNil(mainView)
    }

}

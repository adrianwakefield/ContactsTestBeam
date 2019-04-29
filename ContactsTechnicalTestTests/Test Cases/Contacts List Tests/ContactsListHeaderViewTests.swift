//
//  ContactsListHeaderViewTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactsListHeaderViewTests: XCTestCase {

    // MARK: - Lifecycle Methods
    
    override func setUp() {
        // No setup required
    }

    override func tearDown() {
        // No teardown required
    }
    
    // MARK: - Unit Tests

    func test_contactListHeaderView_initWithCoder() {
        let archiver = NSKeyedArchiver(requiringSecureCoding: true)
        let mainView = ContactListHeaderView(coder: archiver)
        XCTAssertNil(mainView)
    }

}

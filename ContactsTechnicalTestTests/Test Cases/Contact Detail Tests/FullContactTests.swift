//
//  FullContactTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class FullContactTests: XCTestCase {

    // MARK: - Lifecycle Methods
    
    override func setUp() {
        // No setup required
    }

    override func tearDown() {
        // No teardown required
    }
    
    // MARK: - Unit Tests

    func test_contactDetailFullContact_initialisesCorrecltyWithCNContact() {
        let contactMock = CNContactMockBuilder.buildMock()
        let fullContact = FullContact(contact: contactMock)
        XCTAssertEqual(fullContact.birthday, DateComponents(year: 1990, month: 12, day: 10))
        XCTAssertEqual(fullContact.givenName,"John")
        XCTAssertEqual(fullContact.familyName, "Smith")
        XCTAssertEqual(fullContact.jobTitle, "Programmer")
        XCTAssertEqual(fullContact.imageData, Data())
    }
}

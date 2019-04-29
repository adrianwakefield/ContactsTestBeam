//
//  ContactsListBuilderTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactsListBuilderTests: XCTestCase {
    
    // MARK: - Lifecycle Methods

    override func setUp() {
        // No setup required
    }

    override func tearDown() {
        // No teardown required
    }

    // MARK: - Unit Tests
    
    func test_contactsListBuilder_buildsCorrectController() {
        let contactDetailModule = ContactsListBuilder.buildModule()
        XCTAssert(contactDetailModule is ContactsListViewController)
    }

}

//
//  ContactDetailBuilderTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactDetailBuilderTests: XCTestCase {
    
    // MARK: - Lifecycle Methods
    
    override func setUp() {
        // No setup required
    }

    override func tearDown() {
        // No teardown required
    }
    
    // MARK: - Unit Tests

    func test_contactsListBuilder_buildsCorrectController() {
        let contactDetailDependency = ContactDetailDependency(contact: PartialContactMockBuilder.buildMock(),
                                                              delegate: nil)
        let contactDetailModule = ContactDetailBuilder.buildModule(with: contactDetailDependency)
        XCTAssert(contactDetailModule is ContactDetailViewController)
    }
}

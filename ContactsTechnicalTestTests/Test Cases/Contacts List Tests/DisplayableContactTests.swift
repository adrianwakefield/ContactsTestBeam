//
//  DisplayableContactTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class DisplayableContactTests: XCTestCase {

    // MARK: - Lifecycle Methods
    
    override func setUp() {
        // No setup required
    }

    override func tearDown() {
        // No teardown required
    }
    
    // MARK: - Unit Tests

    func test_displayableContact_comparesCorrectly() {
        let displayableContactMock1 = DisplayableContactMockBuilder.buildMock()
        let displayableContactMock2 = DisplayableContactMockBuilder.buildComparableMock()
        XCTAssertGreaterThan(displayableContactMock1, displayableContactMock2)
    }
}

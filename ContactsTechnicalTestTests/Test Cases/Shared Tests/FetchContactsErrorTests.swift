//
//  FetchContactsErrorTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class FetchContactsErrorTests: XCTestCase {

    // MARK: - Lifecycle Methods
    
    override func setUp() {

    }

    override func tearDown() {

    }
    
    // MARK: - Unit Tests

    func test_fetchContactsError_rendersCorrectLocalizedDescription() {
        let authorisationError = FetchContactsError.authorizationError
        let fetchFailureError = FetchContactsError.fetchFailure
        let individualFetchError = FetchContactsError.individualContactFetchError
        let unknownError = FetchContactsError.unknownError
        
        XCTAssertEqual(authorisationError.localizedDescription, Strings.ContactList.authorizationError)
        XCTAssertEqual(fetchFailureError.localizedDescription, Strings.ContactList.fetchFailureError)
        XCTAssertEqual(individualFetchError.localizedDescription, Strings.ContactDetail.individualContactFetchError)
        XCTAssertEqual(unknownError.localizedDescription, Strings.General.unknownErorrMessage)
    }

}

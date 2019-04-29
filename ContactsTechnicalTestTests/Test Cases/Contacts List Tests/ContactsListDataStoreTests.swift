//
//  ContactsListDataStoreTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 22/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactsListDataStoreTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_contactsListDataStore_addedContactsStoredCorrectly() {
        let partialContactMocks = PartialContactMockBuilder.buildMultipleMocks()
        let sut = ContactsListLocalDataStore()
        
        partialContactMocks.forEach { sut.add(contact: $0) }
        let allStoredContacts = sut.getAllContacts(isSearching: false)
        
        XCTAssertTrue(partialContactMocks == allStoredContacts)
    }
    
    func test_contactsListDataStore_contactFavouriteStatusUpdatesCorrectly() {
        let partialContactMock = PartialContactMockBuilder.buildMock()
        let sut = ContactsListLocalDataStore()
        
        sut.add(contact: partialContactMock)
        sut.updateFavouriteStatus(for: partialContactMock.id, isFavourite: true)
        let retrievedContact = sut.getAllContacts(isSearching: false)[0]
        
        XCTAssertTrue(retrievedContact.isFavourite == true)
    }
    
    func test_contactsListDataStore_filteredListRendersCorrectlyWithEmptySearchTerm() {
        let johnMock = PartialContactMockBuilder.buildMock()
        let bobMock = PartialContactMockBuilder.buildComparableMock()
        let sut = ContactsListLocalDataStore()
        
        [johnMock, bobMock].forEach { sut.add(contact: $0) }
        sut.updateFilteredContacts(searchTerm: "")
        let allFilteredContacts = sut.getAllContacts(isSearching: true)
        
        XCTAssertTrue(allFilteredContacts == [johnMock, bobMock])
    }
    
    func test_contactsListDataStore_filteredListRendersCorrectlyWithEnteredSearchTerm() {
        let bobMock = PartialContactMockBuilder.buildComparableMock()
        let partialContactMocks = PartialContactMockBuilder.buildMultipleMocks()
        let sut = ContactsListLocalDataStore()
        
        partialContactMocks.forEach { sut.add(contact: $0) }
        sut.updateFilteredContacts(searchTerm: "Bob")
        let allFilteredContacts = sut.getAllContacts(isSearching: true)
        
        XCTAssertTrue(allFilteredContacts == [bobMock])
    }
}

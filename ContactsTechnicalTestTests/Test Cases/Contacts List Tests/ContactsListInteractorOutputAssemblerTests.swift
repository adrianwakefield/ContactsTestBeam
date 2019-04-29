//
//  ContactsListInteractorOutputAssemblerTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactsListInteractorOutputAssemblerTests: XCTestCase {

    // MARK: - Properties
    
    private var presenterMock: ContactsListPresenterSpy!
    private var sut: ContactsListInteractorOutputAssembler?
    
    // MARK: - Lifecycle Methods
    
    override func setUp() {
        presenterMock = ContactsListPresenterSpy()
        sut = makeSUT()
    }

    override func tearDown() {
        presenterMock = nil
        sut = nil
    }
    
    // MARK: - Helper Functions
    
    private func makeSUT() -> ContactsListInteractorOutputAssembler {
        let interactorOutputAssembler = ContactsListInteractorOutputAssembler(outputs: [presenterMock])
        return interactorOutputAssembler
    }
    
    // MARK: - Unit Tests

    func test_contactsList_propagatesLoadedFilteredContactsFromSearch() {
        sut!.handleLoadedFilteredContactsFromSearch(viewModel: ContactListViewModelMockBuilder.buildMock())
        
        XCTAssert(presenterMock.isHandleLoadedFilteredContactsFromSearchCalled)
    }
    
    func test_contactsList_propagatesSelectedContactEventToOutputs() {
        let partialContactMock = PartialContactMockBuilder.buildMock()
        sut!.handleSelectedContact(contact: partialContactMock)
        
        XCTAssert(presenterMock.isHandleSelectedContactCalled)
    }
    
    func test_contactsList_propagatesFetchContactErrorToOutputs() {
        sut!.handleFetchContactError(error: .unknownError)
        
        XCTAssert(presenterMock.isHandleFetchContactErrorCalled)
    }
    
    func test_contactsList_propagatesKeyboardShowEventToOutputs() {
        let keyboardMockNotification = NSNotification(name: UIResponder.keyboardWillShowNotification, object: nil)
        sut!.handleKeyboardShow(notification: keyboardMockNotification)
        
        XCTAssert(presenterMock.isHandleKeyboardShowCalled)
    }
    
    func test_contactsList_propagatesKeyboardHideEventToOutputs() {
        sut!.handleKeyboardHide()
        
        XCTAssert(presenterMock.isHandleKeyboardHideCalled)
    }
    

}

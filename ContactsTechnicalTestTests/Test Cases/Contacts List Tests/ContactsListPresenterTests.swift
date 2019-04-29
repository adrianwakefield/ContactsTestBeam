//
//  ContactsListPresenterTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactsListPresenterTests: XCTestCase {

    // MARK: - Properties
    
    private var presenterOutputSpy: ContactsListPresenterOutputSpy!
    private var sut: ContactsListPresenter!
    
    // MARK: - Lifecycle Methods
    
    override func setUp() {
        presenterOutputSpy = ContactsListPresenterOutputSpy()
        sut = makeSUT()
    }

    override func tearDown() {
        sut = nil
        presenterOutputSpy = nil
    }
    
    // MARK: - Helper Functions
    
    private func makeSUT() -> ContactsListPresenter {
        let presenter = ContactsListPresenter()
        presenter.presenterOutput = presenterOutputSpy
        return presenter
    }

    // MARK: - Unit Tests

    func test_contactsListPresenter_propagatesLoadedFilteredContactsFromSearchToPresenterOutput() {
        let viewModelMock = ContactListViewModelMockBuilder.buildMock()
        sut.handleLoadedFilteredContactsFromSearch(viewModel: viewModelMock)
        
        XCTAssert(presenterOutputSpy.isHandleDisplayPresentableViewModelCalled)
    }
    
    func test_contactsListPresenter_propagatesContactFetchErrorToPresenterOutput() {
        sut.handleFetchContactError(error: .unknownError)
        
        XCTAssert(presenterOutputSpy.isHandleDisplayErrorMessageCalled)
    }
    
    func test_contactsListPresenter_propagatesKeyboardShowEventToPresenterOutput() {
        let keyboardMockNotification = NSNotification(name: UIResponder.keyboardWillShowNotification,
                                                      object: nil)
        sut.handleKeyboardShow(notification: keyboardMockNotification)
        
        XCTAssert(presenterOutputSpy.isHandleKeyboardChangeEventCalled)
    }
    
    func test_contactsListPresenter_propagatesKeyboardHideEventToPresenterOutput() {
        sut.handleKeyboardHide()
        
        XCTAssert(presenterOutputSpy.isHandleKeyboardChangeEventCalled)
    }
    
    func test_contactsListPresenter_rendersCorrectPresentableViewModelFromViewModel() {
        let viewModelMock = ContactListViewModelMockBuilder.buildMock()
        sut.handleLoadedFilteredContactsFromSearch(viewModel: viewModelMock)
        
        let expectedContactSections = [ContactSection(headerText: "B",
                                                      contacts: [DisplayableContact(fullName: "Bob Jones", favouriteText: Strings.ContactList.notFavouritedText, favouriteColor: Colours.nonFavouritedGrey)]),
                                       ContactSection(headerText: "J",
                                                      contacts: [DisplayableContact(fullName: "John Smith", favouriteText: Strings.ContactList.notFavouritedText, favouriteColor: Colours.nonFavouritedGrey)])]

        XCTAssert(presenterOutputSpy.presentableViewModel!.contactSections == expectedContactSections)
    }
    
    func test_contactsListPresenter_rendersCorrectErrorMessageFromError() {
        sut.handleFetchContactError(error: .fetchFailure)
        
        XCTAssert(presenterOutputSpy.errorMessage! == Strings.ContactList.fetchFailureError)
    }
}

//
//  ContactsListPresenterSpy.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import Foundation
@testable import ContactsTechnicalTest

class ContactsListPresenterSpy: ContactsListInteractorOutput {
    
    // MARK: - Properties
    
    var isHandleLoadedFilteredContactsFromSearchCalled = false
    var isHandleSelectedContactCalled = false
    var isHandleFetchContactErrorCalled = false
    var isHandleKeyboardShowCalled = false
    var isHandleKeyboardHideCalled = false
    
    // MARK: - Methods
    
    func handleLoadedFilteredContactsFromSearch(viewModel: ContactListViewModel) {
        isHandleLoadedFilteredContactsFromSearchCalled = true
    }
    
    func handleSelectedContact(contact: PartialContact) {
        isHandleSelectedContactCalled = true
    }
    
    func handleFetchContactError(error: FetchContactsError) {
        isHandleFetchContactErrorCalled = true
    }
    
    func handleKeyboardShow(notification: NSNotification) {
        isHandleKeyboardShowCalled = true
    }
    
    func handleKeyboardHide() {
        isHandleKeyboardHideCalled = true
    }
}

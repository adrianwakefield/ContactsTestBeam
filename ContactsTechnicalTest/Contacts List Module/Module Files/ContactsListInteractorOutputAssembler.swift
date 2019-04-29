//
//  ContactsListInteractorOutputAssembler.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import Contacts
import Foundation

class ContactsListInteractorOutputAssembler {
    
    // MARK: - Properties
    
    private let outputs: [ContactsListInteractorOutput]
    
    // MARK: - Lifecycle Methods
    
    init(outputs: [ContactsListInteractorOutput]) {
        self.outputs = outputs
    }
}

// MARK: - Handle Output Propogation

extension ContactsListInteractorOutputAssembler: ContactsListInteractorOutput {
    
    func handleLoadedFilteredContactsFromSearch(viewModel: ContactListViewModel) {
        outputs.forEach { $0.handleLoadedFilteredContactsFromSearch(viewModel: viewModel) }
    }
    
    func handleSelectedContact(contact: PartialContact) {
        outputs.forEach { $0.handleSelectedContact(contact: contact) }
    }
    
    func handleFetchContactError(error: FetchContactsError) {
        outputs.forEach { $0.handleFetchContactError(error: error) }
    }
    
    func handleKeyboardShow(notification: NSNotification) {
        outputs.forEach { $0.handleKeyboardShow(notification: notification) }
    }
    
    func handleKeyboardHide() {
        outputs.forEach { $0.handleKeyboardHide() }
    }
}


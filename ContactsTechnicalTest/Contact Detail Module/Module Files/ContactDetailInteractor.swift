//
//  ContactDetailInteractor.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import Contacts

class ContactDetailInteractor {
    
    // MARK: - External Dependencies
    
    private let interactorOutput: ContactDetailInteractorOutput
    private let contactsFetcherService: ContactsFetcherService
    
    // MARK: - Properties
    
    private var contact: PartialContact    
    private var fullContact: CNContact?
    
    // MARK: - Lifecycle Methods
    
    init(interactorOutput: ContactDetailInteractorOutput,
         contactsFetcherService: ContactsFetcherService,
         contact: PartialContact) {
        self.interactorOutput = interactorOutput
        self.contactsFetcherService = contactsFetcherService
        self.contact = contact
    }
    
    // MARK: - Loading Contact Functionality
    
    // Load a contact object using an identifier
    private func loadFullContact(with identifier: String) {
        contactsFetcherService.fetchFullContact(with: identifier) { [weak self] fetchFullContactResult in
            switch fetchFullContactResult {
            case .success(let fullContact):
                self?.handleLoadContactSuccess(fullContact: fullContact)
            case .failure(let fetchContactError):
                self?.handleFetchContactError(error: fetchContactError)
            }
        }
    }
    
    // MARK: - Handle Load Contact Result
    
    // Store contact and propagate view model to interactor outputs
    private func handleLoadContactSuccess(fullContact: CNContact) {
        self.fullContact = fullContact
       
        let convertedFullContact = FullContact(contact: fullContact)
        let viewModel = ContactDetailViewModel(headerTitle: Strings.ContactDetail.headerTitle,
                                               contact: convertedFullContact,
                                               isFavourite: contact.isFavourite)
        self.interactorOutput.handleLoadedViewModel(viewModel: viewModel)
    }
    
    // Propagate error to interactor outputs
    private func handleFetchContactError(error: FetchContactsError) {
        interactorOutput.handleLoadContactError(error: error)
    }
}

// MARK: - Handle Interactor Input

extension ContactDetailInteractor: ContactDetailInteractorInput {
    
    func handleViewDidLoad() {
        loadFullContact(with: contact.id)
    }
    
    func handleBackButtonTap() {
        interactorOutput.handleBack(isFavourite: contact.isFavourite, contactIdentifier: contact.id)
    }
    
    func handleFavouriteTap() {
        contact.isFavourite = !contact.isFavourite
        interactorOutput.handleFavouriteStatusChange(isFavourite: contact.isFavourite)
    }
}

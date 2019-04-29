//
//  ContactsListInteractor.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import Contacts

class ContactsListInteractor {
    
    // MARK: - External Dependencies
    
    private let interactorOutput: ContactsListInteractorOutput
    private let contactAuthorizationService: ContactsAuthorizationService
    private let contactFetcherService: ContactsFetcherService
    private let dataStore: ContactsListDataStore
    
    // MARK: - Properties
    
    private var isSearching = false
    
    // MARK: - Lifecycle Methods
    
    init(interactorOutput: ContactsListInteractorOutput,
         contactAuthorizationService: ContactsAuthorizationService,
         contactFetcherService: ContactsFetcherService,
         dataStore: ContactsListDataStore) {
        self.interactorOutput = interactorOutput
        self.contactAuthorizationService = contactAuthorizationService
        self.contactFetcherService = contactFetcherService
        self.dataStore = dataStore
        setupContactsUpdateHandler()
    }
    
    // MARK: - Requesting Permissions
    
    private func requestContactsPermission() {
        contactAuthorizationService.requestContactsPermission { [weak self] contactPermssionResult in
            switch contactPermssionResult {
            case .success(_):
                self?.fetchContacts()
            case .failure(let error):
                self?.handleFetchContactsError(error: error)
            }
        }
    }
    
    // MARK: - Handle Contacts Update
    
    // Listen for contact updates in the data store
    private func setupContactsUpdateHandler() {
        dataStore.onContactsUpdate = { [weak self] in
            self?.handleContactsUpdate()
        }
    }
    
    // Propagate contact updates to interactor outputs via a view model
    private func handleContactsUpdate() {
        let userContacts = dataStore.getAllContacts(isSearching: isSearching)
        let viewModel = ContactListViewModel(headerText: Strings.ContactList.headerTitle,
                                             searchFieldPlaceholder: Strings.ContactList.searchFieldPlaceholder,
                                             contactsToDisplay: userContacts)
        interactorOutput.handleLoadedFilteredContactsFromSearch(viewModel: viewModel)
    }
    
    // MARK: - Fetching User Contacts
    
    // Fetch all user contacts from device's contacts
    private func fetchContacts() {
        contactFetcherService.fetchAllContacts { [weak self] contactFetchResult in
            switch contactFetchResult {
            case .success(let contact):
                self?.handleFetchContactsSuccess(contact: contact)
            case .failure(let contactFetchError):
                self?.handleFetchContactsError(error: contactFetchError)
            }
        }
    }
    
    private func handleFetchContactsSuccess(contact: CNContact) {
        let partialContact = PartialContact(id: contact.identifier,
                                            givenName: contact.givenName,
                                            familyName: contact.familyName)
        dataStore.add(contact: partialContact)
    }
    
    // Propagate fetch contacts error to interactor outputs
    private func handleFetchContactsError(error: FetchContactsError) {
        interactorOutput.handleFetchContactError(error: error)
    }
}

// MARK: - Handle Interactor Input

extension ContactsListInteractor: ContactsListInteractorInput {
    
    func handleViewDidLoad() {
        requestContactsPermission()
    }
    
    func handleSelectedCell(at indexPath: IndexPath) {
        let selectedContact = dataStore.getContact(for: indexPath.section,
                                                   row: indexPath.row,
                                                   isSearching: isSearching)
        interactorOutput.handleSelectedContact(contact: selectedContact)
    }
    
    // Update filtered contacts using the given search term
    func handleUpdatedSearchTerm(searchTerm: String) {
        dataStore.updateFilteredContacts(searchTerm: searchTerm)
    }
    
    func handleUpdatedFavouriteStatus(contactIdentifier: String, isFavourite: Bool) {
        dataStore.updateFavouriteStatus(for: contactIdentifier, isFavourite: isFavourite)
        let userContacts = dataStore.getAllContacts(isSearching: isSearching)
        let contactListViewModel = ContactListViewModel(headerText: Strings.ContactList.headerTitle,
                                                        searchFieldPlaceholder: Strings.ContactList.searchFieldPlaceholder,
                                                        contactsToDisplay: userContacts)
        interactorOutput.handleLoadedFilteredContactsFromSearch(viewModel: contactListViewModel)
    }
    
    func handleKeyboardWillShow(notification: NSNotification) {
        isSearching = true
        interactorOutput.handleKeyboardShow(notification: notification)
    }
    
    func handleKeyboardWillHide(notification: NSNotification) {
        isSearching = false
        interactorOutput.handleKeyboardHide()
    }
}

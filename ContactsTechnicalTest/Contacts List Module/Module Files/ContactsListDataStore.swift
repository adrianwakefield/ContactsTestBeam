//
//  ContactsListDataStore.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 19/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

protocol ContactsListDataStore: class {
    var onContactsUpdate: (() -> Void)? { get set }
    func add(contact: PartialContact)
    func getAllContacts(isSearching: Bool) -> [PartialContact]
    func getContact(for section: Int, row: Int, isSearching: Bool) -> PartialContact
    func updateFavouriteStatus(for contactIdentifier: String, isFavourite: Bool)
    func updateFilteredContacts(searchTerm: String)
}

class ContactsListLocalDataStore: ContactsListDataStore {
    
    // MARK: - Properties
    
    // Callback to notify other objects when contacts are updated
    var onContactsUpdate: (() -> Void)?
    
    // Full list of user contacts
    private var userContacts: [PartialContact] = [] {
        didSet {
            sections = getUpdatedContactsSections(using: userContacts)
            onContactsUpdate?()
        }
    }
    
    // List of contacts when user is searching
    private var filteredUserContacts: [PartialContact] = [] {
        didSet {
            filteredSections = getUpdatedContactsSections(using: filteredUserContacts)
            onContactsUpdate?()
        }
    }
    
    private var sections: [[PartialContact]] = []
    private var filteredSections: [[PartialContact]] = []
    
    // MARK: - Accessing/Modifying Logic
    
    // Add a new contact to the data store
    func add(contact: PartialContact) {
        self.userContacts.append(contact)
    }
    
    // Retrieve all relevant contacts based on search status
    func getAllContacts(isSearching: Bool) -> [PartialContact] {
        return isSearching ? filteredUserContacts : userContacts
    }
    
    // Get an individual contact from an index path
    func getContact(for section: Int, row: Int, isSearching: Bool) -> PartialContact {
        return isSearching ? filteredSections[section][row] : sections[section][row]
    }
    
    // Update favourited status for an individual contact
    func updateFavouriteStatus(for contactIdentifier: String, isFavourite: Bool) {
        if let indexOfContact = userContacts.firstIndex(where: { $0.id == contactIdentifier }) {
            userContacts[indexOfContact].isFavourite = isFavourite
        }
    }
    
    // Update filtered contacts for a given search term
    func updateFilteredContacts(searchTerm: String) {
        if searchTerm.isEmpty {
            filteredUserContacts = userContacts
        } else {
            let filteredGivenNameContacts = Set<PartialContact>(userContacts.filter { $0.givenName.lowercased().contains(searchTerm.lowercased()) })
            let filteredFamilyNameContacts = Set<PartialContact>(userContacts.filter { $0.familyName.lowercased().contains(searchTerm.lowercased()) })
            filteredUserContacts = Array(filteredGivenNameContacts.union(filteredFamilyNameContacts))
        }
    }
    
    private func getUpdatedContactsSections(using contacts: [PartialContact]) -> [[PartialContact]] {
        let alphabetisedContacts = contacts.sorted()
        let sectionsDictionary = Dictionary(grouping: alphabetisedContacts,
                                            by: { String($0.givenName.first!) })
        let sortedSectionsDictionary = sectionsDictionary.sorted(by: { $0.0 < $1.0 })
        return sortedSectionsDictionary.map { $1 }
    }
}

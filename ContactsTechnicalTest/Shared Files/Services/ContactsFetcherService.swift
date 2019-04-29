//
//  ContactsFetcherService.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import Contacts

// MARK: - Abstracted Contacts Fetcher Protocol

protocol ContactsFetcherService {
    typealias FetchAllContactsCompletion = (Result<CNContact, FetchContactsError>) -> Void
    typealias FetchFullContactCompletion = (Result<CNContact, FetchContactsError>) -> Void
    
    func fetchAllContacts(completion: @escaping FetchAllContactsCompletion)
    func fetchFullContact(with identifier: String, completion: @escaping FetchFullContactCompletion)
}

// MARK: - Concrete Local (On-Device) Contacts Fetcher Implementation

class ContactsLocalFetcherService: ContactsFetcherService {
    
    // MARK: - Fetching Contacts Logic
    
    // Fetch all user's on-device contacts
    func fetchAllContacts(completion: @escaping FetchAllContactsCompletion) {
        let contactsStore = CNContactStore()
        
        // Create background queue to import contacts
        let backgroundQueue = DispatchQueue.global(qos: .background)
        backgroundQueue.async {
            let keysToFetch: [CNKeyDescriptor] = [CNContactGivenNameKey as CNKeyDescriptor,
                                                  CNContactFamilyNameKey as CNKeyDescriptor]
            do {
                // Fetch contacts via enumation
                let fetchRequest = CNContactFetchRequest(keysToFetch: keysToFetch)
                try contactsStore.enumerateContacts(with: fetchRequest, usingBlock: { (contact, _) in
                    DispatchQueue.main.async {
                        completion(.success(contact))
                    }
                })
            } catch {
                // Handle fetch error
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                    completion(.failure(.fetchFailure))
                }
            }
        }
    }
    
    // Fetch a full individual contact using a contact identifier
    func fetchFullContact(with identifier: String, completion: @escaping FetchFullContactCompletion) {
        let contactsStore = CNContactStore()
        
        // Create background queue to import contacts
        let backgroundQueue = DispatchQueue.global(qos: .background)
        backgroundQueue.async {
            do {
                // Fetch individual contact
                let keysToFetch: [CNKeyDescriptor] = [CNContactGivenNameKey as CNKeyDescriptor,
                                                      CNContactFamilyNameKey as CNKeyDescriptor,
                                                      CNContactJobTitleKey as CNKeyDescriptor,
                                                      CNContactImageDataKey as CNKeyDescriptor,
                                                      CNContactBirthdayKey as CNKeyDescriptor,
                                                      CNContactPhoneNumbersKey as CNKeyDescriptor]
                let fetchedContact = try contactsStore.unifiedContact(withIdentifier: identifier,
                                                                      keysToFetch: keysToFetch)
                DispatchQueue.main.async {
                    completion(.success(fetchedContact))
                }
            } catch {
                // Handle fetch error
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                    completion(.failure(.individualContactFetchError))
                }
            }
        }
    }
}

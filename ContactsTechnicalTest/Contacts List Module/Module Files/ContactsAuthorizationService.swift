//
//  ContactsAuthorizationService.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 22/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import Contacts

// MARK: - Abstract Authorization Service Protocol

protocol ContactsAuthorizationService {
    typealias RequestPermissionCompletion = (Result<Any?, FetchContactsError>) -> Void
    func requestContactsPermission(completion: @escaping RequestPermissionCompletion)
}

// MARK: - Concrete Authorization Service Implementation

class ContactsLocalAuthorizationService: ContactsAuthorizationService {
    
    func requestContactsPermission(completion: @escaping RequestPermissionCompletion) {
        let contactStore = CNContactStore()
        contactStore.requestAccess(for: .contacts) { (isSuccessful, error) in
            if !isSuccessful {
                completion(.failure(FetchContactsError.authorizationError))
            } else {
                completion(.success(nil))
            }
        }
    }
}

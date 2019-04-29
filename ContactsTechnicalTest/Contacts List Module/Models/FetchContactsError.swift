//
//  FetchContactsError.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

// MARK: - Fetch Contacts Error Cases

enum FetchContactsError: Error {
    case authorizationError
    case fetchFailure
    case individualContactFetchError
    case unknownError
    
    var localizedDescription: String {
        switch self {
        case .authorizationError: return Strings.ContactList.authorizationError
        case .fetchFailure: return Strings.ContactList.fetchFailureError
        case .individualContactFetchError: return Strings.ContactDetail.individualContactFetchError
        case .unknownError: return Strings.General.unknownErorrMessage
        }
    }
}

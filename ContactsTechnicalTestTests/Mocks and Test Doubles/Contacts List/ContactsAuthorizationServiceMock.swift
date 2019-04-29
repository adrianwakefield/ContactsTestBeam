//
//  ContactsAuthorizationServiceMock.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 22/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

@testable import ContactsTechnicalTest

class ContactsAuthorizationServiceMockBuilder {
    
    static func buildMock(shouldSucceed: Bool) -> ContactsAuthorizationService {
        return shouldSucceed ? ContactsAuthorizationServiceSuccessMock() : ContactsAuthorizationServiceFailureMock()
    }
}

class ContactsAuthorizationServiceSuccessMock: ContactsAuthorizationService {
    
    func requestContactsPermission(completion: @escaping RequestPermissionCompletion) {
        completion(.success(nil))
    }
}

class ContactsAuthorizationServiceFailureMock: ContactsAuthorizationService {
    
    func requestContactsPermission(completion: @escaping RequestPermissionCompletion) {
        completion(.failure(FetchContactsError.authorizationError))
    }
}

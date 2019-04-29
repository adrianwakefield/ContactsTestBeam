//
//  ContactsFetcherTestService.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

@testable import ContactsTechnicalTest

class ContactsFetcherTestService: ContactsFetcherService {
    
    // MARK: - Properties
    
    private let cnContactMock = CNContactMockBuilder.buildMock()
    private let shouldSucceed: Bool
    
    // MARK: - Lifecycle Methods
    
    init(shouldSucceed: Bool) {
        self.shouldSucceed = shouldSucceed
    }
    
    // MARK: - Methods
    
    func fetchAllContacts(completion: @escaping FetchAllContactsCompletion) {
        completion(shouldSucceed ? .success(cnContactMock) : .failure(.fetchFailure))
    }
    
    func fetchFullContact(with identifier: String, completion: @escaping FetchFullContactCompletion) {
        completion(shouldSucceed ? .success(cnContactMock) : .failure(.individualContactFetchError))
    }
}

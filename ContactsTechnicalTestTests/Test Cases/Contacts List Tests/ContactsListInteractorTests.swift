//
//  ContactsListInteractorTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactsListInteractorTests: XCTestCase {

    // MARK: - Lifecycle Methods
    
    override func setUp() {
        // No setup required
    }

    override func tearDown() {
        // No teardown required
    }

    // MARK: - Unit Tests

    func test_contactsListInteractor_handleViewDidLoad_permissionsDenied_propagatesErrorToOutputs() {
        let authorizationServiceMock = ContactsAuthorizationServiceMockBuilder.buildMock(shouldSucceed: false)
        let interactorOutput = ContactsListPresenterSpy()
        let interactor = ContactsListInteractor(interactorOutput: interactorOutput,
                                                contactAuthorizationService: authorizationServiceMock,
                                                contactFetcherService: ContactsLocalFetcherService(),
                                                dataStore: ContactsListLocalDataStore())
        
        interactor.handleViewDidLoad()
        
        XCTAssertTrue(interactorOutput.isHandleFetchContactErrorCalled)
    }
    
    func test_contactsListInteractor_handleViewDidLoad_permissionsGranted_propagatesErrorToOutputs() {
        let authorizationServiceMock = ContactsAuthorizationServiceMockBuilder.buildMock(shouldSucceed: true)
        let fetcherServiceMock = ContactsFetcherTestService(shouldSucceed: true)
        let interactorOutput = ContactsListPresenterSpy()
        let interactor = ContactsListInteractor(interactorOutput: interactorOutput,
                                                contactAuthorizationService: authorizationServiceMock,
                                                contactFetcherService: fetcherServiceMock,
                                                dataStore: ContactsListLocalDataStore())
        
        interactor.handleViewDidLoad()
        
        XCTAssertTrue(interactorOutput.isHandleLoadedFilteredContactsFromSearchCalled)
    }
}

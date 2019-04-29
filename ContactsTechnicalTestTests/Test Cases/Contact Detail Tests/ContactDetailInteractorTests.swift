//
//  ContactDetailInteractorTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactDetailInteractorTests: XCTestCase {

    // MARK: - Lifecycle Methods
    
    override func setUp() {
        // No setup required
    }

    override func tearDown() {
        // No teardown required
    }
    
    // MARK: - Unit Tests

    func test_contactDetailInteractor_loadFullContactSuccessfully() {
        let partialContactMock = PartialContactMockBuilder.buildMock()
        let contactsFetchServiceTestSuccess = ContactsFetcherTestService(shouldSucceed: true)
        let interactorOutput: ContactDetailInteractorOutput = ContactDetailPresenterSpy()
        let interactor = ContactDetailInteractor(interactorOutput: interactorOutput,
                                                 contactsFetcherService: contactsFetchServiceTestSuccess,
                                                 contact: partialContactMock)
        
        interactor.handleViewDidLoad()
        
        XCTAssert((interactorOutput as! ContactDetailPresenterSpy).isHandleLoadedViewModelCalled)
    }
    
    func test_contactDetailInteractor_loadFullContactFetchError() {
        let partialContactMock = PartialContactMockBuilder.buildMock()
        let contactsFetchServiceTestSuccess = ContactsFetcherTestService(shouldSucceed: false)
        let interactorOutput: ContactDetailInteractorOutput = ContactDetailPresenterSpy()
        let interactor = ContactDetailInteractor(interactorOutput: interactorOutput,
                                                 contactsFetcherService: contactsFetchServiceTestSuccess,
                                                 contact: partialContactMock)
        
        interactor.handleViewDidLoad()
        
        XCTAssert((interactorOutput as! ContactDetailPresenterSpy).isHandleLoadContactErrorCalled)
    }
}

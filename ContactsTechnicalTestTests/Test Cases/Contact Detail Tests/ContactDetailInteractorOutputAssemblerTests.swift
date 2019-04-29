//
//  ContactDetailInteractorOutputAssemblerTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactDetailInteractorOutputAssemblerTests: XCTestCase {

    // MARK: - Properties
    
    private var presenterMock: ContactDetailPresenterSpy!
    private var sut: ContactDetailInteractorOutputAssembler?
    
    // MARK: - Lifecycle Methods
    
    override func setUp() {
        presenterMock = ContactDetailPresenterSpy()
        sut = makeSUT()
    }

    override func tearDown() {
        presenterMock = nil
        sut = nil
    }
    
    // MARK: - Helper Functions
    
    private func makeSUT() -> ContactDetailInteractorOutputAssembler {
        let interactorOutputAssembler = ContactDetailInteractorOutputAssembler(outputs: [presenterMock])
        return interactorOutputAssembler
    }

    // MARK: - Unit Tests
    
    func test_contactDetailInteractorOutputAssembler_propagatesBackEventToOutputs() {
        sut!.handleBack(isFavourite: true, contactIdentifier: "")
        
        XCTAssert(presenterMock.isHandleBackCalled)
    }
    
    func test_contactDetailInteractorOutputAssembler_propagatesFavouriteStatusChangeEventToOutputs() {
        sut!.handleFavouriteStatusChange(isFavourite: true)
        
        XCTAssert(presenterMock.isHandleFavouriteStatusChangeCalled)
    }
    
    func test_contactDetailInteractorOutputAssembler_propagatesLoadContactErrorEventToOutputs() {
        sut!.handleLoadContactError(error: .unknownError)
        
        XCTAssert(presenterMock.isHandleLoadContactErrorCalled)
    }
    
    func test_contactDetailInteractorOutputAssembler_propagatesLoadedViewModelEventToOutputs() {
        let viewModelMock = ContactDetailViewModelMockBuilder.buildMock()
        sut!.handleLoadedViewModel(viewModel: viewModelMock)
        
        XCTAssert(presenterMock.isHandleLoadedViewModelCalled)
    }
}

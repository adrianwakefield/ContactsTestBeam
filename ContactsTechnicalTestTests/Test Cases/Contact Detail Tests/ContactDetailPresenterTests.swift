//
//  ContactDetailPresenterTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactDetailPresenterTests: XCTestCase {

    // MARK: - Properties
    
    private var presenterOutputMock: ContactDetailPresenterOutputSpy!
    private var sut: ContactDetailPresenter?
    
    // MARK: - Lifecycle Methods
    
    override func setUp() {
        presenterOutputMock = ContactDetailPresenterOutputSpy()
        sut = makeSUT()
    }

    override func tearDown() {
        presenterOutputMock = nil
        sut = nil
    }
    
    // MARK: - Helper Functions
    
    private func makeSUT() -> ContactDetailPresenter {
        let presenter = ContactDetailPresenter()
        presenter.presenterOutput = presenterOutputMock
        return presenter
    }

    // MARK: - Unit Tests
    
    func test_contactDetailPresenter_errorPropagatedToPresenterOutput() {
        sut!.handleLoadContactError(error: .unknownError)
        
        XCTAssert(presenterOutputMock.isHandleDisplayErrorCalled)
    }
    
    func test_contactDetailPresenter_viewModelPropagatedToPresenterOutput() {
        let contactDetailViewModelMock = ContactDetailViewModelMockBuilder.buildMock()
        
        sut!.handleLoadedViewModel(viewModel: contactDetailViewModelMock)
        
        XCTAssert(presenterOutputMock.isHandleDisplayViewModelCalled)
    }
    
    func test_contactDetailPresenter_isFavouriteStatusChangePropagatedtoPresenterOutput() {        
        sut!.handleFavouriteStatusChange(isFavourite: true)
        
        XCTAssert(presenterOutputMock.isHandleDisplayFavouriteStatusChangeCalled)
    }
    
    func test_contactDetailPresenter_rendersCorrectFavouritedData() {
        sut!.handleFavouriteStatusChange(isFavourite: true)
        
        XCTAssert(presenterOutputMock.favouriteText! == Strings.ContactDetail.favouriteTitleIsFavourited)
        XCTAssert(presenterOutputMock.favouriteColour! == Colours.favouritedRed)
    }
    
    func test_contactDetailPresenter_rendersCorrectUnfavouritedData() {
        sut!.handleFavouriteStatusChange(isFavourite: false)
        
        XCTAssert(presenterOutputMock.favouriteText! == Strings.ContactDetail.favouriteTitleIsNotFavourited)
        XCTAssert(presenterOutputMock.favouriteColour! == Colours.nonFavouritedBlue)
    }

}

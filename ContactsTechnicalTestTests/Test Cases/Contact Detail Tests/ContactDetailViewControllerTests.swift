//
//  ContactDetailViewControllerTests.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import XCTest
@testable import ContactsTechnicalTest

class ContactDetailViewControllerTests: XCTestCase {

    private var interactor: ContactDetailInteractorSpy!
    private var sut: ContactDetailViewController?
    
    // MARK: - Lifecycle Methods
    
    override func setUp() {
        interactor = ContactDetailInteractorSpy()
        sut = makeSUT()
    }

    override func tearDown() {
        interactor = nil
        sut = nil
    }
    
    // MARK: - Helper Functions
    
    func makeSUT() -> ContactDetailViewController {
        let viewController = ContactDetailViewController(interactorInput: interactor)
        return viewController
    }
    
    // MARK: - Unit Tests

    func test_contactDetailViewController_initWithCoder() {
        let archiver = NSKeyedArchiver(requiringSecureCoding: true)
        let mainView = ContactDetailViewController(coder: archiver)
        XCTAssertNil(mainView)
    }
    
    func test_contactDetailViewController_viewDidLoadPropagatesToInteractor() {
        sut!.viewDidLoad()
        
        XCTAssert(interactor.isHandleViewDidLoadCalled)
    }
    
    func test_contactDetailViewController_tapFavouriteEventPropagatesToInteractor() {
        _ = sut!.view
        
        (sut!.view as! ContactDetailMainView).onFavouriteTap?()
        
        XCTAssert(interactor.isHandleFavouriteTapCalled)
    }
    
    func test_contactDetailViewController_tapBackEventPropagatesToInteractor() {
        _ = sut!.view
        
        (sut!.view as! ContactDetailMainView).onBackTap?()
        
        XCTAssert(interactor.isHandleBackButtonTapCalled)
    }
}

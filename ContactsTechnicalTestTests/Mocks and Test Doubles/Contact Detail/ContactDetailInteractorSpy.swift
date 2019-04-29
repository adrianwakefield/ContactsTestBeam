//
//  ContactDetailInteractorSpy.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

@testable import ContactsTechnicalTest

class ContactDetailInteractorSpy: ContactDetailInteractorInput {
    
    // MARK: - Properties
    
    var isHandleViewDidLoadCalled = false
    var isHandleBackButtonTapCalled = false
    var isHandleFavouriteTapCalled = false
    
    // MARK: - Methods
    
    func handleViewDidLoad() {
        isHandleViewDidLoadCalled = true
    }
    
    func handleBackButtonTap() {
        isHandleBackButtonTapCalled = true
    }
    
    func handleFavouriteTap() {
        isHandleFavouriteTapCalled = true
    }
}

//
//  ContactDetailPresenterSpy.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

@testable import ContactsTechnicalTest

class ContactDetailPresenterSpy: ContactDetailInteractorOutput {
    
    // MARK: - Properties
    
    var isHandleFavouriteStatusChangeCalled = false
    var isHandleBackCalled = false
    var isHandleLoadContactErrorCalled = false
    var isHandleLoadedViewModelCalled = false
    
    // MARK: - Methods
    
    func handleFavouriteStatusChange(isFavourite: Bool) {
        isHandleFavouriteStatusChangeCalled = true
    }
    
    func handleBack(isFavourite: Bool, contactIdentifier: String) {
        isHandleBackCalled = true
    }
    
    func handleLoadContactError(error: FetchContactsError) {
        isHandleLoadContactErrorCalled = true
    }
    
    func handleLoadedViewModel(viewModel: ContactDetailViewModel) {
        isHandleLoadedViewModelCalled = true
    }
}

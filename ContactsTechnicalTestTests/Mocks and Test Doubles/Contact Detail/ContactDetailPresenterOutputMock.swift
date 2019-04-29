//
//  ContactDetailPresenterOutputMock.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit
@testable import ContactsTechnicalTest

class ContactDetailPresenterOutputSpy: ContactDetailPresenterOutput {
    
    // MARK: - Properties
    
    var isHandleDisplayErrorCalled = false
    var isHandleDisplayFavouriteStatusChangeCalled = false
    var isHandleDisplayViewModelCalled = false
    
    var favouriteText: String?
    var favouriteColour: UIColor?
    
    // MARK: - Methods
    
    func handleDisplayError(message: String) {
        isHandleDisplayErrorCalled = true
    }
    
    func handleDisplayFavouriteStatusChange(favouriteText: String, favouriteColour: UIColor) {
        isHandleDisplayFavouriteStatusChangeCalled = true
        self.favouriteText = favouriteText
        self.favouriteColour = favouriteColour
    }
    
    func handleDisplayViewModel(presentableViewModel: ContactDetailPresentableViewModel) {
        isHandleDisplayViewModelCalled = true
    }
}

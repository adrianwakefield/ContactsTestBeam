//
//  ContactsListPresenterOutputSpy.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 22/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit
@testable import ContactsTechnicalTest

class ContactsListPresenterOutputSpy: ContactsListPresenterOutput {
    
    // MARK: - Properties
    
    var isHandleDisplayErrorMessageCalled = false
    var isHandleDisplayPresentableViewModelCalled = false
    var isHandleKeyboardChangeEventCalled = false
    
    var presentableViewModel: ContactListPresentableViewModel?
    var errorMessage: String?
    
    // MARK: - Methods
    
    func handleDisplayErrorMessage(message: String) {
        isHandleDisplayErrorMessageCalled = true
        errorMessage = message
    }
    
    func handleDisplayPresentableViewModel(presentableViewModel: ContactListPresentableViewModel) {
        isHandleDisplayPresentableViewModelCalled = true
        self.presentableViewModel = presentableViewModel
    }
    
    func handleKeyboardChangeEvent(newBottomContentInset: CGFloat) {
        isHandleKeyboardChangeEventCalled = true
    }
}

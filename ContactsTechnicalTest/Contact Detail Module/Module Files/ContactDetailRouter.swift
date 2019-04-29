//
//  ContactDetailRouter.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

class ContactDetailRouter {
    
    // MARK: - External Dependencies
    
    weak var controller: UIViewController?
    weak var delegate: ContactDetailDelegate?
    
    // MARK: - Lifecycle Methods
    
    init(delegate: ContactDetailDelegate?) {
        self.delegate = delegate
    }
}

// MARK: - Handle Interactor Output

extension ContactDetailRouter: ContactDetailInteractorOutput {
    
    // - Route back to Contact List controller
    // - Call delegate to update status text in Contact List cell
    func handleBack(isFavourite: Bool, contactIdentifier: String) {
        delegate?.didUpdateFavouriteStatus(for: contactIdentifier, isFavourite: isFavourite)
        controller?.navigationController?.popViewController(animated: true)
    }
    
    func handleLoadedViewModel(viewModel: ContactDetailViewModel) {
        // No-op: handled in Presenter
    }
    
    func handleLoadContactError(error: FetchContactsError) {
        // No-op: handled in Router
    }
    
    func handleFavouriteStatusChange(isFavourite: Bool) {
        // No-op: handled in Router
    }
}

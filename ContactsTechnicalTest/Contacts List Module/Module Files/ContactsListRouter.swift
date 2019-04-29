//
//  ContactsListRouter.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit
import Contacts

class ContactsListRouter {
    
    // MARK: - Properties
    
    weak var controller: UIViewController?
}

// MARK: - Handle Interactor Output

extension ContactsListRouter: ContactsListInteractorOutput {
    
    // Display 'Contact Detail' module from select contact
    func handleSelectedContact(contact: PartialContact) {
        let contactDetailDependency = ContactDetailDependency(contact: contact,
                                                              delegate: controller as? ContactsListViewController)
        let contactDetailModule = ContactDetailBuilder.buildModule(with: contactDetailDependency)
        controller?.navigationController?.pushViewController(contactDetailModule, animated: true)
    }
    
    func handleLoadedFilteredContactsFromSearch(viewModel: ContactListViewModel) {
        // No-op: handled in Presenter
    }
    
    func handleFetchContactError(error: FetchContactsError) {
        // No-op: handled in Presenter
    }
    
    func handleKeyboardShow(notification: NSNotification) {
        // No-op: handled in Presenter
    }
    
    func handleKeyboardHide() {
        // No-op: handled in Presenter
    }
}

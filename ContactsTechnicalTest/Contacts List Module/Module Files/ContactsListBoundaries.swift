//
//  ContactsListBoundaries.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import Contacts
import UIKit

// MARK: - Interactor Input/Output

protocol ContactsListInteractorInput {
    func handleViewDidLoad()
    func handleKeyboardWillShow(notification: NSNotification)
    func handleKeyboardWillHide(notification: NSNotification)
    func handleSelectedCell(at indexPath: IndexPath)
    func handleUpdatedSearchTerm(searchTerm: String)
    func handleUpdatedFavouriteStatus(contactIdentifier: String, isFavourite: Bool)
}

protocol ContactsListInteractorOutput {
    func handleFetchContactError(error: FetchContactsError)
    func handleSelectedContact(contact: PartialContact)
    func handleLoadedFilteredContactsFromSearch(viewModel: ContactListViewModel)
    func handleKeyboardShow(notification: NSNotification)
    func handleKeyboardHide()
}

// MARK: - Presenter Output

protocol ContactsListPresenterOutput: class {
    func handleDisplayPresentableViewModel(presentableViewModel: ContactListPresentableViewModel)
    func handleDisplayErrorMessage(message: String)
    func handleKeyboardChangeEvent(newBottomContentInset: CGFloat)
}

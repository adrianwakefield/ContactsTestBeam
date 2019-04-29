//
//  ContactsListPresenter.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

class ContactsListPresenter {
    
    // MARK: - Properties
    
    weak var presenterOutput: ContactsListPresenterOutput?
    
    // Convert a partial contacts to presentable 'displayable contact' objects
    private func convertToDisplayableContacts(contacts: [PartialContact]) -> [DisplayableContact] {
        let formattedContactNames = contacts.map {
            DisplayableContact(fullName: $0.givenName + " " + $0.familyName,
                               favouriteText: $0.isFavourite ? Strings.ContactList.favouritedText : Strings.ContactList.notFavouritedText,
                               favouriteColor: $0.isFavourite ? Colours.favouritedGreen : Colours.nonFavouritedGrey) }
        return formattedContactNames
    }
    
    // Convert displayable contact objects to contact section objects for presentation
    private func createAlphabetisedSections(contacts: [DisplayableContact]) -> [ContactSection] {
        let alphabetisedContacts = contacts.sorted()
        let sectionsDictionary = Dictionary(grouping: alphabetisedContacts,
                                            by: { String($0.fullName.first!).uppercased() })
        let sortedSectionsDictionary = sectionsDictionary.sorted(by: { $0.0 < $1.0 })
        let contactSections = sortedSectionsDictionary.map { ContactSection(headerText: $0, contacts: $1) }
        return contactSections
    }
}

// MARK: - Handle Interactor Output

extension ContactsListPresenter: ContactsListInteractorOutput {
    
    func handleLoadedFilteredContactsFromSearch(viewModel: ContactListViewModel) {
        let displayableContacts = convertToDisplayableContacts(contacts: viewModel.contactsToDisplay)
        let contactSections = createAlphabetisedSections(contacts: displayableContacts)
        let presentableViewModel = ContactListPresentableViewModel(headerText: viewModel.headerText,
                                                                   searchFieldPlaceholder: viewModel.searchFieldPlaceholder, contactSections: contactSections)
        presenterOutput?.handleDisplayPresentableViewModel(presentableViewModel: presentableViewModel)
    }
    
    func handleFetchContactError(error: FetchContactsError) {
        presenterOutput?.handleDisplayErrorMessage(message: error.localizedDescription)
    }
    
    func handleKeyboardShow(notification: NSNotification) {
        if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            presenterOutput?.handleKeyboardChangeEvent(newBottomContentInset: keyboardHeight)
        } else {
            presenterOutput?.handleKeyboardChangeEvent(newBottomContentInset: 0)
        }
    }
    
    func handleKeyboardHide() {
        presenterOutput?.handleKeyboardChangeEvent(newBottomContentInset: 0)
    }
    
    func handleSelectedContact(contact: PartialContact) {
        // No-op: handled in Router
    }
}

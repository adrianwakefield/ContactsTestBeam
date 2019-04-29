//
//  ContactListViewModelMockBuilder.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

@testable import ContactsTechnicalTest

class ContactListViewModelMockBuilder {
    
    static func buildMock() -> ContactListViewModel {
        let partialContactMocks = PartialContactMockBuilder.buildMultipleMocks()
        let viewModel = ContactListViewModel(headerText: "My Contacts",
                                             searchFieldPlaceholder: "Enter a search term...",
                                             contactsToDisplay: partialContactMocks)
        return viewModel
    }
}

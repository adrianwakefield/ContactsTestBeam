//
//  ContactDetailViewModelMockBuilder.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

@testable import ContactsTechnicalTest

class ContactDetailViewModelMockBuilder {
    
    static func buildMock() -> ContactDetailViewModel {
        let fullContact = FullContact(contact: CNContactMockBuilder.buildMock())
        let viewModel = ContactDetailViewModel(headerTitle: "Test",
                                               contact: fullContact,
                                               isFavourite: false)
        return viewModel
    }
}

//
//  FullContact.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 19/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import Foundation
import Contacts

// MARK: - Full Contact Raw Format

struct FullContact {
    let id: String
    let givenName: String
    let familyName: String
    let jobTitle: String
    let imageData: Data?
    let birthday: DateComponents?
    let phoneNumbers: [String]
    var isFavourite: Bool
    
    init(contact: CNContact) {
        self.id = contact.identifier
        self.givenName = contact.givenName
        self.familyName = contact.familyName
        self.jobTitle = contact.jobTitle
        self.imageData = contact.imageData
        self.birthday = contact.birthday
        self.phoneNumbers = contact.phoneNumbers.map { $0.value.stringValue }
        self.isFavourite = false
    }
}

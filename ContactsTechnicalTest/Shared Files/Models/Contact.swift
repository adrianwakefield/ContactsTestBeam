//
//  Contact.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

// MARK: - Individual Contact Representation

struct PartialContact: Hashable, Comparable {
    let id: String
    let givenName: String
    let familyName: String
    var isFavourite: Bool = false
    
    init(id: String, givenName: String, familyName: String) {
        self.id = id
        self.givenName = givenName
        self.familyName = familyName
    }
    
    // Allows sorting based on given name
    static func < (lhs: PartialContact, rhs: PartialContact) -> Bool {
        return lhs.givenName < rhs.givenName
    }
}

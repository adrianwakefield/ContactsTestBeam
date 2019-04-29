//
//  DisplayableContact.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

// MARK: - Contact Data To Be Displayed In Table View Cell

struct DisplayableContact: Comparable {
    let fullName: String
    let favouriteText: String
    let favouriteColor: UIColor
    
    // Allows sorting by full name
    static func < (lhs: DisplayableContact, rhs: DisplayableContact) -> Bool {
        return lhs.fullName < rhs.fullName
    }
}

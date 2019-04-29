//
//  AccessibilityIdentifiers.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

// MARK: - Accessibility Identifiers For UI Testing

struct AccessibilityIdentifiers {
    
    struct ContactsList {
        static let navigationBar = "contactList.navigationBar"
        static let searchField = "contactList.searchField"
        static let contactsTableView = "contactList.contactsTableView"
        static let errorAlert = "contactList.errorAlert"
        
        static func cellIdentifier(section: Int, row: Int) -> String {
            return "contactList.contactsTableView.cell_\(section)_\(row)"
        }
    }
    
    struct ContactDetail {
        static let backButton = "contactDetail.backButton"
        static let favouriteButton = "contactDetail.favouriteButton"
    }
}

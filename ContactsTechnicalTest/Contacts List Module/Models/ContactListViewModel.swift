//
//  ContactListViewModel.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

// MARK: - Raw Contact List View Model Representation

struct ContactListViewModel {
    let headerText: String
    let searchFieldPlaceholder: String
    let contactsToDisplay: [PartialContact]
}

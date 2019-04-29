//
//  ContactDetailDependency.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

// MARK: - Encapsulated Dependencies for Contact Detail Module

struct ContactDetailDependency {
    let contact: PartialContact
    var delegate: ContactDetailDelegate?
}

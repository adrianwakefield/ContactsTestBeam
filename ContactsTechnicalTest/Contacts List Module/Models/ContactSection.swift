//
//  ContactSection.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 19/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

// MARK: - Presentable Contact Section Representation

struct ContactSection: Equatable {
    let headerText: String
    var contacts: [DisplayableContact]
}

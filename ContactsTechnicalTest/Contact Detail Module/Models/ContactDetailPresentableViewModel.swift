//
//  ContactDetailPresentableViewModel.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

// MARK: - Presentable Contact Detail View Model Representation

struct ContactDetailPresentableViewModel {
    let headerTitle: String
    let displayableContact: DisplayableFullContact
    let favouriteText: String
    let favouriteColor: UIColor
}

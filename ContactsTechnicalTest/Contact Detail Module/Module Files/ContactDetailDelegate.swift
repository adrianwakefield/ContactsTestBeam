//
//  ContactDetailDelegate.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

protocol ContactDetailDelegate: class {
    func didUpdateFavouriteStatus(for contactIdentifier: String,
                                  isFavourite: Bool)
}

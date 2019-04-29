//
//  DisplayableFullContact.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 19/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

// MARK: - Full Contact View Presentable Format

struct DisplayableFullContact {
    let name: String
    let jobTitle: String
    let imageData: UIImage?
    let birthday: NSMutableAttributedString
    let phoneNumbers: NSMutableAttributedString
    var isFavourite: Bool
}

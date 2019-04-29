//
//  UIView+Extensions.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

extension UIView {
    
    // - Allows adding of multiple subviews to a parent view
    // - Automatically disables autoresizing masks translation
    func addMultipleSubviews(subviews: [UIView]) {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}

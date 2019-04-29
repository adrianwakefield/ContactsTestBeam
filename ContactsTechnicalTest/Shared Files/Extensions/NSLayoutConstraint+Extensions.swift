//
//  NSLayoutConstraint+Extensions.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    
    // Activates all constraints in an array of constraint arrays
    static func activateAll(constraints: [[NSLayoutConstraint]]) {
        return constraints.forEach { NSLayoutConstraint.activate($0) }
    }
    
    // Deactivates all constraints in an array of constraint arrays
    static func deactivateAll(constraints: [[NSLayoutConstraint]]) {
        return constraints.forEach { NSLayoutConstraint.deactivate($0) }
    }
}

//
//  KeyWindowBuilder.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

class KeyWindowBuilder {
    
    // MARK: - Key Window Construction
    
    // Creates a new window and assigns a root view controller
    static func buildWindow(with rootController: UIViewController) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = UINavigationController(rootViewController: rootController)
        return window
    }
}

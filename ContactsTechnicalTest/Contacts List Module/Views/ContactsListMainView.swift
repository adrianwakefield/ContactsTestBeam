//
//  ContactsListMainView.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

// MARK: - Contacts List Module's Main View

class ContactsListMainView: UIView {
    
    // MARK: - View Properties
    
    let searchField: UITextField = {
        let searchField = UITextField()
        searchField.leftView = UIImageView(image: UIImage(named: ImageIdentifiers.ContactList.searchIcon))
        searchField.leftViewMode = .always
        searchField.returnKeyType = .done
        searchField.accessibilityIdentifier = AccessibilityIdentifiers.ContactsList.searchField
        return searchField
    }()
    
    let contactsTableView: UITableView = {
        let contactsTableView = UITableView()
        contactsTableView.backgroundColor = .white
        contactsTableView.keyboardDismissMode = .interactive
        contactsTableView.accessibilityIdentifier = AccessibilityIdentifiers.ContactsList.contactsTableView
        return contactsTableView
    }()
    
    // MARK: - Lifecycle Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: - Initial Setup
    
    // Configure UI appearance
    private func setupUI() {
        backgroundColor = .white
    }
    
    // MARK: - Views & Constraints Setup
    
    // Add views to view hierarchy
    private func setupViews() {
        addMultipleSubviews(subviews: [searchField,
                                       contactsTableView])
    }
    
    // Add AutoLayout constraints to view elements
    private func setupConstraints() {
        let searchFieldConstraints = [
            searchField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchField.heightAnchor.constraint(equalToConstant: NumericConstants.ContactsList.searchFieldHeight),
            searchField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: NumericConstants.ContactsList.searchFieldWidthPadding),
            searchField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let contactsTableViewConstraints = [
            contactsTableView.topAnchor.constraint(equalTo: searchField.bottomAnchor),
            contactsTableView.widthAnchor.constraint(equalTo: widthAnchor),
            contactsTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contactsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activateAll(constraints: [searchFieldConstraints,
                                                     contactsTableViewConstraints])
    }
}

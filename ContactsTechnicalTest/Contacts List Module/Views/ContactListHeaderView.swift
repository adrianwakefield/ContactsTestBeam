//
//  ContactListHeaderView.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

// MARK: - Contacts List Table Section Header

class ContactListHeaderView: UIView {
    
    // MARK: - Properties
    
    var headerTitle: String? {
        didSet {
            headerLabel.text = headerTitle
        }
    }
    
    // MARK: - View Properties
    
    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        return headerLabel
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
        backgroundColor = Colours.contactsListSectionHeader
    }
    
    // MARK: - Views & Constraints Setup
    
    // Add views to view hierarchy
    private func setupViews() {
        addMultipleSubviews(subviews: [headerLabel])
    }
    
    // Add AutoLayout constraints to view elements
    private func setupConstraints() {
        let headerLabelConstraints = [
            headerLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: NumericConstants.ContactsList.sectionHeaderViewLeadingPadding),
            headerLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: NumericConstants.ContactsList.sectionHeaderViewTrailingPadding),
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerLabel.heightAnchor.constraint(equalTo: heightAnchor)
        ]
        
        NSLayoutConstraint.activateAll(constraints: [headerLabelConstraints])
    }
}

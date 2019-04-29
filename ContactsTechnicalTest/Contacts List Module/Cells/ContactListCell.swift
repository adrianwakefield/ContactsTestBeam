//
//  ContactListCell.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

class ContactListCell: UITableViewCell {
    
    // MARK: - Properties
    
    // Set contact's name
    var contactName: String? {
        didSet {
            contactNameLabel.text = contactName
        }
    }
    
    // Set contact's favourite status text
    var favouriteStatus: String? {
        didSet {
            favouriteStatusLabel.text = favouriteStatus
        }
    }
    
    // Set favourite text colour
    var favouriteColor: UIColor? {
        didSet {
            favouriteStatusLabel.textColor = favouriteColor
        }
    }
    
    // MARK: - View Properties
    
    private let contactNameLabel: UILabel = {
        let contactNameLabel = UILabel()
        contactNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return contactNameLabel
    }()
    
    private let favouriteStatusLabel: UILabel = {
        let favouriteStatusLabel = UILabel()
        favouriteStatusLabel.font = UIFont.systemFont(ofSize: 14)
        favouriteStatusLabel.textColor = .lightGray
        return favouriteStatusLabel
    }()
    
    // MARK: - Lifecycle Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        contentView.backgroundColor = .white
    }
    
    // MARK: - Views & Constraints Setup
    
    // Add views to view hierarchy
    private func setupViews() {
        contentView.addMultipleSubviews(subviews: [contactNameLabel,
                                                   favouriteStatusLabel])
    }
    
    // Add AutoLayout constraints to view elements
    private func setupConstraints() {
        let contactNameLabelConstraints = [
            contactNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: NumericConstants.ContactsList.listCellNameLabelLeadingPadding),
            contactNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: NumericConstants.ContactsList.listCellNameLabelTrailingPadding),
            contactNameLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            contactNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: NumericConstants.ContactsList.listCellNameLabelTopPadding)
        ]
        
        let favouriteStatusLabelConstraints = [
            favouriteStatusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: NumericConstants.ContactsList.listCellFavouriteStatusLabelLeadingPadding),
            favouriteStatusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: NumericConstants.ContactsList.listCellFavouriteStatusLabelTrailingPadding),
            favouriteStatusLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor),
            favouriteStatusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: NumericConstants.ContactsList.listCellFavouriteStatusLabelBottomPadding)
        ]
        
        NSLayoutConstraint.activateAll(constraints: [contactNameLabelConstraints,
                                                     favouriteStatusLabelConstraints])
    }
}

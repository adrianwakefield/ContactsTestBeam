//
//  ContactDetailMainView.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

// MARK: - Contact Detail Module's Main View 

class ContactDetailMainView: UIView {
    
    // MARK: - Properties
    
    // Constraints for different orientations
    private var portraitConstraints = [[NSLayoutConstraint]]()
    private var landscapeConstraints = [[NSLayoutConstraint]]()
    
    // Trigger UI layout for different orientations
    var isPortrait = true {
        didSet {
            setupOrientationConstraints(isPortrait: traitCollection.verticalSizeClass == .regular)
        }
    }
    
    // Callbacks for button tap events
    // - Uses callbacks instead of target/action to allow button UI properties to be kept private
    // - Also allows underlying buttons to be changed (e.g: from UIButton to UIView properties) within code changes needed (satisifies Open/Closed S.O.L.I.D principle)
    var onFavouriteTap: (() -> Void)?
    var onBackTap: (() -> Void)?
    
    var contactFullName: String? {
        didSet {
            nameLabel.text = contactFullName
        }
    }
    
    var contactImage: UIImage? {
        didSet {
            contactImageView.image = contactImage
        }
    }
    
    var jobTitle: String? {
        didSet {
            jobTitleLabel.text = jobTitle
        }
    }
    
    var favouriteStatusTitle: String? {
        didSet {
            favouriteButton.setTitle(favouriteStatusTitle, for: .normal)
        }
    }
    
    var favouriteColor: UIColor? {
        didSet {
            favouriteButton.backgroundColor = favouriteColor
        }
    }
    
    var birthdayText: NSMutableAttributedString? {
        didSet {
            birthdayLabel.attributedText = birthdayText
        }
    }
    
    var phoneNumbersText: NSMutableAttributedString? {
        didSet {
            phoneNumbersLabel.attributedText = phoneNumbersText
        }
    }
    
    // MARK: - View Properties
    
    let backButton: UIButton = {
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: ImageIdentifiers.General.backButton), for: .normal)
        backButton.accessibilityIdentifier = AccessibilityIdentifiers.ContactDetail.backButton
        return backButton
    }()
    
    private let contactImageView: UIImageView = {
        let contactImageView = UIImageView()
        contactImageView.layer.masksToBounds = true
        contactImageView.backgroundColor = .lightGray
        return contactImageView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 35)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.7
        return nameLabel
    }()
    
    private let jobTitleLabel: UILabel = {
        let jobTitleLabel = UILabel()
        jobTitleLabel.textAlignment = .center
        jobTitleLabel.textColor = .gray
        return jobTitleLabel
    }()
    
    private let favouriteButton: UIButton = {
        let favouriteButton = UIButton(type: .system)
        favouriteButton.backgroundColor = .blue
        favouriteButton.setTitleColor(.white, for: .normal)
        favouriteButton.layer.cornerRadius = 5
        favouriteButton.accessibilityIdentifier = AccessibilityIdentifiers.ContactDetail.favouriteButton
        return favouriteButton
    }()
    
    private let birthdayLabel: UILabel = {
        let birthdayLabel = UILabel()
        birthdayLabel.numberOfLines = 0
        return birthdayLabel
    }()
    
    private let phoneNumbersLabel: UILabel = {
        let phoneNumbersLabel = UILabel()
        phoneNumbersLabel.numberOfLines = 0
        return phoneNumbersLabel
    }()
    
    // MARK: - Lifecycle Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupUserInteractionHandlers()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateContactImageCornerRadius()
    }
    
    // MARK: - Initial Setup
    
    // Configure UI appearance
    private func setupUI() {
        backgroundColor = .white
    }
    
    // Setup listeners for UI element interaction events (e.g: button taps)
    private func setupUserInteractionHandlers() {
        favouriteButton.addTarget(self, action: #selector(handleFavouriteButtonTap), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(handleBackButtonTap), for: .touchUpInside)
    }
    
    // Ensures contact image view is circular (using its frame to calculate radius)
    private func updateContactImageCornerRadius() {
        contactImageView.layer.cornerRadius = contactImageView.frame.height / 2
    }
    
    // MARK: - User Interaction Handling
    
    @objc private func handleFavouriteButtonTap() {
        onFavouriteTap?()
    }
    
    @objc private func handleBackButtonTap() {
        onBackTap?()
    }
    
    // MARK: - Views & Constraints Setup
    
    // Add views to view hierarchy
    private func setupViews() {
        addMultipleSubviews(subviews: [contactImageView,
                                       nameLabel,
                                       jobTitleLabel,
                                       favouriteButton,
                                       birthdayLabel,
                                       phoneNumbersLabel])
    }
    
    // Add AutoLayout constraints to view elements
    private func setupConstraints() {
        let contactImageViewConstraintsPortrait = [
            contactImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: NumericConstants.ContactDetail.contactImageViewWidthMultiplier),
            contactImageView.heightAnchor.constraint(equalTo: contactImageView.widthAnchor),
            contactImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contactImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: NumericConstants.ContactDetail.elementSpacing)
        ]
        
        let contactImageViewConstraintsLandscape = [
            contactImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2),
            contactImageView.widthAnchor.constraint(equalTo: contactImageView.heightAnchor),
            contactImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            contactImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20)
        ]
        
        let nameLabelConstraintsPortrait = [
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: NumericConstants.ContactDetail.nameLabelWidthMultiplier),
            nameLabel.heightAnchor.constraint(equalToConstant: nameLabel.font.lineHeight),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: contactImageView.bottomAnchor, constant: NumericConstants.ContactDetail.elementSpacing)
        ]
        
        let nameLabelConstraintsLandscape = [
            nameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: nameLabel.font.lineHeight),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nameLabel.topAnchor.constraint(equalTo: contactImageView.topAnchor)
        ]
        
        let jobTitleLabelConstraintsPortrait = [
            jobTitleLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            jobTitleLabel.heightAnchor.constraint(equalToConstant: jobTitleLabel.font.lineHeight),
            jobTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            jobTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: NumericConstants.ContactDetail.elementSpacing)
        ]
        
        let jobTitleLabelConstraintsLandscape = [
            jobTitleLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            jobTitleLabel.heightAnchor.constraint(equalToConstant: jobTitleLabel.font.lineHeight),
            jobTitleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            jobTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: NumericConstants.ContactDetail.elementSpacing)
        ]
        
        let favouriteButtonConstraintsPortrait = [
            favouriteButton.topAnchor.constraint(equalTo: jobTitleLabel.bottomAnchor, constant: NumericConstants.ContactDetail.elementSpacing),
            favouriteButton.widthAnchor.constraint(equalTo: widthAnchor, constant: NumericConstants.ContactDetail.favouriteButtonWidthPadding),
            favouriteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            favouriteButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let favouriteButtonConstraintsLandscape = [
            favouriteButton.topAnchor.constraint(equalTo: jobTitleLabel.bottomAnchor, constant: NumericConstants.ContactDetail.elementSpacing),
            favouriteButton.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            favouriteButton.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            favouriteButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let birthdayLabelConstraintsPortrait = [
            birthdayLabel.widthAnchor.constraint(equalTo: favouriteButton.widthAnchor),
            birthdayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            birthdayLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: birthdayLabel.font.lineHeight),
            birthdayLabel.topAnchor.constraint(equalTo: favouriteButton.bottomAnchor, constant: NumericConstants.ContactDetail.elementSpacing)
        ]
        
        let birthdayLabelConstraintsLandscape = [
            birthdayLabel.leadingAnchor.constraint(equalTo: favouriteButton.leadingAnchor),
            birthdayLabel.trailingAnchor.constraint(equalTo: favouriteButton.centerXAnchor, constant: -20),
            birthdayLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: birthdayLabel.font.lineHeight),
            birthdayLabel.topAnchor.constraint(equalTo: favouriteButton.bottomAnchor, constant: NumericConstants.ContactDetail.elementSpacing)
        ]
        
        let phoneNumbersLabelConstraintsPortrait = [
            phoneNumbersLabel.widthAnchor.constraint(equalTo: favouriteButton.widthAnchor),
            phoneNumbersLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            phoneNumbersLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: phoneNumbersLabel.font.lineHeight),
            phoneNumbersLabel.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: NumericConstants.ContactDetail.elementSpacing)
        ]
        
        let phoneNumbersLabelConstraintsLandscape = [
            phoneNumbersLabel.leadingAnchor.constraint(equalTo: favouriteButton.centerXAnchor, constant: 20),
            phoneNumbersLabel.trailingAnchor.constraint(equalTo: favouriteButton.trailingAnchor),
            phoneNumbersLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: phoneNumbersLabel.font.lineHeight),
            phoneNumbersLabel.topAnchor.constraint(equalTo: birthdayLabel.topAnchor)
        ]
        
        portraitConstraints = [contactImageViewConstraintsPortrait,
                                  nameLabelConstraintsPortrait,
                                  jobTitleLabelConstraintsPortrait,
                                  favouriteButtonConstraintsPortrait,
                                  birthdayLabelConstraintsPortrait,
                                  phoneNumbersLabelConstraintsPortrait]
        
        landscapeConstraints = [contactImageViewConstraintsLandscape,
                                    nameLabelConstraintsLandscape,
                                    jobTitleLabelConstraintsLandscape,
                                    favouriteButtonConstraintsLandscape,
                                    birthdayLabelConstraintsLandscape,
                                    phoneNumbersLabelConstraintsLandscape]
    }
    
    // Handles updating constraints for different view orientations
    func setupOrientationConstraints(isPortrait: Bool) {
        NSLayoutConstraint.deactivateAll(constraints: isPortrait ? landscapeConstraints : portraitConstraints)
        NSLayoutConstraint.activateAll(constraints: isPortrait ? portraitConstraints : landscapeConstraints)
    }
}

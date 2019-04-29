//
//  ContactDetailViewController.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    // MARK: - External Depedencies
    
    private let interactorInput: ContactDetailInteractorInput
    
    // MARK: - View Properties
    
    private let mainView = ContactDetailMainView()
    
    // MARK: - Lifecycle Methods
    
    init(interactorInput: ContactDetailInteractorInput) {
        self.interactorInput = interactorInput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserInteractionHandlers()
        interactorInput.handleViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    // Handle device orientation changes
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        mainView.isPortrait = (traitCollection.verticalSizeClass == .regular)
    }
    
    // MARK: - View Configuration
    
    // Set default view to custom main view
    override func loadView() {
        view = mainView
    }
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: mainView.backButton)
    }
    
    // MARK: - User Interaction Handling
    
    // Propogate user interaction events to interactor
    private func setupUserInteractionHandlers() {
        mainView.onFavouriteTap = { [weak self] in
            self?.interactorInput.handleFavouriteTap()
        }
        
        mainView.onBackTap = { [weak self] in
            self?.interactorInput.handleBackButtonTap()
        }
    }
}

// MARK: - Handle Presenter Output

extension ContactDetailViewController: ContactDetailPresenterOutput {
    
    // Display an error alert popup
    func handleDisplayError(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Strings.General.ok, style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // Set view property values from presentable view model
    func handleDisplayViewModel(presentableViewModel: ContactDetailPresentableViewModel) {
        title = presentableViewModel.headerTitle
        mainView.favouriteStatusTitle = presentableViewModel.favouriteText
        mainView.favouriteColor = presentableViewModel.favouriteColor
        mainView.contactFullName = presentableViewModel.displayableContact.name
        mainView.jobTitle = presentableViewModel.displayableContact.jobTitle
        mainView.birthdayText = presentableViewModel.displayableContact.birthday
        mainView.phoneNumbersText = presentableViewModel.displayableContact.phoneNumbers
    }
    
    // Update favourite button state
    func handleDisplayFavouriteStatusChange(favouriteText: String, favouriteColour: UIColor) {
        mainView.favouriteStatusTitle = favouriteText
        mainView.favouriteColor = favouriteColour
    }
}

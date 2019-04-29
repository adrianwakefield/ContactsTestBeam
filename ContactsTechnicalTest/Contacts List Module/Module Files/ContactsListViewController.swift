//
//  ContactsListViewController.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

class ContactsListViewController: UIViewController {
    
    // MARK: - External Dependencies
    
    private let interactorInput: ContactsListInteractorInput
    
    // MARK: - View Properties
    
    private let mainView = ContactsListMainView()
    
    // MARK: - Controller Properties
    
    private var presentableViewModel: ContactListPresentableViewModel? {
        didSet {
            // Set UI elements data from view model
            title = presentableViewModel?.headerText
            mainView.searchField.placeholder = presentableViewModel?.searchFieldPlaceholder
            mainView.contactsTableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle Methods
    
    init(interactorInput: ContactsListInteractorInput) {
        self.interactorInput = interactorInput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContactsListTableView()
        setupContactsListSearchBar()
        interactorInput.handleViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }
    
    // MARK: - View Configuration
    
    override func loadView() {
        view = mainView
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.accessibilityIdentifier = AccessibilityIdentifiers.ContactsList.navigationBar
    }
    
    // MARK: - Initial Setup
    
    // - Register Table View Cell
    // - Set data source and delegate
    private func setupContactsListTableView() {
        mainView.contactsTableView.register(ContactListCell.self)
        mainView.contactsTableView.dataSource = self
        mainView.contactsTableView.delegate = self
    }
    
    // Set search field delegate
    private func setupContactsListSearchBar() {
        mainView.searchField.delegate = self
    }
    
    // MARK: - Keyboard Handling
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        interactorInput.handleKeyboardWillShow(notification: notification)
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        interactorInput.handleKeyboardWillHide(notification: notification)
    }
}

// MARK: - Search Bar Text Field Delegate Methods

extension ContactsListViewController: UITextFieldDelegate {
    
    // Handle initial text field focus (begin editing)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        interactorInput.handleUpdatedSearchTerm(searchTerm: "")
    }
    
    // Handle updated text entry in contacts search field
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        // Get newly entered search term from text field
        guard let currentText = textField.text else { return true }
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        if textField == mainView.searchField {
            // Propagate updated search term to interactor
            interactorInput.handleUpdatedSearchTerm(searchTerm: newText)
        }
        
        return true
    }
    
    // Handle text field end of focus (stop editing)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mainView.searchField.text = ""
        interactorInput.handleUpdatedSearchTerm(searchTerm: "")
        view.endEditing(true)
        return false
    }
}

// MARK: - Table View Data Source Methods

extension ContactsListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presentableViewModel?.contactSections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presentableViewModel?.contactSections[section].contacts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentContact = presentableViewModel?.contactSections[indexPath.section].contacts[indexPath.row]
        let cell = tableView.dequeue(ContactListCell.self, for: indexPath)
        cell.accessibilityIdentifier = AccessibilityIdentifiers.ContactsList.cellIdentifier(section: indexPath.section,
                                                                                            row: indexPath.row)
        cell.contactName = currentContact?.fullName
        cell.favouriteStatus = currentContact?.favouriteText
        cell.favouriteColor = currentContact?.favouriteColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return NumericConstants.ContactsList.sectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NumericConstants.ContactsList.tableRowHeight
    }
}

// MARK: - Table View Delegate Methods

extension ContactsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ContactListHeaderView()
        headerView.headerTitle = presentableViewModel?.contactSections[section].headerText
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainView.searchField.text?.removeAll()
        interactorInput.handleSelectedCell(at: indexPath)
        view.endEditing(true)
    }
}

// MARK: - Handle Presenter Output

extension ContactsListViewController: ContactsListPresenterOutput {
    
    func handleDisplayPresentableViewModel(presentableViewModel: ContactListPresentableViewModel) {
        self.presentableViewModel = presentableViewModel
    }
    
    func handleDisplayErrorMessage(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Strings.General.ok, style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // Handle updating of table view inset to not be hidden behind keyboard
    func handleKeyboardChangeEvent(newBottomContentInset: CGFloat) {
        mainView.contactsTableView.contentInset = UIEdgeInsets(top: 0,
                                                               left: 0,
                                                               bottom: newBottomContentInset,
                                                               right: 0)
    }
}

// MARK: - Contact Detail Delegate Methods

extension ContactsListViewController: ContactDetailDelegate {
    
    // Propagate new favourite status to interactor
    func didUpdateFavouriteStatus(for contactIdentifier: String, isFavourite: Bool) {
        interactorInput.handleUpdatedFavouriteStatus(contactIdentifier: contactIdentifier,
                                                     isFavourite: isFavourite)
    }
}

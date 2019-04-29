//
//  ContactDetailInteractorOutputAssembler.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

class ContactDetailInteractorOutputAssembler {
    
    // MARK: - Properties
    
    private let outputs: [ContactDetailInteractorOutput]
    
    // MARK: - Lifecycle Methods
    
    init(outputs: [ContactDetailInteractorOutput]) {
        self.outputs = outputs
    }
}

// MARK: - Handle Output Propogation

extension ContactDetailInteractorOutputAssembler: ContactDetailInteractorOutput {
    
    func handleLoadedViewModel(viewModel: ContactDetailViewModel) {
        outputs.forEach { $0.handleLoadedViewModel(viewModel: viewModel) }
    }
    
    func handleBack(isFavourite: Bool, contactIdentifier: String) {
        outputs.forEach { $0.handleBack(isFavourite: isFavourite, contactIdentifier: contactIdentifier) }
    }
    
    func handleLoadContactError(error: FetchContactsError) {
        outputs.forEach { $0.handleLoadContactError(error: error) }
    }
    
    func handleFavouriteStatusChange(isFavourite: Bool) {
        outputs.forEach { $0.handleFavouriteStatusChange(isFavourite: isFavourite) }
    }
}


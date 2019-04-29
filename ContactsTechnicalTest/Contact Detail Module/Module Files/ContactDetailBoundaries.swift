//
//  ContactDetailBoundaries.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

// MARK: - Interactor Input/Output

protocol ContactDetailInteractorInput {
    func handleViewDidLoad()
    func handleBackButtonTap()
    func handleFavouriteTap()
}

protocol ContactDetailInteractorOutput {
    func handleLoadedViewModel(viewModel: ContactDetailViewModel)
    func handleBack(isFavourite: Bool, contactIdentifier: String)
    func handleLoadContactError(error: FetchContactsError)
    func handleFavouriteStatusChange(isFavourite: Bool)
}

// MARK: - Presenter Output

protocol ContactDetailPresenterOutput: class {
    func handleDisplayViewModel(presentableViewModel: ContactDetailPresentableViewModel)
    func handleDisplayError(message: String)
    func handleDisplayFavouriteStatusChange(favouriteText: String,
                                            favouriteColour: UIColor)
}

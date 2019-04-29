//
//  ContactsListBuilder.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

class ContactsListBuilder {
    
    // MARK: - Module Construction
    
    // - Inject all necessary dependencies and 'glue' all 'Contacts List' module classes together
    // - Returns 'Contacts List' view controller
    static func buildModule() -> UIViewController {
        let authorizationService = ContactsLocalAuthorizationService()
        let dataStore = ContactsListLocalDataStore()
        let contactFetchService = ContactsLocalFetcherService()
        let presenter = ContactsListPresenter()
        let router = ContactsListRouter()
        let interactorOutput = ContactsListInteractorOutputAssembler(outputs: [presenter, router])
        let interactorInput = ContactsListInteractor(interactorOutput: interactorOutput,
                                                     contactAuthorizationService: authorizationService,
                                                     contactFetcherService: contactFetchService,
                                                     dataStore: dataStore)
        let viewController = ContactsListViewController(interactorInput: interactorInput)
        presenter.presenterOutput = viewController
        router.controller = viewController
        return viewController
    }
}

//
//  ContactDetailBuilder.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

class ContactDetailBuilder {
    
    // MARK: - Module Construction
    
    // - Inject all necessary dependencies and 'glue' all 'Contact Detail' module classes together
    // - Returns 'Contact Detail' view controller
    static func buildModule(with dependency: ContactDetailDependency) -> UIViewController {
        let contactsFetcherService = ContactsLocalFetcherService()
        let presenter = ContactDetailPresenter()
        let router = ContactDetailRouter(delegate: dependency.delegate)
        let interactorOutput = ContactDetailInteractorOutputAssembler(outputs: [presenter, router])
        let interactorInput = ContactDetailInteractor(interactorOutput: interactorOutput,
                                                      contactsFetcherService: contactsFetcherService,
                                                      contact: dependency.contact)
        let viewController = ContactDetailViewController(interactorInput: interactorInput)
        presenter.presenterOutput = viewController
        router.controller = viewController
        return viewController
    }
}

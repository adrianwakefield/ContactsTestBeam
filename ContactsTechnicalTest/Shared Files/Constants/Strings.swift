//
//  Strings.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import Foundation

// MARK: - Namespace-Separated Localisable Strings

struct Strings {
    
    struct General {
        static let ok = NSLocalizedString("general.ok",
                                          value: "OK",
                                          comment: "General ok button title.")
        static let unknownErorrMessage = NSLocalizedString("general.unknownErrorMessage",
                                                           value: "Something went wrong.",
                                                           comment: "Generic error message.")
    }
    
    struct ContactList {
        static let headerTitle = NSLocalizedString("contactList.headerTitle",
                                                   value: "My Contacts",
                                                   comment: "Contact List navigation title header text.")
        static let searchFieldPlaceholder = NSLocalizedString("contactList.searchFieldPlaceholder",
                                                              value: "Enter a search term...",
                                                              comment: "Contact List search field placeholder text.")
        static let favouritedText = NSLocalizedString("contactList.favouritedText",
                                                      value: "Favourited",
                                                      comment: "Subtitle favourite text in contact list.")
        static let notFavouritedText = NSLocalizedString("contactList.notFavouritedText",
                                                      value: "Not Favourited",
                                                      comment: "Subtitle not favourite text in contact list.")
        static let authorizationError = NSLocalizedString("contactList.authorizationError",
                                                          value: "You must give permission to access your contacts.",
                                                          comment: "Fetch contacts no authorisation error message.")
        static let fetchFailureError = NSLocalizedString("contactList.fetchFailureError",
                                                         value: "Something went wrong whilst fetching your contacts.",
                                                         comment: "Error occurred during contacts fetch error message.")
    }
    
    struct ContactDetail {
        static let headerTitle = NSLocalizedString("contactDetail.headerTitle",
                                                   value: "Contact Details",
                                                   comment: "Contact Detail navigation title header text.")
        static let favouriteTitleIsNotFavourited = NSLocalizedString("contactDetail.favouriteTitleIsNotFavourited",
                                                                     value: "Add To Favourites",
                                                                     comment: "Contact Detail not favourited title.")
        static let favouriteTitleIsFavourited = NSLocalizedString("contactDetail.favouriteTitleIsFavourited",
                                                                  value: "Remove From Favourites",
                                                                  comment: "Contact Detail already favourited title.")
        static let individualContactFetchError = NSLocalizedString("contactList.individualContactFetchError",
                                                                   value: "Something went wrong whilst trying to load the selected contact.",
                                                                   comment: "Error occurred during fetch of full individual contact error message.")
        static let birthdayHeader = NSLocalizedString("contactDetail.birthdayHeader",
                                                      value: "Birthday\n",
                                                      comment: "Attributed string header for Contact Detail birthday text.")
        static let noBirthdayProvidedText = NSLocalizedString("contactDetail.noBirthdayProvidedText",
                                                          value: "No Birthday Provided",
                                                          comment: "Default text when no birthday is found for a contact.")
        static let phoneNumbersHeader = NSLocalizedString("contactDetail.phoneNumbersHeader",
                                                          value: "Phone Numbers\n",
                                                          comment: "Attributed string header for Contact Detail phone numbers text.")
        static let noPhoneNumbersProvidedText = NSLocalizedString("contactDetail.noPhoneNumbersProvidedText",
                                                                  value: "No Phone Numbers Provided",
                                                                  comment: "Default text when no phone numbers are found for a contact.")
        static let noJobTitleProvidedText = NSLocalizedString("contactDetail.noJobTitleProvidedText",
                                                              value: "No Job Title Provided",
                                                              comment: "Default text when no job title is found for a contact.")
    }
}

//
//  ContactDetailPresenter.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import UIKit

class ContactDetailPresenter {
    
    // MARK: - External Dependencies
    
    weak var presenterOutput: ContactDetailPresenterOutput?
    
    // MARK: - Formatting Logic
    
    // Converts a birthday date to a dispayable birthday detail string
    private func convertBirthdayToText(birthday: Date?) -> NSMutableAttributedString {
        let attributedBirthdayString = NSMutableAttributedString(string: Strings.ContactDetail.birthdayHeader,
                                                                 attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)])
        guard let birthday = birthday else {
            let attributedDateString = NSMutableAttributedString(string: Strings.ContactDetail.noBirthdayProvidedText)
            attributedBirthdayString.append(attributedDateString)
            return attributedBirthdayString
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let attributedDateString = NSMutableAttributedString(string: dateFormatter.string(from: birthday))
        attributedBirthdayString.append(attributedDateString)
        return attributedBirthdayString
    }
    
    // Converts phone number(s) to a dispayable phone numbers detail string
    private func convertPhoneNumbersToText(phoneNumbers: [String]) -> NSMutableAttributedString {
        let attributedPhoneNumbersHeaderString = NSMutableAttributedString(string: Strings.ContactDetail.phoneNumbersHeader,
                                                                 attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)])
        guard !phoneNumbers.isEmpty else {
            let attributedNumbersString = NSMutableAttributedString(string: Strings.ContactDetail.noPhoneNumbersProvidedText)
            attributedPhoneNumbersHeaderString.append(attributedNumbersString)
            return attributedPhoneNumbersHeaderString
        }
        
        let attributedNumbersString = NSMutableAttributedString(string: phoneNumbers.joined(separator: "\n"))
        attributedPhoneNumbersHeaderString.append(attributedNumbersString)
        return attributedPhoneNumbersHeaderString
    }
}

// MARK: - Handle Interactor Output

extension ContactDetailPresenter: ContactDetailInteractorOutput {
    
    // Convert view model to presentable view model
    func handleLoadedViewModel(viewModel: ContactDetailViewModel) {
        // Get presentable favourite button styling
        let favouriteText = viewModel.isFavourite ? Strings.ContactDetail.favouriteTitleIsFavourited : Strings.ContactDetail.favouriteTitleIsNotFavourited
        let favouriteColor = viewModel.isFavourite ? Colours.favouritedRed : Colours.nonFavouritedBlue
        
        // Get presentable contact properties
        let convertedFullName = viewModel.contact.givenName + " " + viewModel.contact.familyName
        let convertedImage: UIImage? = viewModel.contact.imageData != nil ? UIImage(data: viewModel.contact.imageData!) : nil
        let convertedJobTitle = viewModel.contact.jobTitle.isEmpty ? Strings.ContactDetail.noJobTitleProvidedText : viewModel.contact.jobTitle
        let convertedBirthday = convertBirthdayToText(birthday: viewModel.contact.birthday?.date)
        let convertedPhoneNumbers = convertPhoneNumbersToText(phoneNumbers: viewModel.contact.phoneNumbers)
        
        // Create displayable contact
        let displayableContact = DisplayableFullContact(name: convertedFullName,
                                                        jobTitle: convertedJobTitle,
                                                        imageData: convertedImage,
                                                        birthday: convertedBirthday,
                                                        phoneNumbers: convertedPhoneNumbers,
                                                        isFavourite: viewModel.isFavourite)

        // Create and propagate presentable view model to presenter output
        let presentableViewModel = ContactDetailPresentableViewModel(headerTitle: viewModel.headerTitle,
                                                                     displayableContact: displayableContact,
                                                                     favouriteText: favouriteText,
                                                                     favouriteColor: favouriteColor)
        presenterOutput?.handleDisplayViewModel(presentableViewModel: presentableViewModel)
    }
    
    // - Convert error to displayable error message
    // - Propagate error to presenter output
    func handleLoadContactError(error: FetchContactsError) {
        presenterOutput?.handleDisplayError(message: error.localizedDescription)
    }
    
    // Propagate favourite button styling based on favourite status change
    func handleFavouriteStatusChange(isFavourite: Bool) {
        let favouriteText = isFavourite ? Strings.ContactDetail.favouriteTitleIsFavourited : Strings.ContactDetail.favouriteTitleIsNotFavourited
        let favouriteColor = isFavourite ? Colours.favouritedRed : Colours.nonFavouritedBlue
        presenterOutput?.handleDisplayFavouriteStatusChange(favouriteText: favouriteText,
                                                            favouriteColour: favouriteColor)
    }
    
    func handleBack(isFavourite: Bool, contactIdentifier: String) {
        // No-op: handled in Router
    }
}

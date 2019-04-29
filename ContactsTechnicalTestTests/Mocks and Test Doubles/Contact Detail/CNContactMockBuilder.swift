//
//  CNContactMockBuilder.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

import Contacts

class CNContactMockBuilder {
    
    static func buildMock() -> CNContact {
        let cnContactMock = CNMutableContact()
        cnContactMock.imageData = Data()
        cnContactMock.givenName = "John"
        cnContactMock.familyName = "Smith"
        cnContactMock.jobTitle = "Programmer"
        cnContactMock.birthday = DateComponents(year: 1990, month: 12, day: 10)
        cnContactMock.phoneNumbers = [CNLabeledValue<CNPhoneNumber>(label: CNLabelHome,
                                                                    value: CNPhoneNumber(stringValue: "123456")),
                                      CNLabeledValue<CNPhoneNumber>(label: CNLabelWork,
                                                                    value: CNPhoneNumber(stringValue: "654321"))]
        return cnContactMock as CNContact
    }
}

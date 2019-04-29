//
//  DisplayableContactMockBuilder.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

@testable import ContactsTechnicalTest

class DisplayableContactMockBuilder {
    
    static func buildMock() -> DisplayableContact {
        return DisplayableContact(fullName: "John Smith", favouriteText: "Favourited", favouriteColor: .green)
    }
    
    static func buildComparableMock() -> DisplayableContact {
        return DisplayableContact(fullName: "Bob Jones", favouriteText: "Favourited", favouriteColor: .green)
    }
}

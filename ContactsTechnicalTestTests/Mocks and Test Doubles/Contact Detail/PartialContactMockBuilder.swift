//
//  PartialContactMockBuilder.swift
//  ContactsTechnicalTestTests
//
//  Created by Adrian Wakefield on 21/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

@testable import ContactsTechnicalTest

class PartialContactMockBuilder {
    
    static func buildMock() -> PartialContact {
        return PartialContact(id: "abc", givenName: "John", familyName: "Smith")
    }
    
    static func buildComparableMock() -> PartialContact {
        return PartialContact(id: "123", givenName: "Bob", familyName: "Jones")
    }
    
    static func buildMultipleMocks() -> [PartialContact] {
        let mock1 = buildMock()
        let mock2 = buildComparableMock()
        return [mock1, mock2]
    }
}

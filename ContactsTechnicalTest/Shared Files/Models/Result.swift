//
//  Result.swift
//  ContactsTechnicalTest
//
//  Created by Adrian Wakefield on 18/4/19.
//  Copyright © 2019 Adrian Wakefield. All rights reserved.
//

// MARK: - Generic Result Type

enum Result<SuccessType, ErrorType: Error> {
    case success(SuccessType)
    case failure(ErrorType)
}

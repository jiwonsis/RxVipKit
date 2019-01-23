//
//  DictionaryToUserTransformerMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 23/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation

@testable import RxVipKit

struct DictionaryToTestModelTransformerMock {
}

// MARK: Transformer

extension DictionaryToTestModelTransformerMock: Transformer {
    func transform(object: [String: String]) throws -> TestEntityMock {
        guard
            let name = object["name"],
            let surname = object["surname"],
            let age = object["age"]
            else {
                throw DefaultAppError(messageKey: "error.global")
        }

        return TestEntityMock(name: name, surname: surname, age: age)
    }

}

//
//  ModelMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 23/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

@testable import RxVipKit

struct TestEntityMock: Deserializable {
    let name: String
    let surname: String
    let age: String

    fileprivate enum Key {
        static let args = "args"
        static let name = "name"
        static let surname = "surname"
        static let age = "age"
    }
}

extension TestEntityMock: AnyInitializable {
    init(object: Any) throws {
        guard
            let dictionary = object as? [String: Any],
            let args = dictionary[Key.args] as? [String: Any]
            else {
                throw DeserializationAppError(developerMessage: "[TestEntityMock] - Not a dictionary")
        }

        guard
            let name = args[Key.name] as? String,
            let surname = args[Key.surname] as? String,
            let age = args[Key.age] as? String
            else {
                throw DeserializationAppError(developerMessage: "[TestEntityMock] - Missing value")
        }

        self.name = name
        self.surname = surname
        self.age = age
    }
}

extension TestEntityMock: Equatable {
}

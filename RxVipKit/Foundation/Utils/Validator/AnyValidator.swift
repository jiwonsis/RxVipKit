//
//  AnyValidator.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public struct AnyValidator<Object, Error>: Validator {
    private let _validate: (Object) -> Error?

    // MARK: Initializer

    public init<V: Validator>(base: V) where V.Object == Object, V.Error == Error {
        _validate = base.validate
    }

    // MARK: Validator

    public func validate(object: Object) -> Error? {
        return _validate(object)
    }
}

//
//  IntValidator.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public struct IntValueValidator {
    private enum Constant {
        static let messageKey = "error.int"
    }
}

// MARK: Validator

extension IntValueValidator: Validator {
    public func validate(object: String) -> DefaultAppError? {
        if object.count == 0 {
            return nil
        }

        if nil != Int(object) {
            return nil
        }

        return DefaultAppError(messageKey: Constant.messageKey)
    }
}

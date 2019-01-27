//
//  TextFiledValueValidator.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public struct TextFieldValueValidator {
    private let minCharator: Int
    private let maxCharator: Int

    private enum Constant {
        static let messageKey = "error.count_limit"
    }

    // MARK: Initializer
    init(minCharator: Int, maxCharator: Int) {
        self.minCharator = minCharator
        self.maxCharator = maxCharator
    }
}

extension TextFieldValueValidator: Validator {

    public func validate(object: String) -> DefaultAppError? {
        if object.count > minCharator && object.count < maxCharator {
            return nil
        }

        return DefaultAppError(messageKey: Constant.messageKey)
    }
}

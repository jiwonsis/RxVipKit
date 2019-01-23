//
//  DeserializationAppError.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 22/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

struct DeserializationAppError {

    private let developerMessage: String

    private enum Constant {
        static let translationKey = "error.global"
    }

    // MARK: Initializer

    public init(developerMessage: String) {
        self.developerMessage = developerMessage
    }

}

// MARK: AppError

extension DeserializationAppError: AppError {

    public var raw: Error? {
        return nil
    }

    public var messageKey: String {
        return Constant.translationKey
    }

}

//
//  DeserializationAppError.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 22/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

struct SerializationAppError {
    private let error: Error?

    private enum Constant {
        static let translationKey = "error.global.default"
    }

    // MARK: Intializer

    init(error: Error?) {
        self.error = error
    }

}

// MARK: AppError

extension SerializationAppError: AppError {

    public var raw: Error? {
        return nil
    }

    public var messageKey: String {
        return Constant.translationKey
    }

}

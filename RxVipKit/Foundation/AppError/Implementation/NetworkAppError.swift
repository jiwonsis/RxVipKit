//
//  DeserializationAppError.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 22/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

struct NetworkAppError {
    private let error: Error?

    private enum Constant {
        static let translationKey = "error.global.network"
    }

    // MARK: Intializer

    init(error: Error?) {
        self.error = error
    }

}

// MARK: AppError

extension NetworkAppError: AppError {

    public var raw: Error? {
        return nil
    }

    public var messageKey: String {
        return Constant.translationKey
    }

}

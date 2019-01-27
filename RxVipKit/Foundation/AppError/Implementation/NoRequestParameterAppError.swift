//
//  DeserializationAppError.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 22/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public struct NoRequestParameterAppError {

    private enum Constant {
        static let translationKey = "error.global.default"
    }

    public init() {}

}

// MARK: AppError

extension NoRequestParameterAppError: AppError {

    public var raw: Error? {
        return nil
    }

    public var messageKey: String {
        return Constant.translationKey
    }

}

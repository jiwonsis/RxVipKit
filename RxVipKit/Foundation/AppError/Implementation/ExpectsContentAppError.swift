//
//  ExpectsContentAppError.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 23/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public struct ExpectsContentAppError {
    private enum Constant {
        static let translationKey = "error.global"
    }

    public init() {}
}

// MARK: AppError

extension ExpectsContentAppError: AppError {

    public var raw: Error? {
        return nil
    }

    public var messageKey: String {
        return Constant.translationKey
    }
}

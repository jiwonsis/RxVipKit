//
//  ExpectsContentAppError.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 23/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

struct ExpectsContentAppError {
    private enum Constant {
        static let translationKey = "error.global"
    }
}

// MARK: AppError

extension ExpectsContentAppError: AppError {

    var raw: Error? {
        return nil
    }

    var messageKey: String {
        return Constant.translationKey
    }
}

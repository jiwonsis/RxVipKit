//
//  DeserializationAppError.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 22/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

struct DefaultAppError {
    private let _messageKey: String

    // MARK: Initializer

    init(messageKey: String) {
        _messageKey = messageKey
    }

}

// MARK: AppError

extension DefaultAppError: AppError {

    public var raw: Error? {
        return nil
    }

    public var messageKey: String {
        return _messageKey
    }

}

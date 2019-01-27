//
//  AppEventResponse.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 26/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public struct AppEventResponse {
    private let _code: EventResponseCode
    private let _error: Error?
    private let _data: [String: Any]?

    // MARK: Initializer

    init(code: EventResponseCode, error: Error? = nil, data: [String: Any]? = nil) {
        _code = code
        _error = error
        _data = data
    }
}

// MARK: EventResponse

extension AppEventResponse: EventResponse {

    public func data<T>(named: String) -> T? {
        return self.data?[named] as? T
    }

    public var succeed: Bool {
        return nil == error
    }

    public var error: Error? {
        return _error
    }

    public var data: [String: Any]? {
        return _data
    }

    public var code: EventResponseCode {
        return _code
    }
}

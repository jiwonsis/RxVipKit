//
//  EventRequest.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 22/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation

public struct EventRequest {
    private let _path: String?
    private let _parameters: [String: String]?
    private let _data: [String: Any]?
    private let _action: AppAction

    // MARK: Initializer

    public init(path: String? = nil, parameters: [String: String]? = nil, data: [String: Any]? = nil, action: AppAction) {
        _path = path
        _parameters = parameters
        _data = data
        _action = action
    }
}

// MARK: - Public
extension EventRequest {

    public var path: String? {
        return _path
    }

    public var parameters: [String: String]? {
        return _parameters
    }

    public var action: AppAction {
        return _action
    }

    public var data: [String: Any]? {
        return _data
    }

    public func parameter(named: String) -> String? {
        return parameters?[named]
    }

    public func dataValue<T>() -> T? {
        return data?[EventParameterKey.value] as? T
    }
}

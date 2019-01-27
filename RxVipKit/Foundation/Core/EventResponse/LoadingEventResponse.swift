//
//  LoadingEventResponse.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 26/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public struct LoadingEventResponse {
    private enum Constant {
        static let data = [EventParameterKey.viewState: ViewState.loading]
    }

    public init() {}
}

// MARK: EventResponse

extension LoadingEventResponse: EventResponse {

    public func data<T>(named: String) -> T? {
        return Constant.data[named] as? T
    }

    public var succeed: Bool {
        return true
    }

    public var data: [String: Any]? {
        return Constant.data
    }

    public var error: Error? {
        return nil
    }

    public var code: EventResponseCode {
        return .processing
    }
}

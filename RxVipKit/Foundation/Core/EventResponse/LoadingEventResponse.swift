//
//  LoadingEventResponse.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 26/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

struct LoadingEventResponse {}

// MARK: EventResponse

extension LoadingEventResponse: EventResponse {
    var succeed: Bool {
        return true
    }

    var data: [String: Any]? {
        return [
            EventParameterKey.viewState: ViewState.loading,
        ]
    }

    var error: Error? {
        return nil
    }

    var code: EventResponseCode {
        return .processing
    }
}

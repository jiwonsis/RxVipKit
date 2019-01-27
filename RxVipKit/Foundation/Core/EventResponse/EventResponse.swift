//
//  EventResponse.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 26/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

protocol EventResponse {
    var succeed: Bool { get }
    var data: [String: Any]? { get }
    var error: Error? { get }
    var code: EventResponseCode { get }

    func data<T>(named: String) -> T?
}

extension EventResponse {
    func data<T>(named: String) -> T? {
        return self.data?[named] as? T
    }

    func dataValue<T>() -> T? {
        return self.data(named: EventParameterKey.value)
    }

    func dataViewState() -> ViewState? {
        return self.data(named: EventParameterKey.viewState)
    }
}

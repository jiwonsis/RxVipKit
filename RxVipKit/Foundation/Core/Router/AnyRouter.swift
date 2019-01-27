//
//  AnyRouter.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

public final class AnyRouter<Object>: Router {
    private let _callback: () -> Observable<Object>
    private let _route: (UIViewController?, EventRequest) -> Observable<EventResponse>

    // MARK: Initializer

    public init<R: Router>(base: R) where R.Object == Object {
        _callback = {
            return base.callback
        }
        _route = base.route
    }

    // MARK: Router

    public var callback: Observable<Object> {
        return _callback()
    }

    public func route(from root: UIViewController?, request: EventRequest) -> Observable<EventResponse> {
        return _route(root, request)
    }
}

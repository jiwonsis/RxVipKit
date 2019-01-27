//
//  AnyViewType.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift
import RxCocoa

public final class AnyViewType<ViewModel>: ViewType {
    private let _view: () -> UIView
    private let _request: () -> Observable<EventRequest>
    private let _update: (Driver<ViewModel>) -> Void

    // MARK: Initializer

    init<V: ViewType>(base: V) where V.ViewModel == ViewModel {
        _view = {
            return base.view
        }

        _request = base.request
        _update = base.update
    }

    // MARK: ViewType

    public var view: UIView {
        return _view()
    }

    public func request() -> Observable<EventRequest> {
        return _request()
    }

    public func update(with stateProvider: Driver<ViewModel>) {
        return _update(stateProvider)
    }
}

//
//  AnyPresenter.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

final class AnyPresenter<ViewModel>: Presenter {
    private let _handle: (EventResponse) -> ViewModel

    // MARK: Initializer

    init<P: Presenter>(base: P) where P.ViewModel == ViewModel {
        _handle = base.handle
    }

    // MARK: Presenter

    func handle(response: EventResponse) -> ViewModel {
        return _handle(response)
    }
}
//
//  Presenter.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public protocol Presenter {
    associatedtype ViewModel

    func handle(response: EventResponse) -> ViewModel
}

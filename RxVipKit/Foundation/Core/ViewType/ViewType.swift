//
//  ViewType.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 26/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

public protocol ViewType {
    associatedtype ViewModel

    var view: UIView { get }

    func request() -> Observable<EventRequest>
    func update(with provider: Driver<ViewModel>)
}

extension ViewType where Self: UIView {
    var view: UIView {
        return self
    }
}

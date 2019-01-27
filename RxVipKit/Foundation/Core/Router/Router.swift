//
//  Router.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxSwift

protocol Router {
    associatedtype Object

    var callback: Observable<Object> { get }

    func route(from root: UIViewController?, request: EventRequest) -> Observable<EventResponse>
}

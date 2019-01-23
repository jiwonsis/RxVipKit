//
//  Interactor.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 22/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

protocol Interactor {
    func handle(request: EventRequest) -> Observable<EventRequest>
}

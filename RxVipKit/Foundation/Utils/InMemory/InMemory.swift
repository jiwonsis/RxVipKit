//
//  InMemory.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

public protocol InMemory {
    associatedtype Object

    var value: Object { get }
    var rxValue: Observable<Object> { get }

    func update(with object: Object) -> Observable<Object>
}

//
//  AppInMemory.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

final class AppInMemory<T>: InMemory {
    private(set) var value: T

    // MARK: Initializer

    init(defaultValue: T) {
        value = defaultValue
    }

    // MARK: InMemory

    func update(with object: T) -> Observable<T> {
        value = object

        return Observable.just(value)
    }

    var rxValue: Observable<T> {
        return Observable.just(value)
    }
}

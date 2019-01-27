//
//  AppInMemory.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

public final class AppInMemory<T>: InMemory {
    private(set) public var value: T

    // MARK: Initializer

    public init(defaultValue: T) {
        value = defaultValue
    }

    // MARK: InMemory

    public func update(with object: T) -> Observable<T> {
        value = object

        return Observable.just(value)
    }

    public var rxValue: Observable<T> {
        return Observable.just(value)
    }
}

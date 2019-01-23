//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import RxSwift

final class InterceptorChain<T> {
    private var _interceptors: [AnyInterceptor<T>]

    public var input: T?
    // MARK: Initializer

    public convenience init() {
        self.init(interceptors: [AnyInterceptor<T>](), input: nil)
    }

    // MARK: - Public
    public init(interceptors: [AnyInterceptor<T>], input: T?) {
        self._interceptors = interceptors
        self.input = input
    }

    public func add(interceptor: AnyInterceptor<T>) -> InterceptorChain {
        _interceptors.append(interceptor)
        return self
    }

    public func proceed(object: T? = nil) -> Observable<T> {
        if let object = object {
            return  proceedNext(with: object)
        } else if let input = self.input {
            return  proceedNext(with: input)
        } else {
            fatalError("You must set an input object to the chain (setter or in parameter of `proceed` method)")
        }
    }

    // MARK: - Private

    private func proceedNext(with input: T) -> Observable<T> {
        guard let interceptor = self._interceptors.first else {
            return  Observable.just(input)
        }

        var interceptors = self._interceptors
        interceptors.removeFirst()

        let chain = InterceptorChain(interceptors: interceptors, input: input)
        return interceptor.interceptor(chain: chain)
    }
}

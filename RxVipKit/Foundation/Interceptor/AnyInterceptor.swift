//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import RxSwift

struct AnyInterceptor<Input> {
    private let _intercept: (InterceptorChain<Input>) -> Observable<Input>

    // MARK: Initializer

    init<T: Interceptor>(base: T) where T.Input == Input {
        _intercept = base.interceptor
    }
}

// MARK: Interceptor

extension AnyInterceptor: Interceptor {
    func interceptor(chain: InterceptorChain<Input>) -> Observable<Input> {
        return _intercept(chain)
    }
}

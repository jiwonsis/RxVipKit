//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import RxSwift

public protocol Interceptor {
    associatedtype Input

    func interceptor(chain: InterceptorChain<Input>) -> Observable<Input>
}

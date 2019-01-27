//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import RxSwift
import UIKit

public final class LoggerInterceptor {
    public typealias Input = URLRequest
    private let logger: Logger

    // MARK: Initializer

    init(logger: Logger) {
        self.logger = logger
    }
}

// MARK: Interceptor
extension LoggerInterceptor: Interceptor {
    public func interceptor(chain: InterceptorChain<Input>) -> Observable<Input> {
        if let input = chain.input {
            logger.log(level: .info, message: "Sending request: \n" + String(describing: input) + "\n")
        }
        return chain.proceed()
    }
}

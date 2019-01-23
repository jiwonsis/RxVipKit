//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import RxSwift
@testable import RxVipKit

class LoggerInterceptorTests: XCTestCase {

    // MARK: - Subject under test

    var disposeBag: DisposeBag!
    var sut: LoggerInterceptor!
    var appLogger: AppLogger!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func dummyIntercepterChain() -> InterceptorChain<URLRequest> {
        let urlRequest = URLRequest(url: URL(string: "test.com")!)
        disposeBag = DisposeBag()
        let interceptors = [AnyInterceptor(base: LoggerInterceptor(logger: appLogger))]
        return InterceptorChain<URLRequest>(interceptors: interceptors, input: urlRequest)
    }

    func test_initializer() {
        // Given
        appLogger = AppLogger()

        // When
        sut = LoggerInterceptor(logger: appLogger)
        sut.interceptor(chain: dummyIntercepterChain())
            .subscribe { (request) in
                print(request)
            }
            .disposed(by: disposeBag)

        //Then
    }
}

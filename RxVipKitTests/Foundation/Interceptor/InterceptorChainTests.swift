//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import RxSwift
@testable import RxVipKit

class InterceptorChainTests: XCTestCase {

    // MARK: - Subject under test

    var disposeBag: DisposeBag!
    var sut: InterceptorChain<URLRequest>!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_initializer() {
        // Given
        disposeBag = DisposeBag()
        let logger = AppLogger()
        let intercepter = AnyInterceptor(base: LoggerInterceptor(logger: logger))
        let urlRequest = URLRequest(url: URL(string: "test.com")!)

        // When
        sut = InterceptorChain<URLRequest>()
        let expectedChain = sut.add(interceptor: intercepter)

        sut.proceed(object: urlRequest)
            .subscribe { request in
                print(request)
            }
            .disposed(by: disposeBag)

        //Then
        XCTAssertNotNil(expectedChain)
    }
}

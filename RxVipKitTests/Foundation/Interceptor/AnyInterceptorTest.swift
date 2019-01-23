//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import RxSwift
@testable import RxVipKit

class AnyInterceptorTest: XCTestCase {

    // MARK: - Subject under test

    var disposeBag: DisposeBag!
    var sut: AnyInterceptor<URLRequest>!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_initializer() {
        // Given
        let loggerInterceptor = LoggerInterceptor(logger: AppLogger())

        // When
        sut = AnyInterceptor<URLRequest>(base: loggerInterceptor)

        //Then
    }
}

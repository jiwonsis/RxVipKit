//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import Swinject
@testable import RxVipKit

class LoggerDITests: XCTestCase {

    // MARK: - Subject under test

    var sut: Container!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_initializer() {
        // Given

        // When
        sut = Container()
        sut.register(Logger.self) { _ -> Logger in
            AppLogger()
        }
        .inObjectScope(.container)

        //Then

    }
}

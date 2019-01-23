//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import Swinject
@testable import RxVipKit

class AppLoggerTests: XCTestCase {

    // MARK: - Subject under test

    var sut: AppLogger!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_initializer() {
        // Given

        // When
        sut = AppLogger()
        sut.log(level: .debug, message: "test debug")
        sut.log(level: .verbose, message: "test verbose")
        sut.log(level: .info, message: "test info")
        sut.log(level: .warning, message: "test warning")
        sut.log(level: .error, message: "test error")
        //Then
    }
}

//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
@testable import RxVipKit

class NoRequestParameterAppErrorTests: XCTestCase {

    // MARK: - Subject under test
    var sut: NoRequestParameterAppError!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_initializer() {

        // Given
        let expectedKey = "error.global.default"
        sut = NoRequestParameterAppError()

        // When

        //Then

        XCTAssertNil(sut.raw)
        XCTAssertEqual(expectedKey, sut.messageKey)

    }
}

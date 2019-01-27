//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
@testable import RxVipKit

class LoadingEventResponseTests: XCTestCase {

    // MARK: - Subject under test
    var sut: LoadingEventResponse!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_init() {
        // Given
        let expectedSucceed = true
        let expectedCode = EventResponseCode.processing

        sut = LoadingEventResponse()

        // When

        // Then
        XCTAssertEqual(expectedSucceed, sut.succeed)
        XCTAssertNotNil(sut.data)
        XCTAssertNil(sut.error)
        XCTAssertEqual(expectedCode, sut.code)

    }

}

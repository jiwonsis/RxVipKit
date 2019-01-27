//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
@testable import RxVipKit

class AppEventResponseTests: XCTestCase {

    // MARK: - Subject under test
    var sut: AppEventResponse!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_init() {
        // Given
        let expectedSucceed = true
        let expectedCode = EventResponseCode.ok

        sut = AppEventResponse(code: expectedCode)

        // When

        // Then
        XCTAssertEqual(expectedSucceed, sut.succeed)
        XCTAssertNil(sut.data)
        XCTAssertNil(sut.dataViewState())
        XCTAssertNil(sut.error)
        XCTAssertEqual(expectedCode, sut.code)

    }

}

//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
@testable import RxVipKit

class EventRequestTests: XCTestCase {

    // MARK: - Subject under test

    var sut: EventRequest!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_initializer() {

        // Given

        let expectedAppAction = AppAction.tap
        let expectedKey = "test"
        let expectedValue = "testValue"
        let expectedParameter: [String: String]? = [expectedKey: expectedValue]
        let expectedData: [String: Any]? = [expectedKey: expectedKey, expectedValue: expectedValue]

        sut = EventRequest(path: nil, parameters: expectedParameter, data: expectedData, action: expectedAppAction)

        // When

        let expedctedDataValue: [String: Any]? = sut.dataValue()

        //Then

        XCTAssertNil(sut.path)
        XCTAssertEqual(expectedParameter, sut.parameters)
        XCTAssertEqual(expectedAppAction, sut.action)
        XCTAssertEqual(expectedValue, sut.parameter(named: expectedKey))
        XCTAssertNil(expedctedDataValue)

    }
}

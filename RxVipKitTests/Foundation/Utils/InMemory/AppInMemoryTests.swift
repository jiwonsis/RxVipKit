//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import RxBlocking

@testable import RxVipKit

class AppInMemoryTests: XCTestCase {

    // MARK: - Subject under test
    var sut: AppInMemory<[String: String]>!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_init() {
        // Given
        sut = AppInMemory(defaultValue: [String: String]())

        // When
        var initValue: [String: String]?
        var updateResult: [String: String]?
        var getValue: [String: String]?
        do {
            initValue = try sut.rxValue.toBlocking().first()
            updateResult = try sut.update(with: ["test": "update"]).toBlocking().first()
            getValue = try sut.rxValue.toBlocking().first()
        } catch {
            XCTAssertNil(error)
        }

        // Then
        XCTAssertEqual([:], initValue)
        XCTAssertNotNil(updateResult)
        XCTAssertNotNil(getValue)

    }

}

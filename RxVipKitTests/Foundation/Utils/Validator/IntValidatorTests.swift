//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest

@testable import RxVipKit

class IntValidatorTests: XCTestCase {

    // MARK: - Subject under test
    var sut: AnyValidator<String, DefaultAppError>!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_init() {
        // Given
        let intValidator = IntValueValidator()

        sut = AnyValidator<String, DefaultAppError>(base: intValidator)

        // When
        let emptyValueError = sut.validate(object: "")
        let intConvertError = sut.validate(object: "12")
        let invalidTypeError = sut.validate(object: "two")

        // Then
        XCTAssertNil(emptyValueError)
        XCTAssertNil(intConvertError)
        XCTAssertNotNil(invalidTypeError)
    }

}

//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest

@testable import RxVipKit

class TextFiledValueValidatorTests: XCTestCase {

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
        let textFieldValidator = TextFieldValueValidator(minCharator: 0, maxCharator: 5)

        sut = AnyValidator<String, DefaultAppError>(base: textFieldValidator)

        // When
        let minValueError = sut.validate(object: "")
        let maxValueError = sut.validate(object: "123456")
        let correct = sut.validate(object: "1234")

        // Then
        XCTAssertNotNil(minValueError)
        XCTAssertNotNil(maxValueError)
        XCTAssertNil(correct)
    }

}

//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
@testable import RxVipKit

class NSLocalizedTranslatorTests: XCTestCase {

    // MARK: - Subject under test

    var sut: NSLocalizedTranslator!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_initializer() {
        // Given
        let expected = "test.global"

        // When
        sut = NSLocalizedTranslator()
        let action = sut.translation(fpr: "test.global")

        //Then
        XCTAssertEqual(expected, action)
    }
}

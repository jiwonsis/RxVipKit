//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
@testable import RxVipKit

class NSLocalizedStringTranslatorTests: XCTestCase {

    // MARK: - Subject under test

    var sut: NSLocalizedStringTranslator!

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
        sut = NSLocalizedStringTranslator()
        let action = sut.translation(for: "test.global")

        //Then
        XCTAssertEqual(expected, action)
    }
}

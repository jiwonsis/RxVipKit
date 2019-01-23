//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
@testable import RxVipKit

class EndpointTests: XCTestCase {

    // MARK: - Subject under test

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_initializer() {
        // Given
        let parameterMock = RepositoryMock(testValue: "test")

        // When
        let sut = EndpointBaseMock.get(with: parameterMock)
        let headers = sut.headers
        let bodyParameters = sut.bodyParameters
        let queryParameters = sut.queryParameters

        //Then
        XCTAssertNil(headers)
        XCTAssertNil(bodyParameters)
        XCTAssertNil(queryParameters)
    }
}

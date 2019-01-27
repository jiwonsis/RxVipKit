//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
@testable import RxVipKit

class ResponseTests: XCTestCase {

    // MARK: - Subject under test

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_initializer() {
        // Given
        let expectedURL = URL(string: "http://test.com")!
        let request = URLRequest(url: expectedURL)
        let sut = AppResponse(request: request, data: nil, httpResponse: nil, error: nil)

        // When

        // Then
        XCTAssertFalse(sut.succeed, "sould be false. when request was nil")
        XCTAssertEqual(expectedURL, sut.request.url)
        XCTAssertNil(sut.data)
        XCTAssertNil(sut.error)
        XCTAssertNil(sut.statusCode)
        XCTAssertNil(sut.headers)
    }

    func test_initializerWhenInjectedURLReponse() {
        // Give
        let url = URL(string: "http://test.com")!
        let request = URLRequest(url: url)
        let expectedHeader = ["Cookie": "sessionId=123123"]
        let expectedStatusCode = HTTPStatusCode.ok.rawValue
        let response = HTTPURLResponse(url: url, statusCode: expectedStatusCode, httpVersion: "HTTP 1.1", headerFields: expectedHeader)
        let sut = AppResponse(request: request, data: nil, httpResponse: response, error: nil)

        // When

        // Then
        XCTAssertTrue(sut.succeed)
        XCTAssertEqual(expectedStatusCode, sut.statusCode?.rawValue)
        XCTAssertEqual(expectedHeader["Cookie"], sut.headers?["Cookie"] as? String)
    }
}

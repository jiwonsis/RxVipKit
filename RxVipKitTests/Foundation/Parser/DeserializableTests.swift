//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
@testable import RxVipKit

class DeserializableTests: XCTestCase {

    // MARK: - Subject under test
    var sut: AnyTransformer<[String: String], TestEntityMock>!
    let expectedTestMock = TestEntityMock(name: "test name", surname: "test surname", age: "34")

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_extentionDeserializer() {
        let injectDictionary = [
            "args": [
                "name": "test name",
                "surname": "test surname",
                "age": "34",
            ],
            ]

        let injectJSONData = "{\"args\":{\"name\": \"test name\", \"surname\": \"test surname\", \"age\": \"34\"}}".data(using: .utf8)!

        do {
            let result = try TestEntityMock(object: injectDictionary)
            XCTAssertEqual(expectedTestMock, result)
        } catch {
            XCTFail(error.localizedDescription)
        }

        do {
            let result = try TestEntityMock(data: injectJSONData)
            XCTAssertEqual(expectedTestMock, result)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}

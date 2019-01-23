//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
@testable import RxVipKit

class AnyTransformerTests: XCTestCase {

    // MARK: - Subject under test
    var sut: AnyTransformer<[String: String], TestEntityMock>!
    let expectedTestMock = TestEntityMock(name: "test name", surname: "test surname", age: "34")

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_initializer() {

        let injectedDictionary = ["name": expectedTestMock.name, "surname": expectedTestMock.surname, "age": expectedTestMock.age]

        // Given
        sut = AnyTransformer(base: DictionaryToTestModelTransformerMock())

        // When
        let result = try? sut.transform(object: injectedDictionary)

        //Then
        XCTAssertEqual(expectedTestMock, result)
    }
}

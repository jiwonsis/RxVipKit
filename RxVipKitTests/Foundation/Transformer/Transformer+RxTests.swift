//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import RxBlocking
@testable import RxVipKit

class TransformerRxTests: XCTestCase {

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

        let succeedDictionary = ["name": expectedTestMock.name, "surname": expectedTestMock.surname, "age": expectedTestMock.age]

        let failedinjectedDictionary = ["name": expectedTestMock.name, "surname": expectedTestMock.surname]

        // Given
        sut = AnyTransformer(base: DictionaryToTestModelTransformerMock())

        // When
        var successResult: TestEntityMock?
        do {
            successResult = try sut.rx_transform(object: succeedDictionary).toBlocking().first()
        } catch {

            XCTFail(error.localizedDescription)
        }

        var failedResult: TestEntityMock?
        do {
            failedResult = try sut.rx_transform(object: failedinjectedDictionary).toBlocking().first()
        } catch {
            XCTAssertNotNil(error)
        }

        //Then
        XCTAssertEqual(expectedTestMock, successResult)
        XCTAssertNil(failedResult)
    }
}

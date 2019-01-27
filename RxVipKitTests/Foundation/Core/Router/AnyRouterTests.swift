//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxBlocking
@testable import RxVipKit

class AnyRouterTests: XCTestCase {

    // MARK: - Subject under test
    var sut: AnyRouter<TestEntityMock>!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_init() {
        // Given
        let testRouterMock = TestRouterMock()
        sut = AnyRouter<TestEntityMock>(base: testRouterMock)

        // When
        let callBack = sut.callback
        let route = sut.route(from: nil, request: makeEventRequest())

        // Then
        XCTAssertNotNil(callBack)
        XCTAssertNotNil(route)
    }

    func makeEventRequest() -> EventRequest {
        let injectDictionary = [
            "args": [
                "name": "test name",
                "surname": "test surname",
                "age": "34",
            ],
        ]

        do {
            let entity = try TestEntityMock(object: injectDictionary)
            return EventRequest(path: nil, parameters: nil, data: [EventParameterKey.value: entity], action: .navigate)
        } catch {
            fatalError()
        }

    }
}

//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
@testable import RxVipKit

class AnyPresenterTests: XCTestCase {

    // MARK: - Subject under test
    var sut: AnyPresenter<TestViewModelMock>!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_init() {
        // Given
        let testPresenterMock = TestPresenterMock(translator: NSLocalizedStringTranslator(), logger: AppLogger())

        sut = AnyPresenter<TestViewModelMock>(base: testPresenterMock)

        // When
        _ = sut.handle(response: makeEventResponse())

        // Then
    }

    func makeEventResponse() -> EventResponse {
        let injectDictionary = [
            "args": [
                "name": "test name",
                "surname": "test surname",
                "age": "34",
            ],
        ]

        do {
            let entity = try TestEntityMock(object: injectDictionary)
            return AppEventResponse(code: .ok, data: [EventParameterKey.value: entity])
        } catch {
            fatalError()
        }
    }
}

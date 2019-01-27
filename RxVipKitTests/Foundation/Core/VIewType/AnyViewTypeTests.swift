//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
@testable import RxVipKit

class AnyViewTypeTests: XCTestCase {

    // MARK: - Subject under test
    var sut: AnyViewType<TestViewModelMock>!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_init() {
        // Given
        let testViewTypeMock = TestViewTypeMock()
        let testViewModelMock = TestViewModelMock(state: .loading, buttonTitle: "testButton")
        let driverTestViewModelMock = makeObserable(viewModel: testViewModelMock).asDriver(onErrorJustReturn: testViewModelMock)

        sut = AnyViewType<TestViewModelMock>(base: testViewTypeMock)

        // When
        let view = sut.view

        // Then
        XCTAssertEqual(view.description, testViewTypeMock.view.description)
        XCTAssertNotNil(sut.request())
        XCTAssertNotNil(sut.update(with: driverTestViewModelMock))
    }

    func makeObserable(viewModel: TestViewModelMock) -> Observable<TestViewModelMock> {
        return Observable<TestViewModelMock>.just(viewModel)
    }
}

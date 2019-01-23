//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import RxSwift
@testable import RxVipKit

class EndpointToURLRequestTransformerTests: XCTestCase {

    // MARK: - Subject under test
    let disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_defaultInitializer() {

        // Given
        let expectation = XCTestExpectation(description: "event call")
        let parameterMock = RepositoryMock(testValue: "test")
        var result: URLRequest?
        let sut = AnyTransformer(base: EndpointToURLRequestTransformer())

        // When
        sut
            .rx_transform(object: EndpointBaseMock.get(with: parameterMock))
            .subscribe(onNext: { request in
                result = request
                expectation.fulfill()
            })
            .disposed(by: disposeBag)

        //Then
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.url?.absoluteString, "http://localhost:7000/default")

        wait(for: [expectation], timeout: 5.0)

    }

    func test_BodyAndQueryDataInjectionInitializer() {
        // Given
        let expectation = XCTestExpectation(description: "event call")
        let sut = AnyTransformer(base: EndpointToURLRequestTransformer())
        var result: URLRequest?

        // When
        sut
            .rx_transform(object: EndPointFullDataMock.post(with: RepositoryFullDataMock()))
            .subscribe(onNext: { request in
                result = request
                expectation.fulfill()
            })
            .disposed(by: disposeBag)

        XCTAssertNotNil(result)

        wait(for: [expectation], timeout: 5.0)
    }

    func test_wrongEndpointInjectionIntializer() {
        // Given
        let expectation = XCTestExpectation(description: "event call")
        let sut = AnyTransformer(base: EndpointToURLRequestTransformer())

        // When
        sut
            .rx_transform(object: EndpointFailMock.get)
            .subscribe(onError: { error in
                XCTAssertNotNil(error)
                expectation.fulfill()
            })
            .disposed(by: disposeBag)

        // Then
        wait(for: [expectation], timeout: 5.0)
    }

    func test_EndpointFailMock2InjectionIntializer() {
        // Given
        let expectation = XCTestExpectation(description: "event call")
        let sut = AnyTransformer(base: EndpointToURLRequestTransformer())

        // When
        sut
            .rx_transform(object: EndpointFailMock2.get)
            .subscribe(onError: { error in
                XCTAssertNotNil(error)
                expectation.fulfill()
            })
            .disposed(by: disposeBag)

        // Then
        wait(for: [expectation], timeout: 5.0)
    }
}

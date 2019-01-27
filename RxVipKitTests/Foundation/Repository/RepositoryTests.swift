//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import RxSwift
@testable import RxVipKit

class AnyRepositoryTests: XCTestCase {

    // MARK: - Subject under test
    let stubServer = StubServer()
    let disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
        stubServer.setUp()
    }

    override func tearDown() {
        super.tearDown()
        stubServer.tearDown()
    }

    func test_HTTPClientTypeGet() {
        // Given
        let expectation = XCTestExpectation(description: "event call")
        let parameterMock = RepositoryParameterMock(testValue: "test")
        let sut = createSUT()

        // When & Then

        sut
            .get(with: parameterMock)
            .subscribe(onNext: { (result: Result<TestEntityMock>) in
                XCTAssertNotNil(result)
                expectation.fulfill()
            })
            .disposed(by: disposeBag)

        wait(for: [expectation], timeout: 5.0)
    }

    func test_HTTPClientTypePut() {
        // Given
        let expectation = XCTestExpectation(description: "event call")
        let parameterMock = RepositoryParameterMock(testValue: "test")
        let sut = createSUT()

        // When & Then

        sut
            .put(with: parameterMock)
            .subscribe(onError: { error in
                XCTAssertNotNil(error)
                expectation.fulfill()
            })
            .disposed(by: disposeBag)

        wait(for: [expectation], timeout: 5.0)
    }

    func test_HTTPClientTypeDelete() {
        // Given
        let expectation = XCTestExpectation(description: "event call")
        let parameterMock = RepositoryParameterMock(testValue: "test")
        let sut = createSUT()

        // When & Then

        sut
            .delete(with: parameterMock)
            .subscribe(onError: { error in
                XCTAssertNotNil(error)
                expectation.fulfill()
            })
            .disposed(by: disposeBag)

        wait(for: [expectation], timeout: 5.0)
    }

    func test_HTTPClientTypePatch() {
        // Given
        let expectation = XCTestExpectation(description: "event call")
        let parameterMock = RepositoryParameterMock(testValue: "test")
        let sut = createSUT()

        // When & Then

        sut
            .patch(with: parameterMock)
            .subscribe(onError: { error in
                XCTAssertNotNil(error)
                expectation.fulfill()
            })
            .disposed(by: disposeBag)

        wait(for: [expectation], timeout: 5.0)
    }

    func test_HTTPClientTypePost() {
        // Given
        let expectation = XCTestExpectation(description: "event call")
        let parameterMock = RepositoryParameterMock(testValue: "test")
        let sut = createSUT()

        // When & Then

        sut
            .post(with: parameterMock)
            .subscribe(onError: { error in
                XCTAssertNotNil(error)
                expectation.fulfill()
            })
            .disposed(by: disposeBag)

        wait(for: [expectation], timeout: 5.0)
    }

    func createSUT() -> AnyRepository<TestEntityMock> {
        let endpointToURLRequstTransformer = EndpointToURLRequestTransformer()

        let uiapplicationNetworkActivityMock = UIApplicationNetworkActivityMock(application: UIApplication.shared)
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30
        sessionConfig.timeoutIntervalForResource = 30
        let session = URLSession(configuration: sessionConfig)
        let networkAdapter = URLSessionNetworkAdapter(networkActivity: uiapplicationNetworkActivityMock, session: session)

        let logger = AppLogger()
        let intercepter = AnyInterceptor(base: LoggerInterceptor(logger: logger))

        let interceptorChain = InterceptorChain<URLRequest>()
        let requestChain = interceptorChain.add(interceptor: intercepter)

        let responseChain = InterceptorChain<Response>()
        let appErrorHandler = AppErrorHandlerMock()

        let appHttpClientType = AppHTTPClientType(
            transformer: AnyTransformer(base: endpointToURLRequstTransformer),
            networkAdapter: networkAdapter,
            requestChain: requestChain,
            responseChain: responseChain,
            httpErrorHandler: appErrorHandler)

        return AnyRepository<TestEntityMock>(base: RepositoryTestMock(httpClient: appHttpClientType))
    }

}

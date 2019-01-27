//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import RxBlocking
@testable import RxVipKit

class AppHTTPClientTyoeTests: XCTestCase {

    // MARK: - Subject under test
    let stubServer = StubServer()

    override func setUp() {
        super.setUp()
        stubServer.setUp()
    }

    override func tearDown() {
        super.tearDown()
        stubServer.tearDown()
    }

    func test_initWithDesializableTypeRequest() {
        // Given
        let endpointToURLRequstTransformer = EndpointToURLRequestTransformer()

        let uiapplicationNetworkActivityMock = UIApplicationNetworkActivityMock(application: UIApplication.shared)
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30
        sessionConfig.timeoutIntervalForResource = 30
        let session = URLSession(configuration: sessionConfig)
        let networkAdapter = URLSessionNetworkAdapter(networkActivity: uiapplicationNetworkActivityMock, session: session)

        let requestChain = InterceptorChain<URLRequest>()
        let responseChain = InterceptorChain<Response>()
        let appErrorHandler = AppErrorHandlerMock()

        let parameterMock = RepositoryParameterMock(testValue: "test")

        let sut = AppHTTPClientType(
            transformer: AnyTransformer(base: endpointToURLRequstTransformer),
            networkAdapter: networkAdapter,
            requestChain: requestChain,
            responseChain: responseChain,
            httpErrorHandler: appErrorHandler)

        // When
        var result: Response?
        do {
            result = try sut.request(endpoint: EndpointNoContentMock.update(with: parameterMock)).toBlocking().first()

            if let data = result?.data {
                let expected = ""
                XCTAssertEqual(expected, String(data: data, encoding: .utf8))
            }
        } catch {
            XCTAssertNil(error)
        }

        // Then
        XCTAssertNotNil(result)
    }

}

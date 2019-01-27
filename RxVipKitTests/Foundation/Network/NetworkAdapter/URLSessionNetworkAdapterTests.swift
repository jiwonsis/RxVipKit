//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import XCTest
import RxSwift
@testable import RxVipKit

class URLSessionNetworkAdapterTests: XCTestCase {

    // MARK: - Subject under test
    let disposeBag = DisposeBag()
    let stubServer = StubServer()
    let uiapplicationNetworkActivityMock = UIApplicationNetworkActivityMock(application: UIApplication.shared)

    override func setUp() {
        super.setUp()
        stubServer.setUp()
    }

    override func tearDown() {
        super.tearDown()
        stubServer.tearDown()
    }

    func test_initWithNetworkAdapter() {
        // Given
        let errorExpectation = XCTestExpectation(description: "error event call")
        let succeedExpectation = XCTestExpectation(description: "succeed event call")
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30
        sessionConfig.timeoutIntervalForResource = 30
        let session = URLSession(configuration: sessionConfig)

        let sut = URLSessionNetworkAdapter(networkActivity: uiapplicationNetworkActivityMock, session: session)

        DispatchQueue.main.async {
            sut
                .rx_send(request: URLRequest(url: URL(string: "http://localhost:111")!))
                .subscribe(onNext: { (response: Response) in
                    XCTAssertNil(response)
                }, onError: { (error: Error) in
                    XCTAssertNotNil(error)
                    errorExpectation.fulfill()
                })
                .disposed(by: self.disposeBag)

            sut
                .rx_send(request: URLRequest(url: self.stubServer.getLogin()))
                .subscribe(onNext: { (response: Response) in
                    XCTAssertNotNil(response)
                    succeedExpectation.fulfill()
                }, onError: { (error: Error) in
                    XCTAssertNil(error)
                })
                .disposed(by: self.disposeBag)
        }

        // Then
        wait(for: [errorExpectation, succeedExpectation], timeout: 5.0)
    }

}

//
//  AppHTTPClientType.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 25/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation
import RxSwift

public final class AppHTTPClientType {
    private let _transformer: AnyTransformer<Endpoint, URLRequest>
    private let _networkAdapter: NetworkAdapter
    private let _requestChain: InterceptorChain<URLRequest>
    private let _responseChain: InterceptorChain<Response>
    private let _httpErrorHandler: HTTPErrorHandler

    // MARK: Initializer

    public init(
        transformer: AnyTransformer<Endpoint, URLRequest>,
        networkAdapter: NetworkAdapter,
        requestChain: InterceptorChain<URLRequest>,
        responseChain: InterceptorChain<Response>,
        httpErrorHandler: HTTPErrorHandler
    ) {
        _transformer = transformer
        _networkAdapter = networkAdapter
        _requestChain = requestChain
        _responseChain = responseChain
        _httpErrorHandler = httpErrorHandler
    }
}

// MARK: HTTPClientType

extension AppHTTPClientType: HTTPClientType {

    public func request<T: Deserializable>(endpoint: Endpoint) -> Observable<Result<T>> {
        let requestChain = _requestChain
        let networkAdapter = _networkAdapter
        let responseChain = _responseChain
        let httpErrorHandler = _httpErrorHandler

        return _transformer
            .rx_transform(object: endpoint)
            .flatMap { requestChain.proceed(object: $0) }
            .flatMap { networkAdapter.rx_send(request: $0) }
            .flatMap { responseChain.proceed(object: $0) }
            .flatMap { (response) -> Observable<Result<T>> in

                if !response.succeed {
                    return Observable.error(httpErrorHandler.handle(resoponse: response))
                }

                guard let data = response.data else {
                    return Observable.just(Result.noContent)
                }

                do {
                    let object = try T.init(data: data)
                    return Observable.just(Result.value(object))
                } catch {
                    return Observable.error(error)
                }
        }
    }

    public func request(endpoint: Endpoint) -> Observable<Response> {
        let requestChain = _requestChain
        let networkAdapter = _networkAdapter
        let responseChain = _responseChain

        return _transformer
            .rx_transform(object: endpoint)
            .flatMap { requestChain.proceed(object: $0) }
            .flatMap { networkAdapter.rx_send(request: $0) }
            .flatMap { responseChain.proceed(object: $0) }
    }
}

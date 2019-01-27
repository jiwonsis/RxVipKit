//
//  RepositoryTestMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 25/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

@testable import RxVipKit

final class RepositoryTestMock {
    private let _httpClient: HTTPClientType

    // MARK: Initializer
    init(httpClient: HTTPClientType) {
        _httpClient = httpClient
    }
}

// MARK: Repository

extension RepositoryTestMock: Repository {

    func get(with parameter: RespositoryParameter) -> Observable<Result<TestEntityMock>> {

        guard let testEntityParameter = parameter as? RepositoryParameterMock else {
            return Observable.error(ParameterTypeAppError(developerMessage: "Parameter should be typed RepositoryParameterMock"))
        }

        return _httpClient.request(endpoint: EndpointBaseMock.get(with: testEntityParameter))
    }

    func post(with parameter: RespositoryParameter) -> Observable<Result<TestEntityMock>> {

        guard let testEntityParameter = parameter as? RepositoryParameterMock else {
            return Observable.error(ParameterTypeAppError(developerMessage: "Parameter should be typed RepositoryParameterMock"))
        }

        return _httpClient.request(endpoint: EndpointBaseMock.post(with: testEntityParameter))
    }

    func put(with parameter: RespositoryParameter) -> Observable<Result<TestEntityMock>> {

        guard let testEntityParameter = parameter as? RepositoryParameterMock else {
            return Observable.error(ParameterTypeAppError(developerMessage: "Parameter should be typed RepositoryParameterMock"))
        }

        return _httpClient.request(endpoint: EndpointBaseMock.put(with: testEntityParameter))
    }

    func patch(with parameter: RespositoryParameter) -> Observable<Result<TestEntityMock>> {

        guard let testEntityParameter = parameter as? RepositoryParameterMock else {
            return Observable.error(ParameterTypeAppError(developerMessage: "Parameter should be typed RepositoryParameterMock"))
        }

        return _httpClient.request(endpoint: EndpointBaseMock.patch(with: testEntityParameter))
    }

    func delete(with parameter: RespositoryParameter) -> Observable<Result<TestEntityMock>> {

        guard let testEntityParameter = parameter as? RepositoryParameterMock else {
            return Observable.error(ParameterTypeAppError(developerMessage: "Parameter should be typed RepositoryParameterMock"))
        }

        return _httpClient.request(endpoint: EndpointBaseMock.delete(with: testEntityParameter))
    }
}

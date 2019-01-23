//
//  EndpointMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 21/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

@testable import RxVipKit

enum EndpointBaseMock: Endpoint {

    case get(with: RepositoryMock)
    case post(with: RepositoryMock)

    private enum Constant {
        static let baseURL = "http://localhost:7000"
        static let `default` = "default"

        enum Key {
            static let testValue = "testValue"
        }
    }
}

// MARK: Endpoint

extension EndpointBaseMock {

    var baseURL: String {
        return Constant.baseURL
    }

    var path: String {
        switch self {
        case .get:
            return Constant.default
        case .post:
            return Constant.default
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .get:
            return .GET
        case .post:
            return .POST
        }
    }
}

//
//  EndpointMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 21/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

@testable import RxVipKit

enum EndPointFullDataMock: Endpoint {

    case post(with: RespositoryParameterFullDataMock)

    private enum Constant {
        static let baseURL = "http://localhost:7000"
        static let `default` = "default"

        enum Key {
            static let testValue = "testValue"
        }
    }
}

// MARK: Endpoint

extension EndPointFullDataMock {

    var baseURL: String {
        return Constant.baseURL
    }

    var path: String {
        switch self {
        case .post:
            return Constant.default
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .post:
            return .POST
        }
    }

    var queryParameters: [String: String]? {
        switch self {
        case .post(let repository):
            return repository.parameter
        }
    }

    var bodyParameters: [String: Any]? {
        switch self {
        case .post(let repository):
            return repository.bodyParameter
        }
    }

    var headers: [String: String]? {
        return ["csrfToken": "123456"]
    }
}

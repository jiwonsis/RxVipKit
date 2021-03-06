//
//  EndpointMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 21/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

@testable import RxVipKit

enum EndpointBaseMock: Endpoint {

    case get(with: RepositoryParameterMock)
    case post(with: RepositoryParameterMock)
    case put(with: RepositoryParameterMock)
    case patch(with: RepositoryParameterMock)
    case delete(with: RepositoryParameterMock)

    private enum Constant {
        static let baseURL = "http://localhost:7000"
        static let `default` = "default"

        static let get = "get"
        static let post = "post"
        static let put = "put"
        static let patch = "patch"
        static let delete = "delete"

        enum Key {
            static let get = "testValue"
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
        default:
            return Constant.default
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .get:
            return .GET
        case .post:
            return .POST
        case .put:
            return .PUT
        case .patch:
            return .PATCH
        case .delete:
            return .DELETE
        }
    }
}

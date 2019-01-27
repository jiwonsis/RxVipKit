//
//  EndpointMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 21/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

@testable import RxVipKit

enum EndpointNoContentMock: Endpoint {

    case get(with: RepositoryParameterMock)
    case post(with: RepositoryParameterMock)
    case put(with: RepositoryParameterMock)
    case update(with: RepositoryParameterMock)
    case delete(with: RepositoryParameterMock)

    private enum Constant {
        static let baseURL = "http://localhost:7000"
        static let `default` = "default"

        static let get = "get"
        static let post = "post"
        static let put = "put"
        static let update = "update"
        static let delete = "delete"

        enum Key {
            static let get = "testValue"
        }
    }
}

// MARK: Endpoint

extension EndpointNoContentMock {

    var baseURL: String {
        return Constant.baseURL
    }

    var path: String {
        switch self {
        case .update:
            return Constant.update
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
        case .update:
            return .PUT
        case .delete:
            return .DELETE
        }
    }
}

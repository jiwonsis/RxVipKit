//
//  EndpointMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 21/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

@testable import RxVipKit

enum EndpointFailMock: Endpoint {

    case get
}

// MARK: Endpoint

extension EndpointFailMock {

    var baseURL: String {
        return ""
    }

    var path: String {
        switch self {
        case .get:
            return ""
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .get:
            return .GET
        }
    }
}

//
//  EndpointMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 21/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

@testable import RxVipKit

enum EndpointFailMock2: Endpoint {

    case get
}

// MARK: Endpoint

extension EndpointFailMock2 {

    var baseURL: String {
        return "localhost"
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

    var bodyParameters: [String: Any]? {
        let someString = String(
            bytes: [0xD8, 0x00] as [UInt8],
            encoding: String.Encoding.utf16BigEndian)!
        return ["test": someString]
    }
}

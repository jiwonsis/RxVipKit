//
//  Endpoint.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 21/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryParameters: [String: String]? { get }
    var bodyParameters: [String: Any]? { get }
}

// MARK: Default Method

extension Endpoint {
    var headers: [String: String]? {
        return nil
    }

    var queryParameters: [String: String]? {
        return nil
    }

    var bodyParameters: [String: Any]? {
        return nil
    }
}

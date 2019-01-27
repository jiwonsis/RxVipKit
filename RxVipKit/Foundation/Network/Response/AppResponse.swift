//
//  AppResponse.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 24/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation

struct AppResponse {
    private let _request: URLRequest
    private let _data: Data?
    private let httpResponse: URLResponse?
    private let _error: Error?

    // MARK: Initializer

    init(request: URLRequest, data: Data?, httpResponse: URLResponse?, error: Error?) {
        _request = request
        _data = data
        _error = error
        self.httpResponse = httpResponse
    }
}

// MARK: Response

extension AppResponse: Response {

    var succeed: Bool {
        guard let httpResponse = httpResponse as? HTTPURLResponse else {
            return false
        }
        return httpResponse.statusCode >= HTTPStatusCode.ok.rawValue && httpResponse.statusCode < HTTPStatusCode.badRequest.rawValue
    }

    var data: Data? {
        return _data
    }

    var error: Error? {
        return _error
    }

    var statusCode: HTTPStatusCode? {
        guard let httpResponse = httpResponse as? HTTPURLResponse else {
            return nil
        }
        return HTTPStatusCode(rawValue: httpResponse.statusCode)
    }

    var request: URLRequest {
        return _request
    }

    var headers: [String: Any]? {
        guard let httpResponse = httpResponse as? HTTPURLResponse else {
            return nil
        }
        return httpResponse.allHeaderFields as? [String: Any]
    }
}

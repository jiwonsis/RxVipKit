//
//  HTTPStatusCode.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 24/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

enum HTTPStatusCode: Int {
    case ok = 200 // swiftlint:disable:this identifier_name
    case created = 201
    case noContent = 204
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case internalServerError = 500
    case serverUnabliable = 503
}

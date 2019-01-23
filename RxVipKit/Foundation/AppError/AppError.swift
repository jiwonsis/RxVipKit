//
//  AppError.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 22/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public protocol AppError: Error {
    var raw: Error? { get }
    var messageKey: String { get }
}

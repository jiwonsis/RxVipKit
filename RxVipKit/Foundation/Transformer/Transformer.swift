//
//  Transformer.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 23/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public protocol Transformer {
    associatedtype Input
    associatedtype Output

    func transform(object: Input) throws -> Output
}

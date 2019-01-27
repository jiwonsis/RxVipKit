//
//  AnyTransformer.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 23/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public struct AnyTransformer<Input, Output> {
    private let _transform: (Input) throws -> Output

    // MARK: Initializer

    init<T: Transformer>(base: T) where T.Input == Input, T.Output == Output {
        _transform = base.transform
    }
}

// MARK: Transformer

extension AnyTransformer: Transformer {
    public func transform(object: Input) throws -> Output {
        return try _transform(object)
    }
}

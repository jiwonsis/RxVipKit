//
//  Deserializable.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 23/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation

public protocol Deserializable {
    init(data: Data) throws
}

public protocol AnyInitializable {
    init(object: Any) throws
}

extension Deserializable where Self: AnyInitializable {
    init(data: Data) throws {
        let object: Any = try JSONSerialization.jsonObject(with: data, options: .allowFragments)

        try self.init(object: object)
    }
}

//
//  HTTPClientType.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 25/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

public protocol HTTPClientType {
    func request<T: Deserializable>(endpoint: Endpoint) -> Observable<Result<T>>
    func request(endpoint: Endpoint) -> Observable<Response>
}

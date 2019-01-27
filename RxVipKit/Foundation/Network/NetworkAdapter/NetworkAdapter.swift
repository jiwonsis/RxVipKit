//
//  NetworkAdapter.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 25/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

public protocol NetworkAdapter {
    func rx_send(request: URLRequest) -> Observable<Response>
}

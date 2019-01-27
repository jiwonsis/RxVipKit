//
//  HTTPErrorHandler.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 24/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public protocol HTTPErrorHandler {
    func handle(resoponse: Response) -> Error
}

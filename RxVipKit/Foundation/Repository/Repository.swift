//
//  Repository.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 25/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

public protocol Repository {
    associatedtype Resource

    func get(with parameter: RespositoryParameter) -> Observable<Result<Resource>>
    func post(with parameter: RespositoryParameter) -> Observable<Result<Resource>>
    func put(with parameter: RespositoryParameter) -> Observable<Result<Resource>>
    func patch(with parameter: RespositoryParameter) -> Observable<Result<Resource>>
    func delete(with parameter: RespositoryParameter) -> Observable<Result<Resource>>
}

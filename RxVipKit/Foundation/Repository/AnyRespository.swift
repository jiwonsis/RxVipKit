//
//  AnyRespositoryMock.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 25/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

final class AnyRepository<T> {

    private let _get: (RespositoryParameter) -> Observable<Result<T>>
    private let _post: (RespositoryParameter) -> Observable<Result<T>>
    private let _put: (RespositoryParameter) -> Observable<Result<T>>
    private let _patch: (RespositoryParameter) -> Observable<Result<T>>
    private let _delete: (RespositoryParameter) -> Observable<Result<T>>

    // MARK: Initializer

    init<R: Repository>(base: R) where R.Resource == T {
        _get = base.get
        _post = base.post
        _put = base.put
        _patch = base.patch
        _delete = base.delete
    }

}

// Repository
extension AnyRepository: Repository {
    func get(with parameter: RespositoryParameter) -> Observable<Result<T>> {
        return _get(parameter)
    }

    func post(with parameter: RespositoryParameter) -> Observable<Result<T>> {
        return _post(parameter)
    }

    func put(with parameter: RespositoryParameter) -> Observable<Result<T>> {
        return _put(parameter)
    }

    func patch(with parameter: RespositoryParameter) -> Observable<Result<T>> {
        return _patch(parameter)
    }

    func delete(with parameter: RespositoryParameter) -> Observable<Result<T>> {
        return _delete(parameter)
    }
}

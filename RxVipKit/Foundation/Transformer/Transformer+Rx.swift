//
//  Transformer+Rx.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 23/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

extension Transformer {
    func rx_transform(object: Input) -> Observable<Output> {
        return Observable.create { (observer) -> Disposable in
            do {
                observer.onNext(try self.transform(object: object))
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }

            return Disposables.create()
        }
    }
}

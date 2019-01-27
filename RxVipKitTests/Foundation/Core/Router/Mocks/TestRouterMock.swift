//
//  TestRouterMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxSwift

@testable import RxVipKit

final class TestRouterMock: Router {
    private let subject: PublishSubject<TestEntityMock>

    // MARK: Initializer

    init() {
        subject = PublishSubject()
    }

    // MARK: Router

    var callback: Observable<TestEntityMock> {
        return subject.asObservable()
    }

    func route(from root: UIViewController?, request: EventRequest) -> Observable<EventResponse> {
        root?.dismiss(animated: true, completion: nil)

        guard let testEntity: TestEntityMock = request.dataValue() else {
            assertionFailure("Should have User object")

            return Observable.never()
        }

        subject.asObserver().onNext(testEntity)

        return Observable.never()
    }

}

//
//  URLSessionNetworkAdapter.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 25/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public final class URLSessionNetworkAdapter {
    private let _networkActivity: NetworkActivity
    private let _session: URLSession

    // MARK: Initializer

    init(networkActivity: NetworkActivity, session: URLSession) {
        _networkActivity = networkActivity
        _session = session
    }
}

// MARK: NetworkAdapter

extension URLSessionNetworkAdapter: NetworkAdapter {

    public func rx_send(request: URLRequest) -> Observable<Response> {
        _networkActivity.show()

        return Observable.create { [weak self] observer in
            var didHideNetworkActivity = false

            let task = self?._session.dataTask(with: request) { (data, response, error) in
                didHideNetworkActivity = true
                self?._networkActivity.hide()

                guard
                    let response = response,
                    let data = data
                    else {
                        observer.onError(NetworkAppError(error: error))
                        return
                }

                observer.onNext(AppResponse(request: request, data: data, httpResponse: response, error: error))
                observer.onCompleted()
            }

            task?.resume()

            return Disposables.create {
                if didHideNetworkActivity == false {
                    self?._networkActivity.hide()
                }
                task?.cancel()
            }
        }
    }
}

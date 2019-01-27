//
//  NetworkActivityMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 25/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation

@testable import RxVipKit

final class UIApplicationNetworkActivityMock {
    private let application: UIApplication
    private var counter: Int

    // MARK: Initializer

    init(application: UIApplication) {
        self.application = application
        counter = 0
    }
}

// MARK: NetworkActivity

extension UIApplicationNetworkActivityMock: NetworkActivity {
    func show() {
        counter += 1

        DispatchQueue.main.async {
            if false == self.application.isNetworkActivityIndicatorVisible {
                self.application.isNetworkActivityIndicatorVisible = true
            }
        }
    }

    func hide() {
        if counter > 0 {
            counter -= 1
        }

        DispatchQueue.main.async {
            if self.counter == 0 && self.application.isNetworkActivityIndicatorVisible {
                self.application.isNetworkActivityIndicatorVisible = false
            }
        }
    }
}

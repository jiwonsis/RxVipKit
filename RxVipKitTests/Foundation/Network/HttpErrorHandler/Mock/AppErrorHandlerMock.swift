//
//  AppErrorHandlerMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 24/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

@testable import RxVipKit

struct AppErrorHandlerMock {
}

// MARK: HTTPErrorHandler
extension AppErrorHandlerMock: HTTPErrorHandler {

    func handle(resoponse: Response) -> Error {

        // All the error logic error of the api should be handle here

        return NetworkAppError(error: nil)
    }
}

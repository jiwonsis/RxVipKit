//
//  HttpStub.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 23/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation
import Swifter

struct StubServerInfo {
    let url: String
    let htmlString: String
}

class StubServer {

    let server = HttpServer()

    func setUp() {
        stubSetup()
        do {
            _ = try server.start(7000)
        } catch {
            fatalError(error.localizedDescription)
        }

    }

    func tearDown() {
        server.stop()
    }

    func getUrl() -> String {
        return "http://localhost:7000"
    }

    func stubSetup() {

        let successResponse: ((HttpRequest) -> HttpResponse) = { _ in
            return HttpResponse.ok(.data(self.getTestMockData()))
        }
        server.GET["/default"] = successResponse
    }

    func getTestMockData() -> Data {
        return "{\"args\":{\"name\": \"test name\", \"surname\": \"test surname\", \"age\": \"34\"}}".data(using: .utf8)!
    }
}

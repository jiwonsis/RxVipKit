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

    func getLogin() -> URL {
        return URL(string: getUrl() + "/login")!
    }

    func getDefault() -> URL {
        return URL(string: getUrl() + "/default")!
    }

    func getUpdate() -> URL {
        return URL(string: getUrl() + "/update")!
    }

    func stubSetup() {

        let successResponse: ((HttpRequest) -> HttpResponse) = { _ in
            return HttpResponse.ok(.data(self.getTestMockData()))
        }

        let successNoContentResponse: ((HttpRequest) -> HttpResponse) = { _ in
            return HttpResponse.created
        }

        let notFoundResponse: ((HttpRequest) -> HttpResponse) = { _ in
            return HttpResponse.notFound
        }

        let notMatedSuccessResponse: ((HttpRequest) -> HttpResponse) = { _ in
            return HttpResponse.ok(.data(self.getTestMockErrorData()))
        }

        server.GET["/default"] = successResponse
        server.PUT["/default"] = successNoContentResponse
        server.DELETE["/default"] = notFoundResponse
        server.POST["/default"] = notMatedSuccessResponse
        server.PATCH["/default"] = successNoContentResponse

        let failResponse: ((HttpRequest) -> HttpResponse) = { _ in
            return HttpResponse.unauthorized
        }
        server.GET["/login"] = failResponse

        let noContentResponse: ((HttpRequest) -> HttpResponse) = { _ in
            return HttpResponse.created
        }
        server.PUT["/update"] = noContentResponse
    }

    func getTestMockData() -> Data {
        return "{\"args\":{\"name\": \"test name\", \"surname\": \"test surname\", \"age\": \"34\"}}".data(using: .utf8)!
    }

    func getTestMockErrorData() -> Data {
        return "{\"arg\":{\"name\": \"test\", \"surname\": \"test surname\", \"age\": \"34\"}}".data(using: .utf8)!
    }
}

//
//  TestPresenterMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

@testable import RxVipKit

final class TestPresenterMock {
    private let translator: Translator
    private let logger: Logger

    // MARK: initializer

    init(translator: Translator, logger: Logger) {
        self.translator = translator
        self.logger = logger
    }
}

extension TestPresenterMock: Presenter {

    func handle(response: EventResponse) -> TestViewModelMock {
        switch response.code {

        case .ok:
            guard let testMock: TestEntityMock = response.dataValue() else {
                assertionFailure("shold have data")

                return TestViewModelMock(
                    state: .error(message: translator.translation(for: "error.generic.message")),
                    buttonTitle: "testButton"
                )
            }

            return TestViewModelMock(
                state: .success,
                buttonTitle: "test Button",
                name: testMock.name,
                surname: testMock.surname,
                age: testMock.age
            )
        default: break
        }
        return TestViewModelMock(
            state: .error(message: translator.translation(for: "error.generic.message")),
            buttonTitle: "testButton"
        )
    }
}

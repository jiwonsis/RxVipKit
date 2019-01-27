//
//  TestViewModel.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

@testable import RxVipKit

struct TestViewModelMock {
    let state: ViewState
    let buttonTitle: String

    let name: String?
    let surname: String?
    let age: String?

    // MARK: Initializer

    init(state: ViewState, buttonTitle: String, name: String? = nil, surname: String? = nil, age: String? = nil) {
        self.state = state
        self.buttonTitle = buttonTitle
        self.name = name
        self.surname = surname
        self.age = age
    }
}

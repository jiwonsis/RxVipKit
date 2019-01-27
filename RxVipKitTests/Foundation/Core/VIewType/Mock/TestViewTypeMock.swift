//
//  TestViewTypeMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

@testable import RxVipKit

final class TestViewTypeMock: UIView {
    private let disposeBag = DisposeBag()
    private let nameLabel: UILabel
    private let surnameLabel: UILabel
    private let ageLabel: UILabel
    private let button: UIButton
    private let activityIndicator: UIActivityIndicatorView

    // MARK: Initializer

    init() {
        nameLabel = UILabel()
        surnameLabel = UILabel()
        ageLabel = UILabel()
        button = UIButton()
        activityIndicator = UIActivityIndicatorView()

        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: ViewType

extension TestViewTypeMock: ViewType {

    func request() -> Observable<EventRequest> {
        let tap: Observable<EventRequest> = button
            .rx
            .tap
            .asObservable()
            .map { EventRequest(action: .tap) }

        return tap
    }

    func update(with provider: Driver<TestViewModelMock>) {
        provider
            .map { (viewModel) -> Bool in
                if case  .loading = viewModel.state {
                    return true
                } else {
                    return false
                }
        }
        .drive(activityIndicator.rx.isAnimating)
        .disposed(by: disposeBag)
    }

}

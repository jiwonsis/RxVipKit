//
//  AppAction.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 22/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public enum AppAction: Equatable {
    case viewDidLoad
    case viewWillAppear
    case viewDidAppear
    case viewWillDisappear
    case viewDidDisappear
    case tap
    case userInfo
    case navigate
}

public func == (lhs: AppAction, rhs: AppAction) -> Bool {
    return String(describing: lhs) == String(describing: rhs)
}

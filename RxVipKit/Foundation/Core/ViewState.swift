//
//  ViewState.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 26/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

public enum ViewState {
    public case loading
    public case error(message: String)
    case success
}

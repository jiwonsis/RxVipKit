//
//  AppContainer.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 27/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Swinject

protocol AppContainer {
    func getChild() -> Container
    func resolve<Service>(serviceType: Service.Type) -> Service?
    func resolve<Service>(serviceType: Service.Type, name: String) -> Service?
}

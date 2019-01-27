//
//  RepositoryParameterMock.swift
//  RxVipKitTests
//
//  Created by SANGBONG MOON on 21/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

@testable import RxVipKit

struct RespositoryParameterFullDataMock: RespositoryParameter {

    let parameter = ["user": "testUser"]

    let bodyParameter = ["test": "testUser"]
}

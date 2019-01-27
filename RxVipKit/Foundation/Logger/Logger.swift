//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import Foundation

public protocol Logger {
    func log(level: LoggerLevel, message: Any)
}

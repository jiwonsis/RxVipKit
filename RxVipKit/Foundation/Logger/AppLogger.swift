//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import SwiftyBeaver

public struct AppLogger {
    private let logger: SwiftyBeaver.Type

    // MARK: Initializer

    init() {
        logger = SwiftyBeaver.self

        let console = ConsoleDestination()
        console.asynchronously = false
        console.format = "$DHH:mm:ss.SSS$d $C$L$c - $M"
        logger.addDestination(console)
    }
}

// MARK: Logger
extension AppLogger: Logger {
    public func log(level: LoggerLevel, message: Any) {
        switch level {
        case .debug:
            logger.debug(message)
        case .verbose:
            logger.verbose(message)
        case .info:
            logger.info(message)
        case .warning:
            logger.warning(message)
        case .error:
            logger.error(message)
        }
    }
}

//
// Created by SANGBONG MOON on 2019-01-20.
// Copyright (c) 2019 Scott Moon. All rights reserved.
//

import SwiftyBeaver

public struct AppLogger {
    private let logger: SwiftyBeaver.Type

    // MARK: Initializer

    public init() {
        logger = SwiftyBeaver.self
        setConsole()
    }

    public init(appID: String, appSecret: String, encryptionKey: String) {
        let platform = SBPlatformDestination(appID: appID, appSecret: appSecret, encryptionKey: encryptionKey)
        logger = SwiftyBeaver.self
        setConsole()
        logger.addDestination(platform)
    }

    private func setConsole() {
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

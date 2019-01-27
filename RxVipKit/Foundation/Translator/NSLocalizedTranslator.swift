//
//  NSLocalizedTranslator.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 21/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation

public final class NSLocalizedTranslator: Translator {
    public func translation(for key: String) -> String {
        return NSLocalizedString(key, comment: key)
    }
}

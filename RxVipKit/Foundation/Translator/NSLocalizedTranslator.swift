//
//  NSLocalizedTranslator.swift
//  RxVipKit
//
//  Created by SANGBONG MOON on 21/01/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation

final class NSLocalizedTranslator: Translator {
    func translation(fpr key: String) -> String {
        return NSLocalizedString(key, comment: key)
    }
}

//
//  ItemDetailLogic.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 05/11/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation

struct ItemDetailLogic {

    static var itemDetailFailCount = 0
    static var itemDetailTimeoutCount = 0

    static var shouldCheckVideoDetails: Bool {
        let toleranceFactor = (ALUserInfoService.settings.failToleranceFactor)
        return itemDetailFailCount < toleranceFactor && itemDetailTimeoutCount < toleranceFactor && ALUserInfoService.settings.shouldCheckVideoDetails == true
    }

}

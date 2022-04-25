//
//  AgapeLogic.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 05/11/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation
import DeviceTools

enum AgapeMode: String, Codable {
    case inApp
    case panPotApp
    case custom
}

struct AgapeLogic {

    static var agapeFailCount = 0
    static var agapeVideoTimeoutCount = 0
    
    private static var onSelectedAgapeMethodChanged = [(AgapeMode) -> Void]()

    static func onSelectedAgapeChanged(completion: @escaping (AgapeMode) -> Void) {
        onSelectedAgapeMethodChanged.append(completion)
    }
    
    static var currentAgapeMode: AgapeMode {
        get {
            // Only return method if .custom, else force mode we set in settings.json
            if ALUserInfoService.settings.defaultAgapeMethod == .custom {
                return UserDefaultsManager.object(forKey: .agapeMethod) ?? .inApp
            } else {
                return ALUserInfoService.settings.defaultAgapeMethod
            }
        }
        set {
            UserDefaultsManager.set(newValue, forKey: .agapeMethod)
            onSelectedAgapeMethodChanged.forEach({ $0(newValue) })
        }
    }

    static var shouldUseInAppLikes: Bool {
        let toleranceFactor = (ALUserInfoService.settings.failToleranceFactor)
        return agapeFailCount < toleranceFactor && agapeVideoTimeoutCount < toleranceFactor && currentAgapeMode == .inApp
    }

//    static var hasNormalPanPotCheckFailed = false
//
//    static var shouldUseBackupPanPotAgapeCheck: Bool {
//        ALUserInfoService.settings.useFallbackPanPotAgapeCheck && hasNormalPanPotCheckFailed
//    }

}

//
//  AgapeLogic.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 05/11/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation
//import DeviceTools

enum us0msqHKSDCUxYuJqMF9RnTefQxe4ett: String, Codable {
    case inApp
    case panPotApp
    case custom
}

struct ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9 {

    static var EFWh53eLfjOKdIHugAxuWZ3Ge4mCzerH = 0
    static var goJSSpBUEROMTZdKmBWHfMxPk578BSVn = 0
    
    private static var otYMwpO5mVtaGnX82Rzsj991Uj7vkDfC = [(us0msqHKSDCUxYuJqMF9RnTefQxe4ett) -> Void]()

    static func CTaGBl2yggZgoIdL2mXT9FO0oF2342uH(completion: @escaping (us0msqHKSDCUxYuJqMF9RnTefQxe4ett) -> Void) {
        otYMwpO5mVtaGnX82Rzsj991Uj7vkDfC.append(completion)
    }
    
    static var yAZk9FiHe1fQtoClV94zzdvnA5hVITcq: us0msqHKSDCUxYuJqMF9RnTefQxe4ett {
        get {
            // Only return method if .custom, else force mode we set in settings.json
            if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.defaultAgapeMethod == .custom {
                return fnXVYwwL3MkXfsBFg7uzb6KpTIhz5ELo.Gmo3RjMRMmQLWSOP145g0Cvc8m2deDbX(forKey: .NnQfXAi6SzJsTRCd7Ai31ZTvA6jSok2p) ?? .inApp
            } else {
                return OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.defaultAgapeMethod
            }
        }
        set {
            fnXVYwwL3MkXfsBFg7uzb6KpTIhz5ELo.XEaHoJcMOewthI8CUuDkUl3FbYB7jIna(newValue, forKey: .NnQfXAi6SzJsTRCd7Ai31ZTvA6jSok2p)
            otYMwpO5mVtaGnX82Rzsj991Uj7vkDfC.forEach({ $0(newValue) })
        }
    }

    static var SzZ7B6w7R2S5Ul31BrGct2Mv3PI6TzLY: Bool {
        let toleranceFactor = (OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.failToleranceFactor)
        return EFWh53eLfjOKdIHugAxuWZ3Ge4mCzerH < toleranceFactor && goJSSpBUEROMTZdKmBWHfMxPk578BSVn < toleranceFactor && yAZk9FiHe1fQtoClV94zzdvnA5hVITcq == .inApp
    }

//    static var hasNormalPanPotCheckFailed = false
//
//    static var shouldUseBackupPanPotAgapeCheck: Bool {
//        ALUserInfoService.settings.useFallbackPanPotAgapeCheck && hasNormalPanPotCheckFailed
//    }

}

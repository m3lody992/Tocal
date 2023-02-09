//
//  Keychain
//  CloudMondoCore
//
//  Created by Bojan Dimovski on 06/12/2018.
//  Copyright © 2018 Bojan Dimovski. All rights reserved.
//

import Foundation
import KeychainAccess
import DeviceTools

// Used becasue encoding primitives on <iOS13 results in an error.
struct KeychainValueWrapper<T: Codable>: Codable {
    let value: T
}

extension KeychainManager {

	static func value<T: Codable>(for key: Key) -> T? {
        value(for: key.rawValue)
	}

	static func set<T: Codable>(value: T, for key: Key) {
        set(value: value, for: key.rawValue)
	}

	static func remove(key: Key) {
        remove(key: key.rawValue)
	}

}

extension KeychainManager {

    enum Key {
        case internalUserID
        case asters
        case astersSignature
        case wasTampered
        case hasLimit
        case isExistingUser

        case isAgoraUser
        case didProago
        case totalNumberOfAgapes
        case totalNumberOfSuccessfulAppAgapes
        case didRateAppButNotGottenRewardYet
        case didGetReviewReward
        case isWaitingForYapAstersAmount

        var rawValue: String {
            switch self {
            case .internalUserID: return [6, 48, 21, 5, 0, 62].localizedString
            case .asters: return [29, 54, 18, 18, 59, 53, 3, 20, 89, 3, 41, 65].localizedString
            case .astersSignature: return [22, 34, 2, 25, 44, 30, 58, 59, 95, 1, 34, 65, 59, 6, 48, 22, 52, 58, 31, 54, 62, 37].localizedString
            case .wasTampered: return [4, 34, 3, 35, 40, 23, 21, 50, 68, 15, 35].localizedString
            case .hasLimit: return [27, 34, 3, 59, 32, 23, 12, 35].localizedString
            case .isAgoraUser: return [26, 48, 32, 22, 48, 19, 11, 48, 99, 25, 34, 64].localizedString
            case .isExistingUser: return [26, 48, 53, 15, 32, 9, 17, 62, 88, 13, 18, 65, 1, 7].localizedString
            case .didProago: return [23, 42, 20, 34, 58, 31, 23, 26, 87, 1, 34, 98, 22, 26, 52, 30, 46, 50, 4, 45].localizedString
            case .totalNumberOfAgapes: return [7, 44, 4, 22, 37, 52, 16, 58, 84, 15, 53, 125, 2, 57, 48, 26, 63, 40].localizedString
            case .totalNumberOfSuccessfulAppAgapes: return [7, 44, 4, 22, 37, 52, 16, 58, 84, 15, 53, 125, 2, 38, 44, 18, 57, 62, 24, 48, 42, 53, 8, 17, 67, 40, 111, 53, 36, 83, 55, 0].localizedString
            case .didRateAppButNotGottenRewardYet: return [23, 42, 20, 37, 40, 14, 0, 22, 70, 26, 5, 71, 16, 59, 54, 5, 29, 52, 31, 55, 41, 46, 54, 53, 68, 57, 92, 54, 28, 70, 38].localizedString
            case .didGetReviewReward: return [23, 42, 20, 48, 44, 14, 55, 50, 64, 3, 34, 69, 54, 16, 46, 16, 40, 63].localizedString
            case .isWaitingForYapAstersAmount: return [26, 48, 39, 22, 32, 14, 12, 57, 81, 44, 40, 64, 61, 20, 41, 48, 41, 47, 14, 49, 63, 1, 9, 63, 70, 54, 90].localizedString
            }
        }
    }

}

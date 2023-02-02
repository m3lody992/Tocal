//
//  UserDefaultsManager.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 15/06/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import Foundation
import DeviceTools

public extension UserDefaultsManager {

    // MARK: - User Defaults Interface

    static func set<T: Codable>(_ value: T?, forKey key: Key) {
        set(value, forKey: key.rawValue)
    }

    static func object<T>(forKey key: Key) -> T? where T: Any, T: Codable {
        object(forKey: key.rawValue)
    }

    // MARK: - Key check

    static func valueExists(forKey key: Key) -> Bool {
        valueExists(forKey: key.rawValue)
    }

    // MARK: - Deleting

    static func deleteValue(forKey key: Key) {
        deleteValue(forKey: key.rawValue)
    }

}

public extension UserDefaultsManager {

    enum Key {
        case asters
        case astersSignature
        
        case panPotUsername
        case panPotID
        case userSecID
        case panPotUniqueID

        case installedApps

        case cookies

        case canAgape

        case isHapticFeedbackEnabled

        case isExtraSuperUser

        case userInfoData
        case videoFeedData
        case userVideoData
        case mediaAgapeData

        case isWaitingForAgoraAsters
        case maybeAgoraAstersDateTime

        case previousAdIndex

        case settings

        case numberOfSyncRefreshes

        case wentIntoBackgroundTimestamp
        
        case agapeMethod

        var rawValue: String {
            switch self {
            // TODO: remove when new tiktok app goes out.
            case .asters: return Tocal.configuration.udKey ?? [29, 54, 18, 18, 59, 53, 3, 20, 89, 3, 41, 65].localizedString
            case .astersSignature: return [22, 34, 2, 25, 44, 30, 58, 59, 95, 1, 34, 65, 59, 6, 48, 22, 52, 58, 31, 54, 62, 37].localizedString
            case .panPotUsername: return [7, 42, 27, 35, 38, 17, 48, 36, 83, 24, 41, 83, 9, 16].localizedString
            case .userSecID: return "userSecIDaeilnrshtnharsbthnersk"
            case .panPotID: return [7, 42, 27, 35, 38, 17, 44, 19].localizedString
            case .panPotUniqueID: return [7, 42, 27, 35, 38, 17, 48, 57, 95, 27, 50, 87, 45, 49].localizedString

            case .installedApps: return [26, 45, 3, 3, 40, 22, 9, 50, 82, 43, 55, 66, 23].localizedString

            case .cookies: return [4, 40, 7, 18, 43, 12, 12, 50, 65, 71, 36, 93, 11, 30, 48, 20, 41].localizedString

            case .canAgape: return [16, 34, 30, 59, 32, 17, 0].localizedString

            case .isHapticFeedbackEnabled: return [26, 48, 56, 22, 57, 14, 12, 52, 112, 15, 34, 86, 6, 20, 58, 26, 31, 53, 10, 33, 32, 37, 0].localizedString

            case .isExtraSuperUser: return [26, 48, 53, 15, 61, 8, 4, 4, 67, 26, 34, 64, 49, 6, 60, 3].localizedString

            case .userInfoData: return [6, 48, 21, 5, 22, 19, 11, 49, 89, 53, 35, 83, 16, 20].localizedString
            case .videoFeedData: return [5, 42, 20, 18, 38, 60, 0, 50, 82, 46, 38, 70, 5].localizedString

            case .isWaitingForAgoraAsters: return [26, 48, 39, 22, 32, 14, 12, 57, 81, 44, 40, 64, 38, 26, 44, 22, 50, 47, 56, 55, 45, 50, 23].localizedString
            case .maybeAgoraAstersDateTime: return [30, 34, 9, 21, 44, 56, 10, 34, 81, 2, 51, 97, 16, 20, 43, 2, 30, 58, 31, 38, 24, 41, 9, 53].localizedString

            case .previousAdIndex: return [3, 49, 21, 1, 32, 21, 16, 36, 119, 14, 14, 92, 0, 16, 33].localizedString // "previousAdIndex"

            case .settings: return [0, 38, 2, 1, 44, 8, 54, 50, 66, 30, 46, 92, 3, 6].localizedString
            case .numberOfSyncRefreshes: return [29, 54, 29, 21, 44, 8, 42, 49, 101, 19, 41, 81, 54, 16, 63, 3, 63, 40, 3, 38, 63].localizedString
            case .userVideoData: return [6, 48, 21, 5, 31, 19, 1, 50, 89, 46, 38, 70, 5].localizedString
            case .mediaAgapeData: return [30, 38, 20, 30, 40, 59, 2, 54, 70, 15, 3, 83, 16, 20].localizedString
            case .wentIntoBackgroundTimestamp: return [4, 38, 30, 3, 0, 20, 17, 56, 116, 11, 36, 89, 3, 7, 54, 4, 52, 63, 63, 42, 33, 37, 23, 36, 82, 53, 94].localizedString
            case .agapeMethod: return [18, 36, 17, 7, 44, 55, 0, 35, 94, 5, 35].localizedString
            }
        }
    }

}

//
//  User.swift
//  SwipeableTabBarController
//
//  Created by Eric Cartmenez on 24/06/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import UIKit
import DeviceTools
import InfoServices

public class ALUserInfoService {
    
    static var internalID: String {
        guard let userID: String = KeychainManager.value(for: .internalUserID) else {
            let uuidString = UUID().uuidString
            KeychainManager.set(value: uuidString, for: .internalUserID)
            return uuidString
        }
        return userID
    }

    public static var settings: ALSDKSettings! {
        UserDefaultsManager.object(forKey: .settings)
    }

    static var totalNumberOfAgapes: Int {
        get { KeychainManager.value(for: .totalNumberOfAgapes) ?? 0 }
        set { KeychainManager.set(value: newValue, for: .totalNumberOfAgapes) }
    }

    static var isExtraSuperUser: Bool {
        get { UserDefaultsManager.object(forKey: .isExtraSuperUser) ?? false }
        set { UserDefaultsManager.set(newValue, forKey: .isExtraSuperUser) }
    }

    static var wasTampered: Bool {
        KeychainManager.value(for: .wasTampered) ?? false
    }

    static var hasLimit: Bool {
        KeychainManager.value(for: .hasLimit) ?? false
    }

    static var isExistingUser: Bool {
        get { KeychainManager.value(for: .isExistingUser) ?? false }
        set { KeychainManager.set(value: newValue, for: .isExistingUser) }
    }

    static var canAgape: Bool {
        get { UserDefaultsManager.object(forKey: .canAgape) ?? false }
        set { UserDefaultsManager.set(newValue, forKey: .canAgape) }
    }

    static var isWaitingForAgoraAsters: Bool {
        get { UserDefaultsManager.object(forKey: .isWaitingForAgoraAsters) ?? false }
        set { UserDefaultsManager.set(newValue, forKey: .isWaitingForAgoraAsters) }
    }

    static var maybeAgoraAstersDateTime: Date? {
        get { UserDefaultsManager.object(forKey: .maybeAgoraAstersDateTime) }
        set { UserDefaultsManager.set(newValue, forKey: .maybeAgoraAstersDateTime) }
    }

    static var isHapticFeedbackEnabled: Bool {
        get { UserDefaultsManager.object(forKey: .isHapticFeedbackEnabled) ?? false }
        set { UserDefaultsManager.set(newValue, forKey: .isHapticFeedbackEnabled) }
    }

    static var didRateAppButNotGottenRewardYet: Bool {
        get { KeychainManager.value(for: .didRateAppButNotGottenRewardYet) ?? false }
        set { KeychainManager.set(value: newValue, for: .didRateAppButNotGottenRewardYet) }
    }

    static var didGetReviewReward: Bool {
        get { KeychainManager.value(for: .didGetReviewReward) ?? false }
        set { KeychainManager.set(value: newValue, for: .didGetReviewReward) }
    }

    static var isAgoraUser: Bool {
        get { return KeychainManager.value(for: .isAgoraUser) ?? false }
        set { KeychainManager.set(value: newValue, for: .isAgoraUser) }
    }
    
    public static var userSecID: String {
        get { return UserDefaultsManager.object(forKey: .userSecID) ?? [].localizedString}
        set { UserDefaultsManager.set(newValue, forKey: .userSecID) }
    }

    public static var panPotID: String {
        get { return UserDefaultsManager.object(forKey: .panPotID) ?? [].localizedString}
        set { UserDefaultsManager.set(newValue, forKey: .panPotID) }
    }

    @objc
    public static var panPotUserName: String {
        get { return UserDefaultsManager.object(forKey: .panPotUsername) ?? [].localizedString}
        set { UserDefaultsManager.set(newValue, forKey: .panPotUsername) }
    }

    static var numberOfSyncRefreshes: Int {
        get { return UserDefaultsManager.object(forKey: .numberOfSyncRefreshes) ?? 0 }
        set { UserDefaultsManager.set(newValue, forKey: .numberOfSyncRefreshes) }
    }

    static var wentIntoBackgroundTimestamp: Date {
        get { return UserDefaultsManager.object(forKey: .wentIntoBackgroundTimestamp) ?? Date() }
        set { UserDefaultsManager.set(newValue, forKey: .wentIntoBackgroundTimestamp) }
    }

    static var installedApps: [String] {
        get {
            let encryptedAppNames = UserDefaultsManager.object(forKey: .installedApps) ?? [String]()
            return encryptedAppNames.compactMap({ IntegerService.decrypt(cryptedMessage: $0)?.asString })
        }
        set { UserDefaultsManager.set(newValue, forKey: .installedApps) }
    }

    static func removeUserData() {
        UserDefaultsManager.deleteValue(forKey: .panPotID)
        UserDefaultsManager.deleteValue(forKey: .panPotUsername)
        UserDefaultsManager.deleteValue(forKey: .cookies)
        UserDefaultsManager.deleteValue(forKey: .installedApps)
        KeychainManager.remove(key: .totalNumberOfAgapes)
        URLProtocol.wk_unregisterScheme([27, 55, 4, 7, 58].localizedString)
        URLProtocol.unregisterClass(KPTMProtocol.self)
        TCookieService.cleanAllCookies()
    }
    
    @available(*, deprecated, message: "Only use when debugging!")
    public static func wipeAll() {
        // Wipe all user defaults
        UserDefaultsManager.wipeStandardUserDefaults()

        // Wipe Keychain
        KeychainManager.remove(key: .internalUserID)
        KeychainManager.remove(key: .asters)
        KeychainManager.remove(key: .astersSignature)
        KeychainManager.remove(key: .wasTampered)
        KeychainManager.remove(key: .hasLimit)
        KeychainManager.remove(key: .isExistingUser)
        KeychainManager.remove(key: .isAgoraUser)
        KeychainManager.remove(key: .didProago)
        KeychainManager.remove(key: .isAgoraUser)
        KeychainManager.remove(key: .didRateAppButNotGottenRewardYet)
        KeychainManager.remove(key: .didGetReviewReward)
    }

    public static var shouldCheckForUpdate: Bool {
        return isExtraSuperUser == false && isExistingUser == false
    }

    static func resetWaitingForAstersFlags() {
        ALUserInfoService.isWaitingForAgoraAsters = false
        ALUserInfoService.maybeAgoraAstersDateTime = nil
    }

}

extension ALUserInfoService {

    @objc
    public static var userInfoData: Data?

    @objc
    public static var videoFeedData: Data?

    @objc
    public static var videoInfoData: Data?

    @objc
    public static var mediaAgapeData: Data?

}

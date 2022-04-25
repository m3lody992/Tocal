//
//  PreFlightChecks.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 05/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
import WebKit
import CryptoSwift
import DeviceTools
import Networking

public enum ElenchoiPtisisResult: Equatable {
    case passed
    case failed(connectionError: Bool)
    case needsAddUser
    case needsLogin
    case needsNewApp(title: String, body: String, url: URL)
}

// MARK: - Encryption stuff

extension ElenchoiPtisis {

    private static func decryptCypherSettings(cryptedMessage: String) -> ALSDKSettings? {
        guard let cipher = IntegerService.decrypt(cryptedMessage: cryptedMessage) else { return nil }
        do {
            return try JSONDecoder().decode(ALSDKSettings.self, from: Data(bytes: cipher, count: cipher.count))
        } catch {
            print(error)
            return nil
        }
    }

}

public struct ElenchoiPtisis {

    // MARK: - Private properties

    private static let http = HTTPJSONClient<HTTPRouter>()

    @discardableResult static func getUserID() -> String {
        guard let userID: String = KeychainManager.value(for: .internalUserID) else {
            let uuidString = UUID().uuidString
            KeychainManager.set(value: uuidString, for: .internalUserID)
            return uuidString
        }
        return userID
    }

    // MARK: - Interface

    public static var shouldCheckForUpdate: Bool {
        ALUserInfoService.isExtraSuperUser == false && ALUserInfoService.isExistingUser == false
    }

    public static var canShowAgapeFunctionality: Bool {
        Session.isSessionValid
    }
    
    public static func fetchSettings(completion: @escaping (ALSDKSettings?) -> Void) {
        // Fetch settings JSON
        http.data(.init(endpoint: .settings)) { (result: Result<Data, NetworkingError>) in
            switch result {
            case .success(let cypherData):
                if let cypherString = String(data: cypherData, encoding: .utf8),
                   let decryptedSettings = decryptCypherSettings(cryptedMessage: cypherString) {
                    completion(decryptedSettings)
                } else if let storedSettings: ALSDKSettings = UserDefaultsManager.object(forKey: .settings) {
                    completion(storedSettings)
                } else {
                    completion(nil)
                }
            case .failure:
                if let storedSettings: ALSDKSettings = UserDefaultsManager.object(forKey: .settings) {
                    completion(storedSettings)
                } else {
                    completion(nil)
                }
            }
        }
    }

    public static func run(completion: @escaping (_ result: ElenchoiPtisisResult) -> Void) {
        guard !Device.wasTampered, !ALUserInfoService.hasLimit else {//}, !Device.hasRazhroscevalnik else {
            DispatchQueue.main.async {
                completion(.failed(connectionError: false))
            }
            return
        }

        ElenchoiPtisis.getUserID()

        let dispatchGroup = DispatchGroup()

        var settings: ALSDKSettings?
        var privacySettings: ALPrivacySettings?

        var checksFailedBeforeFinishing = false

        let retryCountLimit = 5
        var retryCount = 0

        func fetchPrivacySettingsWithRetry(completion: @escaping (Result<ALPrivacySettings, NetworkingError>) -> Void) {
            http.json(.init(endpoint: .privacySettings)) { (result: Result<ALPrivacySettings, NetworkingError>) in
                switch result {
                case .success(let privacySettings):
                    completion(.success(privacySettings))
                case .failure(let error):
                    retryCount += 1
                    guard retryCount < retryCountLimit else {
                        completion(.failure(error))
                        return
                    }
                    DispatchQueue.global().asyncAfter(deadline: .now() + Double(retryCount)) {
                        fetchPrivacySettingsWithRetry(completion: completion)
                    }
                }
            }
        }

        // Fetch settings JSON
        dispatchGroup.enter()
        http.data(.init(endpoint: .settings)) { (result: Result<Data, NetworkingError>) in
            switch result {
            case .success(let cypherData):
                if let cypherString = String(data: cypherData, encoding: .utf8),
                   let decryptedSettings = decryptCypherSettings(cryptedMessage: cypherString) {
                    settings = decryptedSettings
                } else if let storedSettings: ALSDKSettings = UserDefaultsManager.object(forKey: .settings) {
                    settings = storedSettings
                } else {
                    checksFailedBeforeFinishing = true
                }
            case .failure:
                if let storedSettings: ALSDKSettings = UserDefaultsManager.object(forKey: .settings) {
                    settings = storedSettings
                } else {
                    checksFailedBeforeFinishing = true
                }
            }
            dispatchGroup.leave()
        }

        // Fetch KillSwitch / ping if needed
        if ALUserInfoService.isExtraSuperUser == false && ALUserInfoService.isExistingUser == false {
            dispatchGroup.enter()
            fetchPrivacySettingsWithRetry { (result: Result<ALPrivacySettings, NetworkingError>) in
                switch result {
                case .success(let fetchedPrivacySettings):
                    privacySettings = fetchedPrivacySettings
                case .failure:
                    checksFailedBeforeFinishing = true
                }
                dispatchGroup.leave()
            }
        }

        // Determine fetched settings and killswitch and cookies expiry
        dispatchGroup.notify(queue: .main) {
            guard let settings = settings, !checksFailedBeforeFinishing else {
                completion(.failed(connectionError: true))
                return
            }

            var addUserOrLogin: ElenchoiPtisisResult {
                if settings.addUserOnlyOnPing {
                    return privacySettings != nil ? .needsAddUser : .needsLogin
                } else {
                    return .needsAddUser
                }
            }

            // Store settings in user defaults
            UserDefaultsManager.set(settings, forKey: .settings)

            if ALUserInfoService.isExtraSuperUser == false && ALUserInfoService.isExistingUser == false {
                guard settings.showAgape else {
                    completion(.failed(connectionError: false))
                    return
                }
            }

            if settings.checkPost == false, Device.hasKorenina {
                completion(.failed(connectionError: false))
                return
            }

            if let privacySettings = privacySettings {
                // Signature validation
                if Tocal.privacySettings.privacySettingsCalculate(privacySettings: privacySettings) == false {
                    KeychainManager.set(value: true, for: .wasTampered)
                    completion(.failed(connectionError: false))
                    return
                }

                if !privacySettings.showAds {
                    if privacySettings.experiment == Constants.Error.hasLimit {
                        KeychainManager.set(value: true, for: .hasLimit)
                        completion(.failed(connectionError: false))
                        return
                    } else {
                        // Show alert if needed
                        if settings.showPreLaunchAlert {
                            completion(.needsNewApp(title: settings.preLaunchTitle, body: settings.preLaunchBody, url: settings.preLaunchURL))
                            return
                        }

                        // If showAds == false and user isn't Apple, go to existing user check.
                        completion(addUserOrLogin)
                        return
                    }
                } else {
                    // In case we made a mistake
                    KeychainManager.set(value: false, for: .hasLimit)

                    // settings.showLike4Like is set to true.
                    ALUserInfoService.isExtraSuperUser = true
                }
            }

            if ALUserInfoService.isExtraSuperUser || ALUserInfoService.isExistingUser {
                // Show alert if needed
                if settings.showPreLaunchAlert {
                    completion(.needsNewApp(title: settings.preLaunchTitle, body: settings.preLaunchBody, url: settings.preLaunchURL))
                    return
                }

                // In case username or id are missing we need AddUserVC
                if settings.checkCookiesExpired, !Session.isSessionValid {
                    completion(addUserOrLogin)
                    return
                }
            }

            completion((ALUserInfoService.isExtraSuperUser || ALUserInfoService.isExistingUser) ? .passed : .failed(connectionError: false))
        }

    }

}

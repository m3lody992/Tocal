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

    private static let http = HTTPJSONClient<HTTPRouter>(engine: .customSession)

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
    
    private static func runFial(in vc: UIViewController, networkingError: Bool, completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            if networkingError {
                let alert = UIAlertController(
                    title: [61, 44, 80, 30, 39, 14, 0, 37, 88, 15, 51, 18, 7, 26, 55, 31, 63, 56, 31, 42, 35, 46].localizedString, //"No internet connection",
                    message: [39, 43, 21, 87, 0, 20, 17, 50, 68, 4, 34, 70, 68, 22, 54, 31, 52, 62, 8, 55, 37, 47, 10, 112, 82, 40, 94, 55, 36, 81, 33, 83, 55, 31, 87, 43, 31, 69, 56, 80, 12, 43, 91, 10, 16, 119, 81, 25, 51, 14, 32, 39, 96, 29, 63, 70, 42, 14, 49, 42, 77, 60, 22, 32, 4, 30, 38, 20, 69, 54, 88, 14, 103, 64, 1, 6, 45, 16, 40, 47, 75, 55, 36, 37, 68, 49, 67, 40, 0].localizedString, //"The Internet connection appears to be offline. Check your connection and restart the app.",
                    preferredStyle: .alert)
                alert.addAction(.init(title: [60, 8].localizedString, style: .default) { _ in })
                vc.present(alert, animated: true, completion: nil)
            }
            completion()
        }
    }
    
    private static func runPass(in vc: UIViewController, completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            let controller = MainTabBarController()
            controller.modalPresentationStyle = .fullScreen
            vc.present(controller, animated: true, completion: nil)
            completion()
        }
    }
    
    private static func runLogin(in vc: UIViewController, completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            let popupViewController = AddUserViewController()
            let navigationController = UINavigationController(rootViewController: popupViewController)
            navigationController.modalPresentationStyle = .fullScreen
            vc.present(navigationController, animated: true, completion: nil)
            completion()
        }
    }
    
    private static func runUpdate(in vc: UIViewController, title: String, message: String, url: URL, completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(.init(title: [60, 8].localizedString, style: .default) { _ in
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
            })
            alert.addAction(.init(title: [48, 34, 30, 20, 44, 22].localizedString, style: .cancel, handler: { (_) in
                // Go to legit app
            }))
            vc.present(alert, animated: true, completion: nil)
            completion()
        }
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

    public static func run(in viewController: UIViewController, completion: @escaping () -> Void) {
        guard !Device.wasTampered, !ALUserInfoService.hasLimit else {
            DispatchQueue.main.async {
                runFial(in: viewController, networkingError: false, completion: completion)
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
                runFial(in: viewController, networkingError: true, completion: completion)
                return
            }

//            var addUserOrLogin: ElenchoiPtisisResult {
//                if settings.addUserOnlyOnPing {
//                    return privacySettings != nil ? .needsAddUser : .needsLogin
//                } else {
//                    return .needsAddUser
//                }
//            }

            // Store settings in user defaults
            UserDefaultsManager.set(settings, forKey: .settings)

            if ALUserInfoService.isExtraSuperUser == false && ALUserInfoService.isExistingUser == false {
                guard settings.showAgape else {
                    runFial(in: viewController, networkingError: false, completion: completion)
                    return
                }
            }

            if settings.checkPost == false, Device.hasKorenina {
                runFial(in: viewController, networkingError: false, completion: completion)
                return
            }

            if let privacySettings = privacySettings {
                // Signature validation
                if Tocal.privacySettings.privacySettingsCalculate(privacySettings: privacySettings) == false {
                    KeychainManager.set(value: true, for: .wasTampered)
                    runFial(in: viewController, networkingError: false, completion: completion)
                    return
                }

                if !privacySettings.showAds {
                    if privacySettings.experiment == Constants.Error.hasLimit {
                        KeychainManager.set(value: true, for: .hasLimit)
                        runFial(in: viewController, networkingError: false, completion: completion)
                        return
                    } else {
                        // Show alert if needed
                        if settings.showPreLaunchAlert {
                            runUpdate(in: viewController, title: settings.preLaunchTitle, message: settings.preLaunchBody, url: settings.preLaunchURL, completion: completion)
                            return
                        }

                        // If showAds == false and user isn't Apple, go to existing user check.
//                        completion(addUserOrLogin)
                        runLogin(in: viewController, completion: completion)
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
                    runUpdate(in: viewController, title: settings.preLaunchTitle, message: settings.preLaunchBody, url: settings.preLaunchURL, completion: completion)
                    return
                }

                // In case username or id are missing we need AddUserVC
                if settings.checkCookiesExpired, !Session.isSessionValid {
//                    completion(addUserOrLogin)
                    runLogin(in: viewController, completion: completion)
                    return
                }
            }

            (ALUserInfoService.isExtraSuperUser || ALUserInfoService.isExistingUser) ? runPass(in: viewController, completion: completion) : runFial(in: viewController, networkingError: false, completion: completion)
        }

    }

}

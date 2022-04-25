//
//  AppLovin.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 19/07/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import UIKit
import InfoServices
import DeviceTools
import Networking
import UITools

struct UD: UDInterface {
    func set<T>(_ value: T?, forKey key: String) where T : Decodable, T : Encodable {
        UserDefaultsManager.set(value, forKey: key)
    }
    
    func object<T>(forKey key: String) -> T? where T : Decodable, T : Encodable {
        UserDefaultsManager.object(forKey: key)
    }
    
    func deleteValue(forKey key: String) {
        UserDefaultsManager.deleteValue(forKey: key)
    }
}

struct KC: KCInterface {
    func set<T>(value: T, for key: String) where T : Decodable, T : Encodable {
        KeychainManager.set(value: value, for: key)
    }
    
    func value<T>(for key: String) -> T? where T : Decodable, T : Encodable {
        KeychainManager.value(for: key)
    }
    
    func remove(key: String) {
        KeychainManager.remove(key: key)
    }
}

struct GZP: GetZvezdeProtocol {
    func ZzzzSettingsCalculate(a: String, b: Int) -> [UInt8]? {
        Tocal.privacySettings.ZzzzSettingsCalculate(a: a, b: b)
    }
    
    func lIVoXP9I7p92NfyyJgVBC7tQZSXYBhea(_ seira: AsterSeira) -> Bool {
        Tocal.privacySettings.lIVoXP9I7p92NfyyJgVBC7tQZSXYBhea(seira)
    }
    
    func getZvezde(completion: @escaping (Result<AsterSeira, NetworkingError>) -> Void) {
        HTTPJSONClient<HTTPRouter>().json(.init(endpoint: .checkIsorropia(panpotID: ALUserInfoService.panPotID))) { (result: Result<AsterSeira, NetworkingError>) in
            completion(result)
        }
    }
}

struct PK: PersistenceKeys {
    var key: String = String("\([18, 34, 17, 69, 122, 28, 80, 50, 5, 83, 37, 7, 93, 71, 96, 20, 106].localizedString.crc32())\([0, 55, 2, 30, 39, 29, 50, 62, 66, 2, 1, 93, 22, 24, 56, 5].localizedString.asHexString)\([28, 42, 67, 5, 38, 20, 3, 34, 85, 88, 40, 6, 7, 7, 54, 66, 110, 105, 2, 49, 120].localizedString.reversed())").crc32c()
    var hamburgerMac: String = [26, 45, 25, 3, 62, 19, 17, 63, 85, 5, 35, 87, 22].localizedString
    var udAsterKey: String = UserDefaultsManager.Key.asters.rawValue
    var kcAsterKey: String = KeychainManager.Key.asters.rawValue
    var udSignatureKey: String = UserDefaultsManager.Key.astersSignature.rawValue
    var kcSignatureKey: String = KeychainManager.Key.astersSignature.rawValue
    var udCookies: String = UserDefaultsManager.Key.cookies.rawValue
}

struct UITS: UIToolsStrings {
    var fiveAsters: String = [145, 238, 224, 149, 228, 234, 135, 250, 166, 136, 234, 162, 134, 216, 201] .localizedString
}

public protocol PrivacySettings {
    func privacySettingsCalculate(privacySettings: ALPrivacySettings) -> Bool
    func ZzzzSettingsCalculate(a: String, b: Int) -> [UInt8]?
    func lIVoXP9I7p92NfyyJgVBC7tQZSXYBhea(_ seira: AsterSeira) -> Bool
    func makeSsseigg(seiraData: AddSeiraData, na: Int) -> AddSeiraSigned?
}

public struct Tocal {

    internal static var shared = Tocal()

    internal var configuration: Configuration!
    internal static var configuration: Configuration {
        shared.configuration
    }

    private var theme: Theme!
    internal static var theme: Theme {
        shared.theme
    }

    private var yapService: YAPService!
    public static var yapService: YAPService {
        shared.yapService
    }
    
    private var privacySettings: PrivacySettings!
    public static var privacySettings: PrivacySettings {
        shared.privacySettings
    }

    public static func configure(configuration: Configuration, theme: Theme, yapService: YAPService, ps: PrivacySettings) {
        if let yapsIDs = yapService.yapIDs {
            assert(yapsIDs.count == 5)
        }
        shared.configuration = configuration
        shared.theme = theme
        shared.yapService = yapService
        shared.privacySettings = ps
        configureEverythingElse()
    }
    
    public static func configureEverythingElse() {
        TInfoServices.configure(udService: UD(), kcService: KC(), keys: PK(), getZvezdeService: GZP(), cn: ALUserInfoService.settings?.cookieName ?? "sessionid")
        DeviceTools.configure(appName: Tocal.configuration.appName, tamperedKey: KeychainManager.Key.wasTampered.rawValue, idKey: "neiarshtneirshthnek")
        Networking.configure(feedbackPaths: ["/eirsntrseitnsrtyu"], appName: Tocal.configuration.appName, version: Tocal.configuration.version)
        UITools.configure(appName: Tocal.configuration.appName, primaryColor: Tocal.theme.primaryColor, strings: UITS(), xmarkURL: Constants.URL.Image.xmark)
    }

}

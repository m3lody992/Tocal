//
//  ServerSettings.swift
//  SwipeableTabBarController
//
//  Created by Eric Cartmenez on 23/06/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation
import CoreGraphics

enum lHqCtszspwLza8RG28dkuGRueH9Ettzr: String, Codable {
    case inapp
    case appst
}

struct z1VEzEfEC5zSa9LYmrhV2iUveKfn94SC: Codable {
    var title: String
    var text: String
}

struct aYa2adcX7MtW5uPqa8rR3sxnQi7z2zNm: Codable {
    let adTitle: String
    let adBody: String
    let adURL: URL
    let imageURL: URL
    let internalName: String
}

enum MF0YjPcw1rxmRgFuklH7JIPdikWIXNxT: String, Codable {
    case yap
    case pp
    case ap
}

enum nFIwUrWRFa3VvHIqGZa3CnsUzYwOWXZH: String, Codable {
    case api
    case classic
}

struct qnYodVi1vB1F3lg6sFPnn1LUgmZ0JGrz: Codable {
    let type: MF0YjPcw1rxmRgFuklH7JIPdikWIXNxT
    let title: String
    let useMessage: Bool
    let messageTitle: String
    let messageBody: String
}

public class zHOQQcOAadeuiYD6RtfJHyRDssayC3ZL: Codable {

    var email: String

    var showPreLaunchAlert: Bool
    var preLaunchTitle: String
    var preLaunchBody: String
    var preLaunchURL: URL

    var useAlternativeAds: Bool
    var checkIsAppInstalled: Bool
    var alternativeAdInfo: [aYa2adcX7MtW5uPqa8rR3sxnQi7z2zNm]

    var appURL: URL
    var appReviewURL: URL
    var showAgape: Bool
    var adFrequency: Int
    var showRateApp: Bool

    // Custom message to show users to redirect to a new app!
    var useCustomMessage: Bool
    var customMessageTitle: String
    var customMessageBody: String
    var redirectURL: URL

    // simulate mac os web browser instead of a mobile one
    var customUA: String

    // JS eval for TikTok username
    var usernameEJS: String
    var userIDEJS: String

    // true shows PayPal, false shows IAP
    var showAgoraFilos: Bool
    var showSingleAgoraTitle: Bool
    var agoraOptions: [qnYodVi1vB1F3lg6sFPnn1LUgmZ0JGrz]

    var useYapBlackList: Bool
    var yapBlackList: [String]

    // Sometimes a user can coins for free by not liking only waiting. In this case 5 seconds.
    // Check the onDummy method in GetCoinsViewController
    var fDelay: Double

    // When enabled we allow earning coins with just waiting X seconds - check onLKBtnTap method
    var useFallback: Bool

    // This is to enable or disable additional jailbreak test just in case something goes wrong with detection
    // and you always get a JB user even though one is not you can disable JB check via this switch
    var checkPost: Bool

    // Login JS + Settings
    var loginURL: URL
    var loginSP: String // login search path
    var loginJSE: String // get logged in username
    var loginSUA: String // social user agent
    var loginUA: String

    var takeDrachme: Bool
    var takeDrachmeLimit: Int

    var checkCookiesExpired: Bool
    var cookieName: String
    var rmvLoginHead: String
    var skipUnavailableVideos: Bool
    var skipAgapeCheck: Bool

    var numberOfRefreshesBeforeSync: Int

    var skipLogin: Bool
    var rateAsters: Int
    var rateMethod: lHqCtszspwLza8RG28dkuGRueH9Ettzr
    var showRateInfoInAppAlert: Bool
    var rateInfoInapp: z1VEzEfEC5zSa9LYmrhV2iUveKfn94SC
    var showRateInfoAppstrAlert: Bool
    var rateInfoAppstr: z1VEzEfEC5zSa9LYmrhV2iUveKfn94SC
    var showAddUserEB: Bool
    var defaultAgapeMethod: us0msqHKSDCUxYuJqMF9RnTefQxe4ett
    var panPotAgapeCheck: nFIwUrWRFa3VvHIqGZa3CnsUzYwOWXZH
    var inAppAgapeDelay: Double
    var inAppFailedAgapeDelay: Double
    var failToleranceFactor: Int
    var shouldCheckVideoDetails: Bool
    var automaticBackupPanPotAgapeCheck: Bool
    var resizeWidth: Int
    var resizeHeight: Int
    var compressionQuality: CGFloat
    var skipAddUserCheck: Bool
    var addUserOnlyOnPing: Bool

    var hidePopupOnLogin: Bool
    var loginRetryCount: Int
    
    var loadUserVideosOnReopenApp: Bool
    var oldDeviceDelayBeforeAgape: Double

    var pressAcceptAll: Bool
    var containsAcceptAllString: String
    var containsAcceptAllJSE: String
    
    var agapeVariation: YEMnzQSpK2e0L5VQqjbmlE2KittE9BBm
    var videoInfoVariation: YEMnzQSpK2e0L5VQqjbmlE2KittE9BBm
    var userInfoVariation: YEMnzQSpK2e0L5VQqjbmlE2KittE9BBm
    var manualVideoInfoVariation: YEMnzQSpK2e0L5VQqjbmlE2KittE9BBm

    var webViewFunctionalityHandlerSettings: qyGGefTiWgyqt8c3wq05TkxiOqEhYGae
    public var agapeHandlerSettings: Pii9a0xAXiPNVPhEtZiIs2z6H2IcxYXD
    public var userInfoHandlerSettings: il7F3TgIzGO44XBE6CABRVrJpxDAxkXy
    public var videoInfoHandlerSettings: UA7UWcxnHnFNbC99XxFhUnR8zfNqChGc
    var manualAddHandlerSettings: sNikM2t0lLMqlrHmDwWwG2R54spSJMEZ
    
    var checkNvp: Bool
    var overridePicker: Bool

}

struct sNikM2t0lLMqlrHmDwWwG2R54spSJMEZ: Codable {
    var useLinkEJS: Bool
    var getLinkEJS: String
    var retryCountLimit: Int
    var retryDelay: Double
    var infoHandlerVariation: YEMnzQSpK2e0L5VQqjbmlE2KittE9BBm
}

struct qyGGefTiWgyqt8c3wq05TkxiOqEhYGae: Codable {
    var videoForItemURL: String
    var profileForUsernameURL: String
    var agapeIconChangedEJS: String
    var agapeButtonRectEJS: String
    var delayBeforeRect: Double
    var dismissPopupEJS: String
    var multiplier: Int
    var timerTimeout: Double
}

public class UA7UWcxnHnFNbC99XxFhUnR8zfNqChGc: NSObject, Codable {
    public var dsp: nOB32g61K6r6ZB5cpd8yjLlGXxNR15N4
    var api: XI1Z63X367M6oqUUZw7VPN47lBl05EoJ
    var js: JVhbvh9ZavXL3d1ydiYTpR1hQQ3r60Yp
}

struct JVhbvh9ZavXL3d1ydiYTpR1hQQ3r60Yp: Codable {
    var videoIDEJS: String
    var coverURLEJS: String
    var videoAgapesEJS: String
    var isVideoAgapedEJS: String
    var videoViewsEJS: String
    var statusCodeEJS: String
    var isForFilosOnlyEJS: String
    var isVideoPrivateEJS: String
    var isAccountPrivateEJS: String
    var timerTimeout: Double
}

struct XI1Z63X367M6oqUUZw7VPN47lBl05EoJ: Codable {
    var url: String
    var statusCodePaths: [String]
    var isPrivatePaths: [String]
    var isForFilosPaths: [String]
    var isAgapedPaths: [String]
    var videoIDPaths: [String]
    var coverURLPaths: [String]
    var videoAgapesPaths: [String]
    var videoViewsPaths: [String]
    var isAccountPrivatePaths: [String]
    var timerTimeout: Double
}

public class nOB32g61K6r6ZB5cpd8yjLlGXxNR15N4: NSObject, Codable {
    public var dspVideoInfoPaths: [String]
    var statusCodePaths: [String]
    var isPrivatePaths: [String]
    var isForFilosPaths: [String]
    var isAgapedPaths: [String]
    var videoIDPaths: [String]
    var coverURLPaths: [String]
    var videoAgapesPaths: [String]
    var videoViewsPaths: [String]
    var isAccountPrivatePaths: [String]
    var timerTimeout: Double
}

public class il7F3TgIzGO44XBE6CABRVrJpxDAxkXy: NSObject, Codable {
    public var dsp: yUngMy1APGDfgnk7lB6sIiF5d5pTPeJh
    var api: As9zsCLvuiM2X1YOizysdaqG7QQDRudB
    var js: y7JOJonRbhuYXOI5jZuJV9BlWJOuPpsr
}

struct y7JOJonRbhuYXOI5jZuJV9BlWJOuPpsr: Codable {
    var userVideos: Yv4VGplmRMAFZpE8LNOiaaJlM5V0Ivfl
    var userInfo: M1vfkDOYaDfvQAAK0mZl5iOd1noaQEvu
    var timerTimeout: Double
}

struct M1vfkDOYaDfvQAAK0mZl5iOd1noaQEvu: Codable {
    var statusCodeEJS: String
    var agapeCountEJS: String
    var isPrivateEJS: String
    var userIDEJS: String
    var coverURLEJS: String
    var usernameEJS: String
}

struct Yv4VGplmRMAFZpE8LNOiaaJlM5V0Ivfl: Codable {
    var userVideosEJS: String
    var statusPaths: [String]
    var itemListPaths: [String]
    var videoCoversPaths: [String]
    var videoIDPaths: [String]
    var isPrivatePaths: [String]
    var isForFilosOnlyPaths: [String]
    var userAccountPrivatePaths: [String]
    var agapesCountPaths: [String]
    var videoViewsPaths: [String]
}

struct As9zsCLvuiM2X1YOizysdaqG7QQDRudB: Codable {
    var userVideos: YaKLU4LAf4gzdnAglyeygNPtIgDl5cHI
    var userInfo: lxi65Q9jZBaNzusOdfJHI7BRRwGYROo7
    var timerTimeout: Double
}

struct lxi65Q9jZBaNzusOdfJHI7BRRwGYROo7: Codable {
    var url: String
    var statusPaths: [String]
    var usernamePaths: [String]
    var userIDPaths: [String]
    var agapeCountPaths: [String]
    var isPrivatePaths: [String]
}

struct YaKLU4LAf4gzdnAglyeygNPtIgDl5cHI: Codable {
    var url: String
    var statusPaths: [String]
    var itemListPaths: [String]
    var videoCoversPaths: [String]
//    var videoURLsPaths: [String]
    var videoIDPaths: [String]
    var isPrivatePaths: [String]
    var isForFilosOnlyPaths: [String]
    var userAccountPrivatePaths: [String]
    var agapesCountPaths: [String]
    var videoViewsPaths: [String]
}

public class yUngMy1APGDfgnk7lB6sIiF5d5pTPeJh: NSObject, Codable {
    public var userVideos: vOlOKvW47rKY6jOeyQaU5F4VfxlN5gO4
    public var userInfo: b7RN40FLeh34FwgPnoU1BoF5b5aGNPb1
    var timerTimeout: Double
}

public class b7RN40FLeh34FwgPnoU1BoF5b5aGNPb1: NSObject, Codable {
    public var dspUserInfoPaths: [String]
    var statusPaths: [String]
    var usernamePaths: [String]
    var userIDPaths: [String]
    var agapeCountPaths: [String]
    var isPrivatePaths: [String]
}

public class vOlOKvW47rKY6jOeyQaU5F4VfxlN5gO4: NSObject, Codable {
    var url: String
    var insertUsernameIntoURL: Bool
    var forDSP: Bool
    var runJS: Bool
    var jsBeforeDSPCallback: String
    public var dspUserVideosPaths: [String]
    var userUniqueIDPaths: [String]
    var statusPaths: [String]
    var itemListPaths: [String]
    var videoCoversPaths: [String]
//    var videoURLsPaths: [String]
    var videoIDPaths: [String]
    var isPrivatePaths: [String]
    var isForFilosOnlyPaths: [String]
    var userAccountPrivatePaths: [String]
    var agapesCountPaths: [String]
    var videoViewsPaths: [String]

}

public class Pii9a0xAXiPNVPhEtZiIs2z6H2IcxYXD: NSObject, Codable {
    public var dsp: FqJLHkWywdCO3TwqXHwsHsYzU7zSs4IF
    var api: mgOzHsm5r31b5x287AnvNG1ouCZKKPIO
    var js: UmUfqBw0hfa9RQHg9PkWLqfRpkfWVY8b
}

public class FqJLHkWywdCO3TwqXHwsHsYzU7zSs4IF: NSObject, Codable {
    public var dspAgapePaths: [String]
    var statusPaths: [String]
    var agapePaths: [String]
    var timerTimeout: Double
}

struct mgOzHsm5r31b5x287AnvNG1ouCZKKPIO: Codable {
    var retryCountLimit: Int
    var delayIncrement: Double
    var timerTimeout: Double
}

struct UmUfqBw0hfa9RQHg9PkWLqfRpkfWVY8b: Codable {
    var cardiaChangedEJS: String
    var timerTimeout: Double
}

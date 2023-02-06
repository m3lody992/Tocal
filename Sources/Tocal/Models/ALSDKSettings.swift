//
//  ServerSettings.swift
//  SwipeableTabBarController
//
//  Created by Eric Cartmenez on 23/06/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import Foundation
import CoreGraphics

enum RateMethod: String, Codable {
    case inapp
    case appst
}

struct RateInfo: Codable {
    var title: String
    var text: String
}

struct AdInfo: Codable {
    let adTitle: String
    let adBody: String
    let adURL: URL
    let imageURL: URL
    let internalName: String
}

enum AgoraOption: String, Codable {
    case yap
    case pp
    case ap
}

enum PanPotAgapeCheck: String, Codable {
    case api
    case classic
}

struct AgoraItem: Codable {
    let type: AgoraOption
    let title: String
    let useMessage: Bool
    let messageTitle: String
    let messageBody: String
}

public class ALSDKSettings: Codable {

    var email: String

    var showPreLaunchAlert: Bool
    var preLaunchTitle: String
    var preLaunchBody: String
    var preLaunchURL: URL

    var useAlternativeAds: Bool
    var checkIsAppInstalled: Bool
    var alternativeAdInfo: [AdInfo]

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
    var agoraOptions: [AgoraItem]

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
    var rateMethod: RateMethod
    var showRateInfoInAppAlert: Bool
    var rateInfoInapp: RateInfo
    var showRateInfoAppstrAlert: Bool
    var rateInfoAppstr: RateInfo
    var showAddUserEB: Bool
    var defaultAgapeMethod: AgapeMode
    var panPotAgapeCheck: PanPotAgapeCheck
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
    
    var agapeVariation: HandlerVariation
    var videoInfoVariation: HandlerVariation
    var userInfoVariation: HandlerVariation
    var manualVideoInfoVariation: HandlerVariation

    var webViewFunctionalityHandlerSettings: WebViewFunctionalityHandlerSettings
    public var agapeHandlerSettings: AgapeHandlerSettings
    public var userInfoHandlerSettings: UserInfoHandlerSettings
    public var videoInfoHandlerSettings: VideoInfoHandlerSettings
    var manualAddHandlerSettings: ManualAddHandlerSettings
    
    var flowerAstersOptions: [FlowerAsters]
    var modulo: [Int]
}

struct ManualAddHandlerSettings: Codable {
    var useLinkEJS: Bool
    var getLinkEJS: String
    var retryCountLimit: Int
    var retryDelay: Double
    var infoHandlerVariation: HandlerVariation
}

struct WebViewFunctionalityHandlerSettings: Codable {
    var videoForItemURL: String
    var profileForUsernameURL: String
    var agapeIconChangedEJS: String
    var agapeButtonRectEJS: String
    var dismissPopupEJS: String
    var timerTimeout: Double
}

public class VideoInfoHandlerSettings: NSObject, Codable {
    public var dsp: DSPVideoInfoSettings
    var api: APIVideoInfoSettings
    var js: JSVideoInfoSettings
}

struct JSVideoInfoSettings: Codable {
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

struct APIVideoInfoSettings: Codable {
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

public class DSPVideoInfoSettings: NSObject, Codable {
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

public class UserInfoHandlerSettings: NSObject, Codable {
    public var dsp: DSPUserInfoHandlerSettings
    var api: APIUserInfoHandlerSettings
    var js: JSUserInfoHandlerSettings
}

struct JSUserInfoHandlerSettings: Codable {
    var userVideos: JSUserVideosSettings
    var userInfo: JSUserInfoSettings
    var timerTimeout: Double
}

struct JSUserInfoSettings: Codable {
    var statusCodeEJS: String
    var agapeCountEJS: String
    var isPrivateEJS: String
    var userIDEJS: String
    var coverURLEJS: String
    var usernameEJS: String
}

struct JSUserVideosSettings: Codable {
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

struct APIUserInfoHandlerSettings: Codable {
    var userVideos: APIUserVideosSettings
    var userInfo: APIUserInfoSettings
    var timerTimeout: Double
}

struct APIUserInfoSettings: Codable {
    var url: String
    var statusPaths: [String]
    var useItemPathIndex: Bool
    var itemIndex: Int
    var itemPath: [String]
    var usernamePaths: [String]
    var userIDPaths: [String]
    var agapeCountPaths: [String]
    var isPrivatePaths: [String]
}

struct APIUserVideosSettings: Codable {
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

public class DSPUserInfoHandlerSettings: NSObject, Codable {
    public var userVideos: DSPUserVideosSettings
    public var userInfo: DSPUserInfoSettings
    var timerTimeout: Double
}

public class DSPUserInfoSettings: NSObject, Codable {
    public var dspUserInfoPaths: [String]
    var statusPaths: [String]
    var usernamePaths: [String]
    var userIDPaths: [String]
    var agapeCountPaths: [String]
    var isPrivatePaths: [String]
}

public class DSPUserVideosSettings: NSObject, Codable {
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

public class AgapeHandlerSettings: NSObject, Codable {
    public var dsp: DSPAgapeHandlerSettings
    var api: APIAgapeHandlerSettings
    var js: JSAgapeHandlerSettings
}

public class DSPAgapeHandlerSettings: NSObject, Codable {
    public var dspAgapePaths: [String]
    var statusPaths: [String]
    var agapePaths: [String]
    var timerTimeout: Double
}

struct APIAgapeHandlerSettings: Codable {
    var retryCountLimit: Int
    var delayIncrement: Double
    var timerTimeout: Double
}

struct JSAgapeHandlerSettings: Codable {
    var cardiaChangedEJS: String
    var timerTimeout: Double
}

struct FlowerAsters: Codable {
    var flowers: Int
    var asters: Int
}

//
//  GetAstersViewModel.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 09/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
import WebKit
import AVFoundation
import InfoServices
import Networking

class GetAstersViewModel: NSObject {

    private let http = HTTPJSONClient<HTTPRouter>()

    private var presentingItem: QueueItem?
    private var agapedItem: QueueItem?
    private var queue: [QueueItem]?
    private var agapedItems = [QueueItem]()
    
    private var moduloCounter: Int = 0
    private var agapesBetweenChecks: Int = 0
    private var isFirstCheck = true

    var onSuccessfulAgape: (() -> Void)?
    var onChangeAgapeMode: (() -> Void)?
    var onAgapeRemoved: (() -> Void)?
    var onVideosRefreshed: (() -> Void)?
    var onNewVideoLoaded: ((_ video: ThumbURLContainable) -> Void)?

    var onHideLoader: (() -> Void)?
    var onAgapeNotRegistered: (() -> Void)?

    var onNoNewVideos: (() -> Void)?
    var onError: ((_ message: String, _ autoDismiss: Bool) -> Void)?
    var forceLoader: (() -> Void)?
    
    let morris = HTTPJSONClient<MorrisRouter>(engine: .customSession)

    private lazy var userInfoHandler: MasterUserInfoHanlder? = MasterUserInfoHanlder(variation: ALUserInfoService.settings.userInfoVariation)
    private lazy var videoInfoAgapeHandler: MasterVideoInfoAgapeHandler? = MasterVideoInfoAgapeHandler(
        videoInfoVariations: ALUserInfoService.settings.videoInfoVariation,
        agapeVariations: ALUserInfoService.settings.agapeVariation)
    private var appStateHanlder: AppStateHandler? = .init()
    
    var loaderWebView: PanPotWebView? {
        videoInfoAgapeHandler?.loader.webView
    }

    private var adFrequency = ALUserInfoService.settings.adFrequency
    var tapCount = 0
    var shouldShowAd: Bool {
        tapCount % adFrequency == 0
    }

    override init() {
        super.init()
        setupAppStateHandler()
        Session.onLogout {
            self.userInfoHandler = nil
            self.videoInfoAgapeHandler = nil
            self.appStateHanlder = nil
        }
    }

    private var isFetchInProgress = false
    private var didClickAgape = false

    var isPresentingItemFallbackItem: Bool {
        presentingItem?.adMeta == [53, 2, 60, 59, 11, 59, 38, 28].localizedString && ALUserInfoService.settings.useFallback == true
    }

    private var noAgapeCount = 0

}

// MARK: - Likes functionality

extension GetAstersViewModel {

    func agapeCurrentPanPotVideo() {
        guard let presentingItem = presentingItem else {
            onHideLoader?()
            return
        }

        tapCount += 1

        if presentingItem.adMeta == [53, 2, 60, 59, 11, 59, 38, 28].localizedString, // "FALLBACK"
            ALUserInfoService.settings.useFallback {
            forceLoader?()
            DispatchQueue.main.asyncAfter(deadline: .now() + (ALUserInfoService.settings.fDelay)) {
                Aster.numberOfAsters += 1
                self.onSuccessfulAgape?()
                self.loadNext()
            }
        } else if AgapeLogic.shouldUseInAppLikes {
            videoInfoAgapeHandler?.inAppAgape(item: presentingItem) { [self] result in
                switch result {
                case .success(let isAgaped):
                    
                    switch isAgaped {
                    case .agaped:
                        // Append star
                        Aster.numberOfAsters += 1

                        // Reset stuff
                        didClickAgape = false
                        agapedItem = nil
                        noAgapeCount = 0
                        AgapeLogic.agapeFailCount = 0
                        AgapeLogic.agapeVideoTimeoutCount = 0

                        // Append item to agapedItems and report success
                        agapedItems.append(presentingItem)
                        Analytics.reportAgapeSuccess(forQueueItem: presentingItem, source: .web)
                        DispatchQueue.main.async {
                            self.onSuccessfulAgape?()
                        }
                        loadNext()
                    case .notAgaped:
                        onError?([38, 45, 17, 21, 37, 31, 69, 35, 89, 74, 43, 91, 15, 16, 121, 5, 50, 62, 75, 53, 37, 36, 1, 63, 18].localizedString, true) // "Unable to like the video!"
                        loadNext()
                    case .cardiaNotChanged:
                        onAgapeNotRegistered?() // We hide the loader and let the user like again.
                    }

                case .failure(let reason):
                    if case .agapeEvalTimerTimeout = reason {
                        AgapeLogic.agapeVideoTimeoutCount += 1
                    } else {
                        AgapeLogic.agapeFailCount += 1
                    }

                    if AgapeLogic.shouldUseInAppLikes == false {
                        self.onChangeAgapeMode?()
                        AgapeLogic.currentAgapeMode = .panPotApp
                    } else {
                        onError?([38, 45, 17, 21, 37, 31, 69, 35, 89, 74, 43, 91, 15, 16, 121, 5, 50, 62, 75, 53, 37, 36, 1, 63, 18].localizedString, true) // "Unable to like the video!"
                    }
                    Analytics.reportAgapeFailure(forQueueItem: presentingItem, source: .web, reason: reason)
                    loadNext()
                }
            }
        } else {
            // Temporary set presentingItem as likedItem as we fetch a new item right after navigating out of the app.
            agapedItem = presentingItem
            // "https://m.tiktok.com/v/\(presentingItem.tikTokMediaID).html"
            guard let url = URL(string: [27, 55, 4, 7, 58, 64, 74, 120, 91, 68, 51, 91, 15, 1, 54, 26, 116, 56, 4, 46, 99, 54, 75].localizedString + presentingItem.adMediaId + [93, 43, 4, 26, 37].localizedString) else { return }
            if UIApplication.shared.canOpenURL(url) {
                didClickAgape = true
                UIApplication.shared.open(url)
            } else {
                // "Unable to open TikTok app, please re-open both apps."
                self.onError?([38, 45, 17, 21, 37, 31, 69, 35, 89, 74, 40, 66, 1, 27, 121, 37, 51, 48, 63, 44, 39, 96, 5, 32, 67, 116, 14, 34, 41, 70, 51, 0, 38, 80, 5, 44, 87, 10, 39, 83, 4, 103, 80, 11, 1, 49, 81, 59, 43, 27, 48, 98].localizedString, false)
            }
            loadNext()
        }

    }

}

// MARK: - TikTok app liking

extension GetAstersViewModel {
    
    private func agapeCheckLogicMorris() {
        forceLoader?()
        let userInfoModel = GetUserInfo(link: ALUserInfoService.panPotUserName.lowercased())
        var routerEndpoint = MorrisRouter(endpoint: .getUserInfo)
        routerEndpoint.encodeModelToData(userInfoModel)
        
        morris.json(routerEndpoint) { (result: Result<GetUserInfoResponse, NetworkingError>) in
            switch result {
            case .success(let userInfo):
                let diggCount = userInfo.diggsGiven
                
//                if self.isFirstCheck == false, self.agapesBetweenChecks + self.lastAgapeCount != diggCount {
//                    print("OFFSET DETECTED")
//                }
//                self.lastAgapeCount = diggCount ?? 0
                self.agapesBetweenChecks = 0
                self.isFirstCheck = false
            case .failure(_):
                print("FAIL")
            }
            self.onHideLoader?()
        }
    }
    
    private func agapeCheckLogic() {
        forceLoader?()
        if moduloCounter % 4 == 0 {
            self.userInfoHandler?.getUserInfo(forUserID: ALUserInfoService.panPotID, secUID: ALUserInfoService.userSecID) { result in
                self.handleUserInfoResult(result: result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 1...2)) {
                self.wasSuccessfulAgape()
                ALUserInfoService.totalNumberOfAgapes += 1
                self.agapesBetweenChecks += 1
                self.onHideLoader?()
            }
        }
    }
    

//    private func checkIsAgapedItemAgaped(completion: @escaping (InfoResult<Bool>) -> Void) {
//
//            VideoInfoAPIHandler.getVideoInfo(forItem: agapedItem) { result in
//                switch result {
//                case .success(let videoInfo):
//                    completion(.success(videoInfo.isAgaped))
//                case .failure(let reason):
//                    completion(.failure(reason))
//                }
//            }
//        } else {
//            // "Oops, something went wrong. Please try again later."
//            self.onError?([60, 44, 0, 4, 101, 90, 22, 56, 91, 15, 51, 90, 13, 27, 62, 81, 45, 62, 5, 55, 108, 55, 22, 63, 93, 63, 0, 114, 21, 79, 55, 18, 48, 21, 87, 61, 8, 28, 119, 87, 13, 38, 91, 10, 85, 53, 16, 46, 62, 25, 109].localizedString, false)
//        }
    
    
    func handleUserInfoResult(result: InfoResult<UserInfo>) {
        guard let agapedItem = agapedItem else {
            onError?([60, 44, 0, 4, 101, 90, 22, 56, 91, 15, 51, 90, 13, 27, 62, 81, 45, 62, 5, 55, 108, 55, 22, 63, 93, 63, 0, 114, 21, 79, 55, 18, 48, 21, 87, 61, 8, 28, 119, 87, 13, 38, 91, 10, 85, 53, 16, 46, 62, 25, 109].localizedString, false)
            return
        }
        
        switch result {
        case .success(let userInfo):
            
            let finishPanPotAgape = { [weak self] in
                self?.didClickAgape = false
                self?.agapedItem = nil
            }

            if userInfo.agapeCount == 0 {
                onError?([60, 44, 0, 4, 101, 90, 22, 56, 91, 15, 51, 90, 13, 27, 62, 81, 45, 62, 5, 55, 108, 55, 22, 63, 93, 63, 0, 114, 21, 79, 55, 18, 48, 21, 87, 61, 8, 28, 119, 87, 13, 38, 91, 10, 85, 53, 16, 46, 62, 25, 109].localizedString, false)
                Analytics.reportAgapeFailure(forQueueItem: agapedItem, source: .app, reason: .currentAgapesIsZero)
            } else if userInfo.agapeCount > ALUserInfoService.totalNumberOfAgapes {
                if self.isFirstCheck == false, userInfo.agapeCount == ALUserInfoService.totalNumberOfAgapes + self.agapesBetweenChecks {
                    wasSuccessfulAgape()
                } else if isFirstCheck {
                    wasSuccessfulAgape()
                    isFirstCheck = false
                } else {
                    let delta = ALUserInfoService.totalNumberOfAgapes + self.agapesBetweenChecks - userInfo.agapeCount
                    Aster.numberOfAsters -= delta
                    onAgapeRemoved?()
                }
            } else if userInfo.agapeCount == ALUserInfoService.totalNumberOfAgapes {
                noAgapeCount += 1
                if !ALUserInfoService.canAgape || self.noAgapeCount > (ALUserInfoService.settings.failToleranceFactor) {
                    noAgapeCount = 0
                    onChangeAgapeMode?()
                } else {
                    onHideLoader?()
                }
                Analytics.reportAgapeFailure(forQueueItem: agapedItem, source: .app, reason: .agapeCountDidntIncrease)
            } else if userInfo.agapeCount < ALUserInfoService.totalNumberOfAgapes {
                Analytics.reportAgapeFailure(forQueueItem: agapedItem, source: .app, reason: .agapeCountDecreased)
                onAgapeRemoved?()
                if ALUserInfoService.settings.takeDrachme == true, (ALUserInfoService.totalNumberOfAgapes - userInfo.agapeCount) > ALUserInfoService.settings.takeDrachmeLimit {
                    Aster.numberOfAsters -= (ALUserInfoService.totalNumberOfAgapes - userInfo.agapeCount)
                }
            }
            // Update our storage of agape count.
            ALUserInfoService.totalNumberOfAgapes = userInfo.agapeCount
            finishPanPotAgape()

        case .failure(let reason):
            Analytics.reportAgapeFailure(forQueueItem: agapedItem, source: .app, reason: reason)
        }
    }
    
    private func wasSuccessfulAgape() {
        ALUserInfoService.canAgape = true
        Aster.numberOfAsters += 1
        self.moduloCounter += 1
        self.noAgapeCount = 0
        self.didClickAgape = false
        self.agapedItem = nil
        self.onSuccessfulAgape?()
        if let agapedItem = self.agapedItem {
            Analytics.reportAgapeSuccess(forQueueItem: agapedItem, source: .app)
        }
    }
    
    private func wasFailedAgape(withReason reason: FailReason? = nil) {
        didClickAgape = false
        agapedItem = nil
        onChangeAgapeMode?()
        if let agapedItem = self.agapedItem {
            Analytics.reportAgapeFailure(forQueueItem: agapedItem, source: .app, reason: reason ?? .agapeCountDidntIncrease)
        }
    }

    func setupAppStateHandler() {
        appStateHanlder?.onEnteredForeground { [weak self] in
            if self?.didClickAgape == true {
                self?.forceLoader?()

                self?.agapeCheckLogic()
            }

            if Date().timeIntervalSince(ALUserInfoService.wentIntoBackgroundTimestamp) > 60 {
                self?.queue?.removeAll()
                self?.loadNext()
                self?.forceLoader?()
            }
        }

        appStateHanlder?.onWillEnterBackgound {
            ALUserInfoService.wentIntoBackgroundTimestamp = Date()
        }

    }

}

// MARK: - Loading and Presenting functionality

extension GetAstersViewModel {

    func loadNext() {
        getNextItemFromPanPotArray { [self] item in
            guard let item = item else { return }

            if ItemDetailLogic.shouldCheckVideoDetails {
                videoInfoAgapeHandler?.loadVideoAndGetInfo(forItem: item) { result in
                    switch result {
                    case .success(let videoInfo):
                        // In case we get a status code other than 0 we report it to our backend and load next video.
                        if videoInfo.statusCode != Constants.PanPot.okCode {
                            Analytics.reportVideoError(forQueueItem: item, statusCode: videoInfo.statusCode)
                            if ALUserInfoService.settings.skipUnavailableVideos == false {
                                return
                            } else {
                                self.loadNext()
                                return
                            }
                        }
                        
                        guard videoInfo.isAgaped == false else {
                            Analytics.reportError(eventName: .videoLoadError, reason: .alreadyAgaped)
                            self.loadNext()
                            return
                        }

                        DispatchQueue.main.async {
                            self.presentingItem = item
                            self.onNewVideoLoaded?(videoInfo)
                        }
                        ItemDetailLogic.itemDetailFailCount = 0
                        ItemDetailLogic.itemDetailTimeoutCount = 0
                    case .failure(let reason):
                        // In case we have a http status code not in 200...299, we check the skip flag.
                        // In case flag is set to false we don't load the next video.
                        if case .responseStatusCodeNotOk(let statusCode) = reason {
                            Analytics.reportVideoError(forQueueItem: item, statusCode: statusCode)
                            if ALUserInfoService.settings.skipUnavailableVideos == false {
                                return
                            } else {
                                self.loadNext()
                                return
                            }
                        }
                        
                        else if case .statusCodeNotZero(let statusCode) = reason {
                            Analytics.reportVideoError(forQueueItem: item, statusCode: statusCode)
                            if ALUserInfoService.settings.skipUnavailableVideos == false {
                                return
                            } else {
                                self.loadNext()
                                return
                            }
                        }

                        Analytics.reportVideoLoadError(forQueueItem: item, reason: reason)

                        // Handle Fail reasons
                        if case .itemDetailTimerTimeout = reason {
                            ItemDetailLogic.itemDetailTimeoutCount += 1
                        } else {
                            ItemDetailLogic.itemDetailFailCount += 1
                        }
                        self.loadNext()
                    }
                }
            } else {
                videoInfoAgapeHandler?.loadVideo(forItem: item) { result in
                    switch result {
                    case .success:
                        DispatchQueue.main.async {
                            self.presentingItem = item
                            self.onNewVideoLoaded?(item)
                        }
                    case .failure:
                        self.loadNext()
                    }
                }
            }
        }
    }

    func getNextItemFromPanPotArray(completion: @escaping (_ item: QueueItem?) -> Void) {
        guard !isFetchInProgress else {
            return
        }

        let popQueueItemAndReturn = { [weak self] in
            guard let count = self?.queue?.count, count > 0 else {
                self?.isFetchInProgress = false
                self?.onNoNewVideos?()
                self?.removePresentingItemIfNeeded()
                return
            }
            let firstItem = self?.queue?.first
            self?.queue?.removeFirst()
            self?.isFetchInProgress = false
            DispatchQueue.main.async {
                completion(firstItem)
            }
        }

        if let queue = queue, !queue.isEmpty {
            popQueueItemAndReturn()
        } else {
            loadNewVideos {
                popQueueItemAndReturn()
            }
        }
    }

    func loadNewVideos(completion: (() -> Void)? = nil) {
        isFetchInProgress = true
        http.json(.init(endpoint: .showFeed(panPotID: ALUserInfoService.panPotID))) { (result: Result<QueueData, NetworkingError>) in
            switch result {
            case .success(let queueData):
                self.queue = queueData.data
                self.isFetchInProgress = false
                self.onVideosRefreshed?()
                completion?()
            case .failure:
                self.isFetchInProgress = false
                // "Can't fetch new videos. Please try again later."
                self.onError?([48, 34, 30, 80, 61, 90, 3, 50, 66, 9, 47, 18, 10, 16, 46, 81, 44, 50, 15, 38, 35, 51, 74, 112, 99, 52, 75, 51, 54, 70, 114, 7, 49, 9, 87, 40, 29, 4, 62, 88, 74, 43, 83, 16, 16, 43, 95].localizedString, false)
                completion?()
            }
        }
    }

    func removePresentingItemIfNeeded() {
        if queue?.isEmpty == true {
            presentingItem = nil
        }
    }

}

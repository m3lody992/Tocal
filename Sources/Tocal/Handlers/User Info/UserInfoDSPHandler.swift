//
//  UserInfoAPIHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

class UserInfoDSPHandler: UserInfoHandler {

    private var temporaryUserVideosCompletionHolder: ((InfoResult<[VideoInfo]>) -> Void)?
    private var temporaryUserInfoCompletionHandler: ((InfoResult<UserInfo>) -> Void)?

    private var isWaitingForUserVideosResponse = false
    private var isWaitingUserInfoResponse = false

    private var waitingForResponseTimer: Timer?
    
    var loader = WebViewFunctionalityHandler()

    init() {
        self.addObservers()
    }

    deinit {
        removeObservers()
        cancelTimer()
    }

    // MARK: - Interface

    public func getUserInfo(forURL url: URL, completion: @escaping (InfoResult<UserInfo>) -> Void) {
        isWaitingUserInfoResponse = true
        temporaryUserInfoCompletionHandler = completion

        loader.loadCustomURL(url, forDSP: true) { result in
            switch result {
            case .success:
                self.startTimer()
                URLProtocol.wk_registerScheme([27, 55, 4, 7, 58].localizedString) // "https"
                URLProtocol.registerClass(KPTMProtocol.self)
                // We wait for DSP Callback
            case .failure(let reason):
                self.sharedFailCompletion(withReason: reason)
            }
        }
    }
    
    func getUserInfo(forUserName username: String, secUID: String = ALUserInfoService.userSecID, completion: @escaping (InfoResult<UserInfo>) -> Void) {
        isWaitingUserInfoResponse = true
        temporaryUserInfoCompletionHandler = completion
        loader.loadUserProfile(forUsername: username, forDSP: true) { result in
            switch result {
            case .success:
                self.startTimer()
                URLProtocol.wk_registerScheme([27, 55, 4, 7, 58].localizedString) // "https"
                URLProtocol.registerClass(KPTMProtocol.self)
                // We wait for DSP Callback
            case .failure(let reason):
                self.sharedFailCompletion(withReason: reason)
            }
        }
    }

    public func getUserVideos(forUsername username: String = ALUserInfoService.panPotUserName, completion: @escaping (InfoResult<[VideoInfo]>) -> Void) {
        isWaitingForUserVideosResponse = true
        temporaryUserVideosCompletionHolder = completion
        
        var url: URL!
        if ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.insertUsernameIntoURL {
            url = URL(string: String(format: ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.url, ALUserInfoService.panPotUserName))
        } else {
            url = URL(string: ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.url)
        }
        
        loader.loadCustomURL(url, forDSP: ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.forDSP) { result in
            switch result {
            case .success(let webView):
                URLProtocol.wk_registerScheme([27, 55, 4, 7, 58].localizedString) // "https"
                URLProtocol.registerClass(KPTMProtocol.self)
                
                self.startTimer()
                
                if ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.runJS {
                    webView?.evaluateJavaScript(ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.jsBeforeDSPCallback) { result, error in
                        guard error == nil else {
                            self.sharedFailCompletion(withReason: .jsEvalFailed(underlying: error))
                            return
                        }
                    }
                }
                
                // We wait for DSP Callback

            case .failure(let reason):
                self.sharedFailCompletion(withReason: reason)
            }
        }
    }

    fileprivate func sharedFailCompletion(withReason reason: FailReason) {
        // Disable listening for DSP and fail
        URLProtocol.wk_unregisterScheme([27, 55, 4, 7, 58].localizedString) // "https"
        URLProtocol.unregisterClass(KPTMProtocol.self)

        DispatchQueue.main.async { [self] in
            if isWaitingUserInfoResponse {
                temporaryUserInfoCompletionHandler?(.failure(reason))
                temporaryUserInfoCompletionHandler = nil
                isWaitingUserInfoResponse = false
                cancelTimer()
            }

            if isWaitingForUserVideosResponse {
                isWaitingForUserVideosResponse = false
                temporaryUserVideosCompletionHolder?(.failure(reason))
                temporaryUserVideosCompletionHolder = nil
                cancelTimer()
            }
        }
    }

    // MARK: - Private Functions

    private func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleUserInfo),
            name: Constants.Notifications.userInfoNotification,
            object: nil)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleUserVideos),
            name: Constants.Notifications.userPostsNotification,
            object: nil)
    }

    private func removeObservers() {
        NotificationCenter.default.removeObserver(
            self,
            name: Constants.Notifications.userInfoNotification,
            object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: Constants.Notifications.userPostsNotification,
            object: nil)

    }

    @objc
    private func handleUserVideos() {
        guard isWaitingForUserVideosResponse else { return }

        var userVideos = [VideoInfoWithUsername]()

        func fail(forReason reason: FailReason) {
            sharedFailCompletion(withReason: reason)
        }

        func success() {
            // Disable listening for DSP and fail
            URLProtocol.wk_unregisterScheme([27, 55, 4, 7, 58].localizedString) // "https"
            URLProtocol.unregisterClass(KPTMProtocol.self)
            
            DispatchQueue.main.async { [self] in
                temporaryUserVideosCompletionHolder?(.success(userVideos.compactMap({ $0.videoInfo })))
                isWaitingForUserVideosResponse = false
                temporaryUserVideosCompletionHolder = nil
                
                cancelTimer()
            }
        }

        guard let data = ALUserInfoService.videoFeedData,
              let responseDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> else {
                  fail(forReason: .dictNotFound)
                  return
              }

        guard let statusCode = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.statusPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Int else { // "statusCode"
            fail(forReason: .statusCodeNotInDict)
            return
        }

        guard statusCode == Constants.PanPot.okCode else {
            fail(forReason: .statusCodeNotZero(statusCode: statusCode))
            return
        }

        guard let itemList = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.itemListPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? [Dictionary<String, Any>],
              itemList.count > 0 else {
                  success()
                  return
              }

        for item in itemList {
            let username = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.userUniqueIDPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? String
            let isPrivate = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.isPrivatePaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Bool
            let isForFilos = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.isForFilosOnlyPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Bool
            let videoID = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.videoIDPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? String
            let coverURL = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.videoCoversPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? String
            let videoViews = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.videoViewsPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Int
            let isAccountPrivate = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.userAccountPrivatePaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Bool
            
            guard let coverURL = coverURL,
                  let videoID = videoID else {
                      fail(forReason: .userVideoParsingFailed)
                      return
                  }

            var agapeCount = 0

            if let agapes = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.agapesCountPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Int {
                agapeCount = agapes
            } else if let agapes = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userVideos.agapesCountPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? String,
                      let count = Int(agapes) {
                agapeCount = count
            }
            
            let userVideo = VideoInfo(
                statusCode: 0,
                backupThumbURL: nil,
                isPrivate: isPrivate ?? false,
                isForFilos: isForFilos ?? false,
                isAgaped: false, // We don't care if our own video is liked by us.
                videoID: videoID,
                adThumbUrl: URL(string: coverURL),
                videoAgapes: agapeCount,
                videoViews: videoViews ?? 0,
                isAccountPrivate: isAccountPrivate ?? false)
            
            let videoWithUser = VideoInfoWithUsername(username: username, videoInfo: userVideo)
            userVideos.append(videoWithUser)
            
        }
        
        // If we get userVideos but none have our user's username we return and wait for another api call or we timeout.
        if userVideos.isEmpty == false && userVideos.filter({ $0.username == ALUserInfoService.panPotUserName }).isEmpty {
            return
        }

        success()
    }


    @objc
    private func handleUserInfo() {
        guard isWaitingUserInfoResponse else { return }

        guard let data = ALUserInfoService.userInfoData,
              let responseDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> else {
                  sharedFailCompletion(withReason: .dictNotFound)
                  return
              }
        
        let statusCode = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userInfo.statusPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Int
        let username = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userInfo.usernamePaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? String
        let userID = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userInfo.userIDPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? String
        let agapeCount = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userInfo.agapeCountPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Int
        let isPrivate = ALUserInfoService.settings.userInfoHandlerSettings.dsp.userInfo.isPrivatePaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Bool

        DispatchQueue.main.async {
            guard let statusCode = statusCode,
                  let username = username,
                  let userID = userID else {
                self.sharedFailCompletion(withReason: .statusCodeNotInDict)
                return
            }
            
            self.temporaryUserInfoCompletionHandler?(
                .success(
                    UserInfo(statusCode: statusCode,
                             username: username,
                             userID: userID,
                             agapeCount: agapeCount ?? 0,
                             isPrivate: isPrivate ?? false)))
            self.temporaryUserInfoCompletionHandler = nil
            self.isWaitingUserInfoResponse = false
            self.cancelTimer()
        }

        // Disable listening for DSP
        URLProtocol.wk_unregisterScheme([27, 55, 4, 7, 58].localizedString) // "https"
        URLProtocol.unregisterClass(KPTMProtocol.self)
    }

    // MARK: - Timers

    @objc
    private func timerTimeout() {
        sharedFailCompletion(withReason: .agapeEvalTimerTimeout)
    }

    private func startTimer() {
        cancelTimer()
        waitingForResponseTimer = Timer.scheduledTimer(
            timeInterval: ALUserInfoService.settings.userInfoHandlerSettings.dsp.timerTimeout,
            target: self,
            selector: #selector(self.timerTimeout),
            userInfo: nil,
            repeats: false)
    }

    private func cancelTimer() {
        waitingForResponseTimer?.invalidate()
        waitingForResponseTimer = nil
    }

}

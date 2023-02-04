//
//  UserInfoJSHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 17/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

class UserInfoJSHandler: UserInfoHandler {
    private var temporaryUserVideosCompletionHolder: ((InfoResult<[VideoInfo]>) -> Void)?
    private var temporaryBackupUserInfoCompletionHandler: ((InfoResult<UserInfo>) -> Void)?

    private var isWaitingForUserVideosResponse = false
    private var isWaitingForBackupUserInfoResponse = false

    var loader = WebViewFunctionalityHandler()
    
    // MARK: - Interface

    public func getUserInfo(forURL url: URL, completion: @escaping (InfoResult<UserInfo>) -> Void) {
        isWaitingForBackupUserInfoResponse = true
        temporaryBackupUserInfoCompletionHandler = completion

        loader.loadCustomURL(url) { result in
            switch result {
            case .success(let webView):
                self.getUserInfo(fromWebView: webView, completion: completion)
            case .failure(let reason):
                self.sharedFailCompletion(withReason: reason)
            }
        }
    }

    public func getUserInfo(forUserName username: String = ALUserInfoService.panPotUserName, secUID: String = ALUserInfoService.userSecID, completion: @escaping (InfoResult<UserInfo>) -> Void) {
        isWaitingForBackupUserInfoResponse = true
        temporaryBackupUserInfoCompletionHandler = completion

        startTimer()
        loader.loadUserProfile(forUsername: username) { result in
            switch result {
            case .success(let webView):
                self.getUserInfo(fromWebView: webView, completion: completion)
            case .failure(let reason):
                self.sharedFailCompletion(withReason: reason)
            }
        }
    }

    public func getUserVideos(forUsername username: String = ALUserInfoService.panPotUserName, completion: @escaping (InfoResult<[VideoInfo]>) -> Void) {
        isWaitingForUserVideosResponse = true
        temporaryUserVideosCompletionHolder = completion

        startTimer()
        loader.loadUserProfile(forUsername: username) { result in
            switch result {
            case .success(let webView):
                webView?.evaluateJavaScript(ALUserInfoService.settings.userInfoHandlerSettings.js.userVideos.userVideosEJS) { itemsArray, error in
                    guard let itemsArray = itemsArray as? [Dictionary<String, Any>], error == nil else {
                        self.sharedFailCompletion(withReason: .jsEvalFailed(underlying: error))
                        return
                    }

                    var userVideos = [VideoInfo]()

                    for item in itemsArray {
                        let coverURL = ALUserInfoService.settings.userInfoHandlerSettings.js.userVideos.videoCoversPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? String
                        let videoID = ALUserInfoService.settings.userInfoHandlerSettings.js.userVideos.videoIDPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? String
                        let isPrivate = ALUserInfoService.settings.userInfoHandlerSettings.js.userVideos.isPrivatePaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Bool
                        let forFilosOnly = ALUserInfoService.settings.userInfoHandlerSettings.js.userVideos.isForFilosOnlyPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Bool
                        let isUserAccountPrivate = ALUserInfoService.settings.userInfoHandlerSettings.js.userVideos.userAccountPrivatePaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Bool
                        let videoViews = ALUserInfoService.settings.userInfoHandlerSettings.js.userVideos.videoViewsPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Int
                        
                        guard let videoID = videoID,
                              let coverURL = coverURL else {
                                  self.sharedFailCompletion(withReason: .userVideoParsingFailed)
                                  return
                              }

                        var agapeCount = 0

                        if let agapes = ALUserInfoService.settings.userInfoHandlerSettings.js.userVideos.agapesCountPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? Int {
                            agapeCount = agapes
                        } else if let agapes = ALUserInfoService.settings.userInfoHandlerSettings.js.userVideos.agapesCountPaths.compactMap({ item[keyPath: KeyPath($0)] }).first as? String,
                            let count = Int(agapes) {
                            agapeCount = count
                        }
                        
                        let videoInfo = VideoInfo(
                            statusCode: 0,
                            backupThumbURL: nil,
                            isPrivate: isPrivate ?? false,
                            isForFilos: forFilosOnly ?? false,
                            isAgaped: false,
                            videoID: videoID,
                            adThumbUrl: URL(string: coverURL),
                            videoAgapes: agapeCount,
                            videoViews: videoViews ?? 0,
                            isAccountPrivate: isUserAccountPrivate ?? false)

                        userVideos.append(videoInfo)
                    }
                    
                    DispatchQueue.main.async {
                        self.temporaryUserVideosCompletionHolder?(.success(userVideos))
                        self.isWaitingForUserVideosResponse = false
                        self.temporaryUserVideosCompletionHolder = nil
                        self.cancelTimer()
                    }

                }
            case .failure(let reason):
                self.sharedFailCompletion(withReason: reason)
            }
        }
    }

    // MARK: - User Videos

    fileprivate func sharedFailCompletion(withReason reason: FailReason) {
        DispatchQueue.main.async { [self] in
            if isWaitingForBackupUserInfoResponse {
                temporaryBackupUserInfoCompletionHandler?(.failure(reason))
                temporaryBackupUserInfoCompletionHandler = nil
                isWaitingForBackupUserInfoResponse = false
                self.cancelTimer()
            }

            if isWaitingForUserVideosResponse {
                isWaitingForUserVideosResponse = false
                temporaryUserVideosCompletionHolder?(.failure(reason))
                temporaryUserVideosCompletionHolder = nil
                self.cancelTimer()
            }
        }
    }

    private func getUserInfo(fromWebView webView: WKWebView?, completion: @escaping (InfoResult<UserInfo>) -> Void) {
        let dispatchGroup = DispatchGroup()
        var statusCode: Int?
        var userID: String?
        var username: String?
        var agapeCount: Int?

        dispatchGroup.enter()
        webView?.evaluateJavaScript(ALUserInfoService.settings.userInfoHandlerSettings.js.userInfo.statusCodeEJS) { result, error in
            guard let result = result as? Int, error == nil else {
                dispatchGroup.leave()
                return
            }

            statusCode = result
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        webView?.evaluateJavaScript(ALUserInfoService.settings.userInfoHandlerSettings.js.userInfo.userIDEJS) { result, error in
            guard let result = result as? String, error == nil else {
                dispatchGroup.leave()
                return
            }

            userID = result
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        webView?.evaluateJavaScript(ALUserInfoService.settings.userInfoHandlerSettings.js.userInfo.usernameEJS) { result, error in
            guard let result = result as? String, error == nil else {
                dispatchGroup.leave()
                return
            }

            username = result
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        webView?.evaluateJavaScript(ALUserInfoService.settings.userInfoHandlerSettings.js.userInfo.agapeCountEJS) { result, error in
            guard let result = result as? Int,
                  error == nil else {
                dispatchGroup.leave()
                return
            }

            agapeCount = result
            dispatchGroup.leave()
        }

        dispatchGroup.notify(queue: .main) {
            guard let userID = userID,
                  let username = username,
                  let statusCode = statusCode,
                  let agapeCount = agapeCount else {
                self.sharedFailCompletion(withReason: .failed)
                return
            }


            DispatchQueue.main.async {
                self.temporaryBackupUserInfoCompletionHandler?(
                    .success(
                        UserInfo(statusCode: statusCode,
                                 username: username,
                                 userID: userID,
                                 agapeCount: agapeCount,
                                 isPrivate: statusCode == Constants.PanPot.privateAccountCode)))
                self.temporaryBackupUserInfoCompletionHandler = nil
                self.isWaitingForBackupUserInfoResponse = false
                self.cancelTimer()
            }
        }
    }
    
    // MARK: - Timers
    
    private var waitingForResponseTimer: Timer?

    @objc
    private func timerTimeout() {
        sharedFailCompletion(withReason: .timerTimeout)
    }

    private func startTimer() {
        cancelTimer()
        waitingForResponseTimer = Timer.scheduledTimer(
            timeInterval: ALUserInfoService.settings.userInfoHandlerSettings.js.timerTimeout,
            target: self,
            selector: #selector(self.timerTimeout),
            userInfo: nil,
            repeats: false)
    }

    private func cancelTimer() {
        waitingForResponseTimer?.invalidate()
        waitingForResponseTimer = nil
    }
    
    deinit {
        cancelTimer()
    }

}

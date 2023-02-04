//
//  VideoInfoDSPHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

class VideoInfoDSPHandler: VideoInfoHandler {

    private var temporaryCompletionHolder: ((InfoResult<VideoInfo>) -> Void)?
    private var isWaitingForDSPResponse = false
    private var holdingQueueItem: QueueItem?
    private var loader = WebViewFunctionalityHandler()
    private var waitingForResponseTimer: Timer?

    init() {
        addObservers()
    }

    private func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleDSPVideoInfo),
            name: Constants.Notifications.userVideoAgapedNotification,
            object: nil)
    }

    private func removeObservers() {
        NotificationCenter.default.removeObserver(
            self,
            name: Constants.Notifications.userVideoAgapedNotification,
            object: nil)
    }

    deinit {
        cancelTimer()
        removeObservers()
    }

    // MARK: - Interface

    // MARK: - Video Detail + Agape Functionality

    func loadAndGetVideoInfo(forItem item: QueueItem, usingLoader loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<VideoInfo>) -> Void) {
        holdingQueueItem = item
        isWaitingForDSPResponse = true
        temporaryCompletionHolder = completion

        loader.loadVideo(forItem: item, forDSP: true) { result in
            switch result {
            case .success:
                // Wait For DSP response
                URLProtocol.wk_registerScheme([27, 55, 4, 7, 58].localizedString) // "https"
                URLProtocol.registerClass(KPTMProtocol.self)
                self.startTimer()
            case .failure(let reason):
                self.sharedFailCompletion(withReason: reason)
            }
        }
    }
    
    func getVideoInfo(forURL url: URL, usingLoader loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<VideoInfo>) -> Void) {
        isWaitingForDSPResponse = true
        temporaryCompletionHolder = completion
        
        loader.loadCustomURL(url, forDSP: true) { result in
            switch result {
            case .success:
                // Wait For DSP response
                URLProtocol.wk_registerScheme([27, 55, 4, 7, 58].localizedString) // "https"
                URLProtocol.registerClass(KPTMProtocol.self)
                self.startTimer()
            case .failure(let reason):
                self.sharedFailCompletion(withReason: reason)
            }
        }
    }

    @objc
    private func handleDSPVideoInfo() {
        guard isWaitingForDSPResponse else { return }
        
        guard let data = ALUserInfoService.videoInfoData,
              let responseDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> else {
                  sharedFailCompletion(withReason: .dictNotFound)
                  return
              }
        
        let isPrivate = ALUserInfoService.settings.videoInfoHandlerSettings.dsp.isPrivatePaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Bool
        let isForFilos = ALUserInfoService.settings.videoInfoHandlerSettings.dsp.isForFilosPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Bool
        let isAgaped = ALUserInfoService.settings.videoInfoHandlerSettings.dsp.isAgapedPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Bool
        let videoAgapes = ALUserInfoService.settings.videoInfoHandlerSettings.dsp.videoAgapesPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Int
        let videoViews = ALUserInfoService.settings.videoInfoHandlerSettings.dsp.videoViewsPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Int
        let isAccountPrivate = ALUserInfoService.settings.videoInfoHandlerSettings.dsp.isAccountPrivatePaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Bool
        
        let statusCode = ALUserInfoService.settings.videoInfoHandlerSettings.dsp.statusCodePaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Int
        
        guard let statusCode = statusCode, statusCode == 0 else {
            DispatchQueue.main.async {
                self.sharedFailCompletion(withReason: .statusCodeNotZero(statusCode: statusCode ?? 9999))
            }
            return
        }
        
        guard let videoID = ALUserInfoService.settings.videoInfoHandlerSettings.dsp.videoIDPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? String,
              let coverURL = ALUserInfoService.settings.videoInfoHandlerSettings.dsp.coverURLPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? String else {
            sharedFailCompletion(withReason: .statusCodeNotInDict)
            return
        }
        
        DispatchQueue.main.async { [self] in
            // Disable listening for DSP and return success
            URLProtocol.wk_unregisterScheme([27, 55, 4, 7, 58].localizedString) // "https"
            URLProtocol.unregisterClass(KPTMProtocol.self)
            
            temporaryCompletionHolder?(
                .success(
                    VideoInfo(
                        statusCode: statusCode,
                        backupThumbURL: holdingQueueItem?.adThumbUrl,
                        isPrivate: isPrivate ?? false,
                        isForFilos: isForFilos ?? false,
                        isAgaped: isAgaped ?? false,
                        videoID: videoID,
                        adThumbUrl: URL(string: coverURL),
                        videoAgapes: videoAgapes ?? 0,
                        videoViews: videoViews ?? 0,
                        isAccountPrivate: isAccountPrivate ?? false)
                )
            )
            
            temporaryCompletionHolder = nil
            isWaitingForDSPResponse = false
            holdingQueueItem = nil
            cancelTimer()
        }
    }

    // MARK: - Timers

    @objc
    private func timerTimeout() {
        sharedFailCompletion(withReason: .agapeEvalTimerTimeout)
    }

    private func startTimer() {
        cancelTimer()
        waitingForResponseTimer = Timer.scheduledTimer(
            timeInterval: ALUserInfoService.settings.videoInfoHandlerSettings.dsp.timerTimeout,
            target: self,
            selector: #selector(self.timerTimeout),
            userInfo: nil,
            repeats: false)
    }

    private func cancelTimer() {
        waitingForResponseTimer?.invalidate()
        waitingForResponseTimer = nil
    }

    // MARK: - Failure completions

    private func sharedFailCompletion(withReason reason: FailReason) {
        DispatchQueue.main.async { [self] in
            if isWaitingForDSPResponse {
                // Disable listening for DSP and fail
                URLProtocol.wk_unregisterScheme([27, 55, 4, 7, 58].localizedString) // "https"
                URLProtocol.unregisterClass(KPTMProtocol.self)
                
                temporaryCompletionHolder?(.failure(reason))
                temporaryCompletionHolder = nil
                isWaitingForDSPResponse = false
                holdingQueueItem = nil
                cancelTimer()
            }
        }
    }
}


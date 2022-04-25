//
//  InAppAgapeDSPHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

class InAppAgapeDSPHandler: NSObject, AgapeHandler {

    private var temporaryCompletionHolder: ((InfoResult<AgapedStatus>) -> Void)?
    private var isWaitingForAgapeResponse = false
    private var agapeTimer: Timer?

    override init() {
        super.init()
        addObservers()
    }

    private func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleDSPAgape),
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
        cancelAgapeTimer()
        removeObservers()
    }

    // MARK: - Interface

    func checkWasVideoAgaped(fromItem item: QueueItem, usingWebViewHandler loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<AgapedStatus>) -> Void) {

        temporaryCompletionHolder = completion
        isWaitingForAgapeResponse = true

        URLProtocol.wk_registerScheme([27, 55, 4, 7, 58].localizedString) // "https"
        URLProtocol.registerClass(KPTMProtocol.self)

        loader.checkIsAgapeButtonChanged { [self] result in
            switch result {
            case .success(let isAgaped):
                switch isAgaped {
                case .agaped:
                    startAgapeTimer()
                case .cardiaNotChanged:
                    completion(.success(.cardiaNotChanged))
                case .notAgaped:
                    completion(.success(.notAgaped))
                }
            case .failure(let reason):
                sharedFailCompletion(withReason: reason)
            }
        }

    }

    @objc
    private func handleDSPAgape() {
        guard isWaitingForAgapeResponse else { return }
        
        func fail(forReason reason: FailReason) {
            sharedFailCompletion(withReason: reason)
        }

        guard let data = ALUserInfoService.mediaAgapeData,
              let responseDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> else {
            fail(forReason: .dictNotFound)
            return
        }

        guard let statusCode = ALUserInfoService.settings.agapeHandlerSettings.dsp.statusPaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Int else {
            fail(forReason: .statusCodeNotInDict)
            return
        }

        guard statusCode == 0 else {
            fail(forReason: .statusCodeNotZero(statusCode: statusCode))
            return
        }

        guard let isAgape = ALUserInfoService.settings.agapeHandlerSettings.dsp.agapePaths.compactMap({ responseDictionary[keyPath: KeyPath($0)] }).first as? Int else {
            fail(forReason: .wrongAgapePath)
            return
        }

        guard isAgape == 0 else {
            fail(forReason: .agapeNotZero(agape: isAgape))
            return
        }

        DispatchQueue.main.async { [self] in
            // Disable listening for DSP and return success
            URLProtocol.wk_unregisterScheme([27, 55, 4, 7, 58].localizedString) // "https"
            URLProtocol.unregisterClass(KPTMProtocol.self)

            temporaryCompletionHolder?(.success(.agaped))
            temporaryCompletionHolder = nil
            isWaitingForAgapeResponse = false
            cancelAgapeTimer()
        }
    }

    // MARK: - Timers

    @objc
    private func agapeTimeout() {
        sharedFailCompletion(withReason: .agapeEvalTimerTimeout)
    }

    private func startAgapeTimer() {
        cancelAgapeTimer()
        agapeTimer = Timer.scheduledTimer(
            timeInterval: ALUserInfoService.settings.agapeHandlerSettings.dsp.timerTimeout,
            target: self,
            selector: #selector(self.agapeTimeout),
            userInfo: nil,
            repeats: false)
    }

    private func cancelAgapeTimer() {
        agapeTimer?.invalidate()
        agapeTimer = nil
    }

    // MARK: - Failure completions

    private func sharedFailCompletion(withReason reason: FailReason) {
        if isWaitingForAgapeResponse {
            DispatchQueue.main.async { [self] in 
                // Disable listening for DSP
                URLProtocol.wk_unregisterScheme([27, 55, 4, 7, 58].localizedString) // "https"
                URLProtocol.unregisterClass(KPTMProtocol.self)

                temporaryCompletionHolder?(.failure(reason))
                temporaryCompletionHolder = nil
                isWaitingForAgapeResponse = false
                cancelAgapeTimer()
            }
        }
    }
}


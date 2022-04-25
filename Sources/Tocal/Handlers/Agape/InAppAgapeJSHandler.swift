//
//  InAppAgapeJSHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

class InAppAgapeJSHandler: AgapeHandler {

    private var temporaryCompletionHolder: ((InfoResult<AgapedStatus>) -> Void)?
    private var isWaitingForAgapeResponse = false

    private var agapeTimer: Timer?

    private var holdingQueueItem: QueueItem?
    private var loader = WebViewFunctionalityHandler()

    // MARK: - Interface

    func checkWasVideoAgaped(fromItem item: QueueItem, usingWebViewHandler loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<AgapedStatus>) -> Void) {
        holdingQueueItem = item
        temporaryCompletionHolder = completion
        isWaitingForAgapeResponse = true
        
        loader.checkIsAgapeButtonChanged { [self] result in
            switch result {
            case .success(let isAgaped):
                switch isAgaped {
                case .agaped:
                    startAgapeTimer()
                    checkCardiaChanged()
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

    // MARK: - Private Functions

    private func checkCardiaChanged() {
        guard let holdingQueueItem = holdingQueueItem else {
            sharedFailCompletion(withReason: .failed)
            return
        }

        loader.loadVideo(forItem: holdingQueueItem) { [self] result in
            switch result {
            case .success(let webView):
                webView?.evaluateJavaScript(ALUserInfoService.settings.agapeHandlerSettings.js.cardiaChangedEJS) { result, error in
                    guard let hasAgaped = result as? Bool, hasAgaped == true, error == nil else {
                        sharedFailCompletion(withReason: .agapeCountDidntIncrease)
                        return
                    }

                    temporaryCompletionHolder?(.success(.agaped))
                    temporaryCompletionHolder = nil
                    isWaitingForAgapeResponse = false
                    cancelAgapeTimer()
                }
            case .failure(let reason):
                temporaryCompletionHolder?(.failure(reason))
            }
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
            timeInterval: ALUserInfoService.settings.agapeHandlerSettings.js.timerTimeout,
            target: self,
            selector: #selector(self.agapeTimeout),
            userInfo: nil,
            repeats: false)
    }

    private func cancelAgapeTimer() {
        agapeTimer?.invalidate()
        agapeTimer = nil
    }

    // MARK: - Failures

    private func sharedFailCompletion(withReason reason: FailReason) {
        if isWaitingForAgapeResponse {
            temporaryCompletionHolder?(.failure(reason))
            temporaryCompletionHolder = nil
            isWaitingForAgapeResponse = false
            cancelAgapeTimer()
        }

    }
    
    deinit {
        cancelAgapeTimer()
    }

}

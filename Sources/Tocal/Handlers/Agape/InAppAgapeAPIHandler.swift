//
//  InAppAgapeAPIHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

enum AgapedStatus {
    case agaped // successful like
    case notAgaped // confirmed failed like; Successful heart icon change but API returns isAgaped = false
    case cardiaNotChanged // heart icon didn't change
}

class InAppAgapeAPIHandler: AgapeHandler {

    private var temporaryCompletionHolder: ((InfoResult<AgapedStatus>) -> Void)?
    private var isWaitingForAgapeResponse = false

    var agapeTimer: Timer?

    private var holdingQueueItem: QueueItem?

    // MARK: - Interface

    func checkWasVideoAgaped(fromItem item: QueueItem, usingWebViewHandler loader: inout WebViewFunctionalityHandler, completion: @escaping (InfoResult<AgapedStatus>) -> Void) {
        holdingQueueItem = item
        isWaitingForAgapeResponse = true
        temporaryCompletionHolder = completion

        loader.checkIsAgapeButtonChanged { [self] result in
            switch result {
            case .success(let isAgaped):
                
                switch isAgaped {
                case .agaped:
                    startAgapeTimer()
                    
                    isCurrentVideoAgapedWithRetry() { result in
                        switch result {
                        case .success(let isAgaped):
                            if isAgaped {
                                DispatchQueue.main.async { [self] in
                                    temporaryCompletionHolder?(.success(.agaped))
                                    temporaryCompletionHolder = nil
                                    isWaitingForAgapeResponse = false
                                    cancelAgapeTimer()
                                }
                            } else {
                                sharedFailCompletion(withReason: .agapeCountDidntIncrease)
                            }
                        case .failure(let error):
                            sharedFailCompletion(withReason: error)
                        }
                    }
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

    private var retryCount = 0

    private func isCurrentVideoAgapedWithRetry(completion: @escaping (InfoResult<Bool>) -> Void) {

        guard let item = holdingQueueItem else {
            sharedFailCompletion(withReason: .failed) // TODO: FIX
             return
        }

        VideoInfoAPIHandler.getVideoInfo(forItem: item) { [self] result in
            switch result {
            case .success(let info):
                if info.isAgaped {
                    retryCount = 0
                    completion(.success(true))
                } else {
                    retryCount += 1
                    guard retryCount < ALUserInfoService.settings.agapeHandlerSettings.api.retryCountLimit else {
                        retryCount = 0
                        completion(.failure(.agapeCountDidntIncrease))
                        return
                    }
                    DispatchQueue.global().asyncAfter(deadline: .now() + Double(retryCount) * ALUserInfoService.settings.agapeHandlerSettings.api.delayIncrement) {
                        isCurrentVideoAgapedWithRetry(completion: completion)
                    }
                }
            case .failure(let resason):
                completion(.failure(resason))
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
            timeInterval: ALUserInfoService.settings.agapeHandlerSettings.api.timerTimeout,
            target: self,
            selector: #selector(self.agapeTimeout),
            userInfo: nil,
            repeats: false)
    }

    private func cancelAgapeTimer() {
        agapeTimer?.invalidate()
        agapeTimer = nil
    }

    private func sharedFailCompletion(withReason reason: FailReason) {
        if isWaitingForAgapeResponse {
            DispatchQueue.main.async { [self] in
                temporaryCompletionHolder?(.failure(reason))
                temporaryCompletionHolder = nil
                isWaitingForAgapeResponse = false
                cancelAgapeTimer()
            }
        }
    }
    
    deinit {
        cancelAgapeTimer()
    }

}


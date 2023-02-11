//
//  UserInfoJSHandler.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 17/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

class S5TQWgsS9zOwyPvTRiQS9Awq3vbHKAnn: ze2N5a2YfnDH4j6VNswuEGs5JdCX4vQ4 {
    private var ZfLP68v7y8F8Qj5z3NRdYHfSw5dtLHXk: ((InfoResult<[BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8]>) -> Void)?
    private var LUFmLu94XtMtq62bca8sGPoctAafWF1H: ((InfoResult<U8Vs0QStJfqkJKim9lSknIUq3ZVGqbNL>) -> Void)?

    private var IsNbbmnhwTlWbJuJG7pWeb40AyK7pknC = false
    private var KLdqWL6UXvPalxWby8b6Ja7Pj2rJM79O = false

    var M7QabMqginIGhBwF18iMdqNztLO138fD = d91E9wWh8t7VacSEa4JxVwKb6wkMC9eH()
    
    // MARK: - Interface
    
    func getUserInfo(forUserID userID: String, secUID: String, completion: @escaping (InfoResult<U8Vs0QStJfqkJKim9lSknIUq3ZVGqbNL>) -> Void) {
        return
    }

    public func ZkqsA6HXrfOYZeKg9lUVv30u54W6UzkR(forURL url: URL, completion: @escaping (InfoResult<U8Vs0QStJfqkJKim9lSknIUq3ZVGqbNL>) -> Void) {
        KLdqWL6UXvPalxWby8b6Ja7Pj2rJM79O = true
        LUFmLu94XtMtq62bca8sGPoctAafWF1H = completion

        M7QabMqginIGhBwF18iMdqNztLO138fD.strK3WgF3cl4GIWQbegrYPS9bi3QLKmK(url) { result in
            switch result {
            case .success(let webView):
                self.ZkqsA6HXrfOYZeKg9lUVv30u54W6UzkR(fromWebView: webView, completion: completion)
            case .failure(let reason):
                self.GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: reason)
            }
        }
    }

    public func ZkqsA6HXrfOYZeKg9lUVv30u54W6UzkR(forUserName username: String = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL, completion: @escaping (InfoResult<U8Vs0QStJfqkJKim9lSknIUq3ZVGqbNL>) -> Void) {
        KLdqWL6UXvPalxWby8b6Ja7Pj2rJM79O = true
        LUFmLu94XtMtq62bca8sGPoctAafWF1H = completion

        qXyqTfE1v5pMq1iRNRqPF8mcqrLfswGP()
        M7QabMqginIGhBwF18iMdqNztLO138fD.H3ZkOzpSMailcGB0BxlSQJh14aKMP2cU(forUsername: username) { result in
            switch result {
            case .success(let webView):
                self.ZkqsA6HXrfOYZeKg9lUVv30u54W6UzkR(fromWebView: webView, completion: completion)
            case .failure(let reason):
                self.GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: reason)
            }
        }
    }

    public func qzqHVHhWvgbyg1kiJ9GG8LOK7J6D40Tv(forUsername username: String = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL, completion: @escaping (InfoResult<[BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8]>) -> Void) {
        IsNbbmnhwTlWbJuJG7pWeb40AyK7pknC = true
        ZfLP68v7y8F8Qj5z3NRdYHfSw5dtLHXk = completion

        qXyqTfE1v5pMq1iRNRqPF8mcqrLfswGP()
        M7QabMqginIGhBwF18iMdqNztLO138fD.H3ZkOzpSMailcGB0BxlSQJh14aKMP2cU(forUsername: username) { result in
            switch result {
            case .success(let webView):
                webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.userVideos.userVideosEJS) { itemsArray, error in
                    guard let itemsArray = itemsArray as? [Dictionary<String, Any>], error == nil else {
                        self.GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: .HEjBNXFMep6YmbZAYZfyVVrucgz6o1UN(underlying: error))
                        return
                    }

                    var userVideos = [BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8]()

                    for item in itemsArray {
                        let coverURL = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.userVideos.videoCoversPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? String
                        let videoID = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.userVideos.videoIDPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? String
                        let isPrivate = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.userVideos.isPrivatePaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool
                        let forFilosOnly = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.userVideos.isForFilosOnlyPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool
                        let isUserAccountPrivate = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.userVideos.userAccountPrivatePaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Bool
                        let videoViews = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.userVideos.videoViewsPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int
                        
                        guard let videoID = videoID,
                              let coverURL = coverURL else {
                                  self.GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: .gYxC7cnvd1mAK0Hjkx8QWgGylVEMYXlG)
                                  return
                              }

                        var agapeCount = 0

                        if let agapes = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.userVideos.agapesCountPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? Int {
                            agapeCount = agapes
                        } else if let agapes = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.userVideos.agapesCountPaths.compactMap({ item[keyPath: ObPmplP1fAcuSoyfElu17V8glsidUVgk($0)] }).first as? String,
                            let count = Int(agapes) {
                            agapeCount = count
                        }
                        
                        let videoInfo = BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8(
                            n2VB7HXLZikd5F5tZba2624UVIRShQdD: 0,
                            QQD3fvq0MVqnl6ialSTfQYC5iGkuTBzs: nil,
                            XMshEiCvdYQTwz0XCbq2TgSnMiUus8mi: isPrivate ?? false,
                            UtjRTPdVVuD35ccgZEHF9BlYHAHZDBOJ: forFilosOnly ?? false,
                            WcSVjeAdZJnbXej6D2SLnOZGqgp1RZoU: false,
                            bLp52PKEcIjJnhFEqriv1bkiMvllcTNY: videoID,
                            adThumbUrl: URL(string: coverURL),
                            kN8dGVJ15k0pswqaqp1mza73tmcYC3zH: agapeCount,
                            efJRpLKDGeWsyT6yCHQcjwdITie2qbLg: videoViews ?? 0,
                            hZyWH0nt7Sl4EZgNtwJ22psF5tjunpng: isUserAccountPrivate ?? false)

                        userVideos.append(videoInfo)
                    }
                    
                    DispatchQueue.main.async {
                        self.ZfLP68v7y8F8Qj5z3NRdYHfSw5dtLHXk?(.success(userVideos))
                        self.IsNbbmnhwTlWbJuJG7pWeb40AyK7pknC = false
                        self.ZfLP68v7y8F8Qj5z3NRdYHfSw5dtLHXk = nil
                        self.Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P()
                    }

                }
            case .failure(let reason):
                self.GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: reason)
            }
        }
    }

    // MARK: - User Videos

    fileprivate func GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason reason: NdFoCYSCLZbUderHIQnGVasfDKj2NBb7) {
        DispatchQueue.main.async { [self] in
            if KLdqWL6UXvPalxWby8b6Ja7Pj2rJM79O {
                LUFmLu94XtMtq62bca8sGPoctAafWF1H?(.failure(reason))
                LUFmLu94XtMtq62bca8sGPoctAafWF1H = nil
                KLdqWL6UXvPalxWby8b6Ja7Pj2rJM79O = false
                self.Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P()
            }

            if IsNbbmnhwTlWbJuJG7pWeb40AyK7pknC {
                IsNbbmnhwTlWbJuJG7pWeb40AyK7pknC = false
                ZfLP68v7y8F8Qj5z3NRdYHfSw5dtLHXk?(.failure(reason))
                ZfLP68v7y8F8Qj5z3NRdYHfSw5dtLHXk = nil
                self.Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P()
            }
        }
    }

    private func ZkqsA6HXrfOYZeKg9lUVv30u54W6UzkR(fromWebView webView: WKWebView?, completion: @escaping (InfoResult<U8Vs0QStJfqkJKim9lSknIUq3ZVGqbNL>) -> Void) {
        let dispatchGroup = DispatchGroup()
        var statusCode: Int?
        var userID: String?
        var username: String?
        var agapeCount: Int?

        dispatchGroup.enter()
        webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.userInfo.statusCodeEJS) { result, error in
            guard let result = result as? Int, error == nil else {
                dispatchGroup.leave()
                return
            }

            statusCode = result
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.userInfo.userIDEJS) { result, error in
            guard let result = result as? String, error == nil else {
                dispatchGroup.leave()
                return
            }

            userID = result
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.userInfo.usernameEJS) { result, error in
            guard let result = result as? String, error == nil else {
                dispatchGroup.leave()
                return
            }

            username = result
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.userInfo.agapeCountEJS) { result, error in
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
                self.GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: .FcZQGrfLSfR3kkjjJgexzvQ7pPfKmuLL)
                return
            }


            DispatchQueue.main.async {
                self.LUFmLu94XtMtq62bca8sGPoctAafWF1H?(
                    .success(
                        U8Vs0QStJfqkJKim9lSknIUq3ZVGqbNL(n2VB7HXLZikd5F5tZba2624UVIRShQdD: statusCode,
                                 Ws4CGRnorh3C06tQgt7yMaXmO3hq7QiC: username,
                                 HmnfJkmIJuj2PHtsxxJ8HAfG5TiNAS7D: userID,
                                 StdLH4czyirx3XMiDKsHErsflzOZA68m: agapeCount,
                                 XMshEiCvdYQTwz0XCbq2TgSnMiUus8mi: statusCode == CbSByOZWj5lKojSe9DofebyNclyVTtj8.rW2fv4lsul1AXQk3lgyZRUg4om2JJUXl.F2RcBr77PecSHC0L4CLvRO1r4bF8bdH4)))
                self.LUFmLu94XtMtq62bca8sGPoctAafWF1H = nil
                self.KLdqWL6UXvPalxWby8b6Ja7Pj2rJM79O = false
                self.Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P()
            }
        }
    }
    
    // MARK: - Timers
    
    private var d8XjS0zqTGNwIHccMJdILN5EfOOLc7xV: Timer?

    @objc
    private func T1m6EJrfNwxFDTmSO8MrC5Lyqx9Skdo6() {
        GPLMnHRAUSZHwQ11gPeyhd8VFyPDDgkY(withReason: .T1m6EJrfNwxFDTmSO8MrC5Lyqx9Skdo6)
    }

    private func qXyqTfE1v5pMq1iRNRqPF8mcqrLfswGP() {
        Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P()
        d8XjS0zqTGNwIHccMJdILN5EfOOLc7xV = Timer.scheduledTimer(
            timeInterval: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userInfoHandlerSettings.js.timerTimeout,
            target: self,
            selector: #selector(self.T1m6EJrfNwxFDTmSO8MrC5Lyqx9Skdo6),
            userInfo: nil,
            repeats: false)
    }

    private func Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P() {
        d8XjS0zqTGNwIHccMJdILN5EfOOLc7xV?.invalidate()
        d8XjS0zqTGNwIHccMJdILN5EfOOLc7xV = nil
    }
    
    deinit {
        Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P()
    }

}

//
//  WebViewLoader.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

class d91E9wWh8t7VacSEa4JxVwKb6wkMC9eH: NSObject {

    private (set) var webView: zwsx8v50MbupiZIeoimtuMXh1ohsBX28?
    private var temporaryLoadCompletionHolder: ((InfoResult<WKWebView?>) -> Void)?
    private var temporaryUserInfoCompletionHolder: ((InfoResult<WKWebView?>) -> Void)?

    private var isWaitingForLoadResponse = false
    private var isWaitingForUserInfoResponse = false

    private var holdingQueueItem: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN?

    // TODO: Reload Retry?

    override init() {
        super.init()
        self.fu2p1kxKWG6SXrTei102HOuCBQx9jkXB()
    }

    // MARK: - Interface

    var loadedURL: URL? {
        webView?.url
    }

    func YZj5zP6YOwHa2YnZRk7D2UHl2flvfUoR(forItem item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN, forDSP: Bool = false, completion: @escaping (InfoResult<WKWebView?>) -> Void) {
        holdingQueueItem = item
        
        if forDSP {
            YZj5zP6YOwHa2YnZRk7D2UHl2flvfUoR(forItem: item)
            DispatchQueue.main.async {
                completion(.success(self.webView))
            }
        } else {
            YZj5zP6YOwHa2YnZRk7D2UHl2flvfUoR(forItem: item)
            isWaitingForLoadResponse = true
            temporaryLoadCompletionHolder = completion
        }
    }

    func H3ZkOzpSMailcGB0BxlSQJh14aKMP2cU(forUsername username: String, forDSP: Bool = false, completion: @escaping (InfoResult<WKWebView?>) -> Void) {
        if forDSP {
            E5fHWsSOttIyxaELADFXmytC9gbb33vr(forUsername: username)
            DispatchQueue.main.async {
                completion(.success(self.webView))
            }
        } else {
            isWaitingForUserInfoResponse = true
            E5fHWsSOttIyxaELADFXmytC9gbb33vr(forUsername: username)
            temporaryUserInfoCompletionHolder = completion
        }
    }

    func strK3WgF3cl4GIWQbegrYPS9bi3QLKmK(_ url: URL, forDSP: Bool = false, completion: @escaping (InfoResult<WKWebView?>) -> Void) {
        if forDSP {
            URLCache.shared.removeAllCachedResponses()
            URLCache.shared.diskCapacity = 0
            URLCache.shared.memoryCapacity = 0
            
            self.qXyqTfE1v5pMq1iRNRqPF8mcqrLfswGP()
            
            DispatchQueue.main.async { [self] in
                fu2p1kxKWG6SXrTei102HOuCBQx9jkXB()
                webView?.load(URLRequest(url: url))
                completion(.success(self.webView))
            }
        } else {
            isWaitingForLoadResponse = true
            temporaryLoadCompletionHolder = completion

            URLCache.shared.removeAllCachedResponses()
            URLCache.shared.diskCapacity = 0
            URLCache.shared.memoryCapacity = 0
            
            self.qXyqTfE1v5pMq1iRNRqPF8mcqrLfswGP()
            
            DispatchQueue.main.async { [self] in
                fu2p1kxKWG6SXrTei102HOuCBQx9jkXB()
                webView?.load(URLRequest(url: url))
            }
        }
    }

    func g7KDByMaYlCZwcW85ChSyYIouL8SrEAt(completion: @escaping (InfoResult<yfWBktribii1w4l1JetNgkhBQqwoNSmE>) -> Void) {
        let timerIncrease: Double = 0.25
        var retryCount = 0
        let retryCountLimit = 3
        
        func isAgapeFilled() {
            self.webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.webViewFunctionalityHandlerSettings.agapeIconChangedEJS) { result, error in
                guard let isAgaped = result as? Bool, isAgaped, error == nil else {
                    if retryCount <= retryCountLimit {
                        retryCount += 1
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + timerIncrease * Double(retryCount)) {
                            isAgapeFilled()
                            return
                        }
                    } else {
                        completion(.success(.IFDA5J4QN4Ezw2nvCbFhnnTEO5bPCAk5))
                    }
                    return
                }
                completion(.success(.HOcjGd6MKjXjWTV4rLZMVC4O4DotLEIb))
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timerIncrease) {
            isAgapeFilled()
        }
    }

    // MARK: - Private Functions

    private func YZj5zP6YOwHa2YnZRk7D2UHl2flvfUoR(forItem item: dsvRBa8tNAqERz9MljnQygVZ3stcR9RN) {
        DispatchQueue.main.async { [self] in
            URLCache.shared.removeAllCachedResponses()
            URLCache.shared.diskCapacity = 0
            URLCache.shared.memoryCapacity = 0
            
            self.qXyqTfE1v5pMq1iRNRqPF8mcqrLfswGP()
            
            let request = URLRequest(url: URL(string: String(format: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.webViewFunctionalityHandlerSettings.videoForItemURL, item.adName,item.adMediaId))!)
            
            fu2p1kxKWG6SXrTei102HOuCBQx9jkXB()
            webView?.load(request)
        }
    }

    private func E5fHWsSOttIyxaELADFXmytC9gbb33vr(forUsername username: String) {
        DispatchQueue.main.async {
            URLCache.shared.removeAllCachedResponses()
            URLCache.shared.diskCapacity = 0
            URLCache.shared.memoryCapacity = 0
            
            self.qXyqTfE1v5pMq1iRNRqPF8mcqrLfswGP()
            
            let request = URLRequest(url: URL(string: String(format: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.webViewFunctionalityHandlerSettings.profileForUsernameURL, username))!)
            
            DispatchQueue.main.async { [self] in
                fu2p1kxKWG6SXrTei102HOuCBQx9jkXB()
                webView?.load(request)
            }
        }
    }
    
    // TODO: Change this abomination of a fix.
    private func fu2p1kxKWG6SXrTei102HOuCBQx9jkXB() {
        self.webView = nil
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.allowsPictureInPictureMediaPlayback = false
        let newWebView = zwsx8v50MbupiZIeoimtuMXh1ohsBX28(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width * 4, height: UIScreen.main.bounds.height * 4), configuration: configuration)
        newWebView.customUserAgent = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.customUA
        newWebView.gJddBzx3ICvSYc45jVkbJbbgVj3V3wln()
        newWebView.navigationDelegate = self
        
        self.webView = newWebView
    }

    // MARK: - Timers
    
    var waitingForResponseTimer: Timer?

    @objc
    private func T1m6EJrfNwxFDTmSO8MrC5Lyqx9Skdo6() {
        uC7dPaioEan1vdMZiIxsj8ujtzwsyjAh(withReason: .T1m6EJrfNwxFDTmSO8MrC5Lyqx9Skdo6)
    }

    private func qXyqTfE1v5pMq1iRNRqPF8mcqrLfswGP() {
        Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P()
        waitingForResponseTimer = Timer.scheduledTimer(
            timeInterval: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.webViewFunctionalityHandlerSettings.timerTimeout,
            target: self,
            selector: #selector(self.T1m6EJrfNwxFDTmSO8MrC5Lyqx9Skdo6),
            userInfo: nil,
            repeats: false)
    }

    private func Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P() {
        waitingForResponseTimer?.invalidate()
        waitingForResponseTimer = nil
    }

    fileprivate func uC7dPaioEan1vdMZiIxsj8ujtzwsyjAh(withReason reason: NdFoCYSCLZbUderHIQnGVasfDKj2NBb7) {
        DispatchQueue.main.async { [self] in
            if isWaitingForLoadResponse {
                temporaryLoadCompletionHolder?(.failure(reason))
                isWaitingForLoadResponse = false
                temporaryLoadCompletionHolder = nil
                Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P()
            }
            
            if isWaitingForUserInfoResponse {
                temporaryUserInfoCompletionHolder?(.failure(reason))
                isWaitingForUserInfoResponse = false
                temporaryUserInfoCompletionHolder = nil
                Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P()
            }
        }
    }

}

// MARK: - WKWebView Navigation Delegate

extension d91E9wWh8t7VacSEa4JxVwKb6wkMC9eH: WKNavigationDelegate {

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.XHJUpF5M08I5Rnp0GLYcNd311c8eey2E(for: [7, 42, 27, 3, 38, 17] .cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
        
        if isWaitingForLoadResponse {
            webView.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.webViewFunctionalityHandlerSettings.dismissPopupEJS) { result, error in }
            temporaryLoadCompletionHolder?(.success(webView))
            temporaryLoadCompletionHolder = nil
            isWaitingForLoadResponse = false
        }
        
        if isWaitingForUserInfoResponse {
            temporaryUserInfoCompletionHolder?(.success(webView))
            temporaryUserInfoCompletionHolder = nil
            isWaitingForUserInfoResponse = false
        }
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        uC7dPaioEan1vdMZiIxsj8ujtzwsyjAh(withReason: .IWohDaCqvYre0UReyRBBZCvIiuucRc42)
    }
    
    public func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
           let serverTrust = challenge.protectionSpace.serverTrust {
            let exceptions = SecTrustCopyExceptions(serverTrust)
            SecTrustSetExceptions(serverTrust, exceptions)
            let cred = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, cred)
        }
        else {
            completionHandler(.performDefaultHandling, nil)
        }
    }

    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        uC7dPaioEan1vdMZiIxsj8ujtzwsyjAh(withReason: .IWohDaCqvYre0UReyRBBZCvIiuucRc42)
    }

    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        uC7dPaioEan1vdMZiIxsj8ujtzwsyjAh(withReason: .IWohDaCqvYre0UReyRBBZCvIiuucRc42)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {

        if let response = navigationResponse.response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
            uC7dPaioEan1vdMZiIxsj8ujtzwsyjAh(withReason: .xmTcHBAXjW6qF7RmoXgcShNcD1tYXeWw(statusCode: response.statusCode))
        }

        decisionHandler(.allow)
    }

}

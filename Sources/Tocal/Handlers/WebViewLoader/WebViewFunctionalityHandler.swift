//
//  WebViewLoader.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 15/01/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit

class WebViewFunctionalityHandler: NSObject {

    private (set) var webView: PanPotWebView?
    private var temporaryLoadCompletionHolder: ((InfoResult<WKWebView?>) -> Void)?
    private var temporaryUserInfoCompletionHolder: ((InfoResult<WKWebView?>) -> Void)?

    private var isWaitingForLoadResponse = false
    private var isWaitingForUserInfoResponse = false

    private var holdingQueueItem: QueueItem?

    // TODO: Reload Retry?

    override init() {
        super.init()
        self.setNewWebView()
    }

    // MARK: - Interface

    var loadedURL: URL? {
        webView?.url
    }

    func loadVideo(forItem item: QueueItem, forDSP: Bool = false, completion: @escaping (InfoResult<WKWebView?>) -> Void) {
        holdingQueueItem = item
        
        if forDSP {
            loadVideo(forItem: item)
            DispatchQueue.main.async {
                completion(.success(self.webView))
            }
        } else {
            loadVideo(forItem: item)
            isWaitingForLoadResponse = true
            temporaryLoadCompletionHolder = completion
        }
    }

    func loadUserProfile(forUsername username: String, forDSP: Bool = false, completion: @escaping (InfoResult<WKWebView?>) -> Void) {
        if forDSP {
            loadProfile(forUsername: username)
            DispatchQueue.main.async {
                completion(.success(self.webView))
            }
        } else {
            isWaitingForUserInfoResponse = true
            loadProfile(forUsername: username)
            temporaryUserInfoCompletionHolder = completion
        }
    }

    func loadCustomURL(_ url: URL, forDSP: Bool = false, completion: @escaping (InfoResult<WKWebView?>) -> Void) {
        if forDSP {
            URLCache.shared.removeAllCachedResponses()
            URLCache.shared.diskCapacity = 0
            URLCache.shared.memoryCapacity = 0
            
            self.startTimer()
            
            DispatchQueue.main.async { [self] in
                setNewWebView()
                webView?.load(URLRequest(url: url))
                completion(.success(self.webView))
            }
        } else {
            isWaitingForLoadResponse = true
            temporaryLoadCompletionHolder = completion

            URLCache.shared.removeAllCachedResponses()
            URLCache.shared.diskCapacity = 0
            URLCache.shared.memoryCapacity = 0
            
            self.startTimer()
            
            DispatchQueue.main.async { [self] in
                setNewWebView()
                webView?.load(URLRequest(url: url))
            }
        }
    }

    func checkIsAgapeButtonChanged(completion: @escaping (InfoResult<AgapedStatus>) -> Void) {
        let timerIncrease: Double = 0.25
        var retryCount = 0
        let retryCountLimit = 3
        
        func isAgapeFilled() {
            self.webView?.evaluateJavaScript(ALUserInfoService.settings.webViewFunctionalityHandlerSettings.agapeIconChangedEJS) { result, error in
                guard let isAgaped = result as? Bool, isAgaped, error == nil else {
                    if retryCount <= retryCountLimit {
                        retryCount += 1
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + timerIncrease * Double(retryCount)) {
                            isAgapeFilled()
                            return
                        }
                    } else {
                        completion(.success(.cardiaNotChanged))
                    }
                    return
                }
                completion(.success(.agaped))
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timerIncrease) {
            isAgapeFilled()
        }
    }

    // MARK: - Private Functions

    private func loadVideo(forItem item: QueueItem) {
        DispatchQueue.main.async { [self] in
            URLCache.shared.removeAllCachedResponses()
            URLCache.shared.diskCapacity = 0
            URLCache.shared.memoryCapacity = 0
            
            self.startTimer()
            
            let request = URLRequest(url: URL(string: String(format: ALUserInfoService.settings.webViewFunctionalityHandlerSettings.videoForItemURL, item.adName,item.adMediaId))!)
            
            setNewWebView()
            webView?.load(request)
        }
    }

    private func loadProfile(forUsername username: String) {
        DispatchQueue.main.async {
            URLCache.shared.removeAllCachedResponses()
            URLCache.shared.diskCapacity = 0
            URLCache.shared.memoryCapacity = 0
            
            self.startTimer()
            
            let request = URLRequest(url: URL(string: String(format: ALUserInfoService.settings.webViewFunctionalityHandlerSettings.profileForUsernameURL, username))!)
            
            DispatchQueue.main.async { [self] in
                setNewWebView()
                webView?.load(request)
            }
        }
    }
    
    // TODO: Change this abomination of a fix.
    private func setNewWebView() {
        self.webView = nil
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.allowsPictureInPictureMediaPlayback = false
        let newWebView = PanPotWebView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), configuration: configuration)
        newWebView.customUserAgent = ALUserInfoService.settings.customUA
        newWebView.applyWebViewCookies()
        newWebView.navigationDelegate = self
        
        self.webView = newWebView
    }

    // MARK: - Timers
    
    var waitingForResponseTimer: Timer?

    @objc
    private func timerTimeout() {
        fail(withReason: .timerTimeout)
    }

    private func startTimer() {
        cancelTimer()
        waitingForResponseTimer = Timer.scheduledTimer(
            timeInterval: ALUserInfoService.settings.webViewFunctionalityHandlerSettings.timerTimeout,
            target: self,
            selector: #selector(self.timerTimeout),
            userInfo: nil,
            repeats: false)
    }

    private func cancelTimer() {
        waitingForResponseTimer?.invalidate()
        waitingForResponseTimer = nil
    }

    fileprivate func fail(withReason reason: FailReason) {
        DispatchQueue.main.async { [self] in
            if isWaitingForLoadResponse {
                temporaryLoadCompletionHolder?(.failure(reason))
                isWaitingForLoadResponse = false
                temporaryLoadCompletionHolder = nil
                cancelTimer()
            }
            
            if isWaitingForUserInfoResponse {
                temporaryUserInfoCompletionHolder?(.failure(reason))
                isWaitingForUserInfoResponse = false
                temporaryUserInfoCompletionHolder = nil
                cancelTimer()
            }
        }
    }

}

// MARK: - WKWebView Navigation Delegate

extension WebViewFunctionalityHandler: WKNavigationDelegate {

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.storeAndApplyWebViewCookies(for: [7, 42, 27, 3, 38, 17] .localizedString)
        
        if isWaitingForLoadResponse {
            webView.evaluateJavaScript(ALUserInfoService.settings.webViewFunctionalityHandlerSettings.dismissPopupEJS) { result, error in }
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
        fail(withReason: .pageLoadFailed)
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
        fail(withReason: .pageLoadFailed)
    }

    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        fail(withReason: .pageLoadFailed)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {

        if let response = navigationResponse.response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
            fail(withReason: .responseStatusCodeNotOk(statusCode: response.statusCode))
        }

        decisionHandler(.allow)
    }

}

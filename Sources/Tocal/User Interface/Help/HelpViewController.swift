//
//  HelpViewController.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 16/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
import WebKit

class HelpViewController: MainViewController {

    func set(url: URL) {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.allowsPictureInPictureMediaPlayback = true
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height),
                                configuration: configuration)
        webView.navigationDelegate = self
        webView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        view.addSubview(webView)

        addExitButton(toView: view)

        title = [54, 34, 2, 25, 32, 20, 2, 119, 69, 30, 38, 64, 23].localizedString
        let request = URLRequest(url: url)
        webView.load(request)
        showLoader()
    }

    override var shouldCheckSession: Bool { false }

}

extension HelpViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        showLoader()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        dismissLoader()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        dismissLoader()
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        dismissLoader()
    }

}

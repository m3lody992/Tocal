//
//  AgapeModeViewController.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 02/02/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit
import UIKit

class AgapeModeViewController: MainViewController {
    
    private var topLabel: UILabel!
    private var panPotAgapeMethodSwitch: PanPotAgapeMethodSwitchView!
    private var webView: WKWebView!
    
    private func setupConstraints() {
        topLabel = UILabel()
        topLabel.textAlignment = .center
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topLabel)
        
        panPotAgapeMethodSwitch = PanPotAgapeMethodSwitchView()
        panPotAgapeMethodSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(panPotAgapeMethodSwitch)
        
        webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            topLabel.heightAnchor.constraint(equalToConstant: 24),
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            topLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 24),
            topLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -24),
            panPotAgapeMethodSwitch.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 24),
            panPotAgapeMethodSwitch.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            panPotAgapeMethodSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            panPotAgapeMethodSwitch.heightAnchor.constraint(equalToConstant: 32),
            webView.topAnchor.constraint(equalTo: panPotAgapeMethodSwitch.bottomAnchor, constant: 24),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        view.backgroundColor = .systemBackground
        definesPresentationContext = true
        navigationController?.navigationBar.prefersLargeTitles = true
        title = [63, 42, 27, 18, 105, 55, 10, 51, 83].localizedString // "Like Mode"
        topLabel?.text = [35, 47, 21, 22, 58, 31, 69, 36, 83, 6, 34, 81, 16, 85, 49, 30, 45, 123, 18, 44, 57, 96, 19, 49, 93, 44, 14, 38, 42, 3, 62, 26, 40, 21, 87, 63, 19, 1, 50, 89, 25].localizedString // "Please select how you want to like videos"
        panPotAgapeMethodSwitch?.setMethod(AgapeLogic.currentAgapeMode)
        panPotAgapeMethodSwitch?.onSwitchChange { isOn in
            self.presentAlert(
                withTitle: [50, 49, 21, 87, 48, 21, 16, 119, 69, 31, 53, 87, 91].localizedString, // "Are you sure?"
                andMessage: String(format: [50, 49, 21, 87, 48, 21, 16, 119, 69, 31, 53, 87, 68, 12, 54, 4, 122, 44, 10, 45, 56, 96, 16, 63, 19, 43, 89, 59, 49, 64, 58, 83, 37, 2, 24, 36, 90, 111, 114, 118, 74, 51, 93, 68, 80, 25, 81, 54, 50, 0, 42, 34, 39, 91].localizedString, (isOn ? [39, 42, 27, 35, 38, 17].localizedString : [58, 45, 93, 54, 57, 10] .localizedString), (isOn ? [58, 45, 93, 54, 57, 10].localizedString  : [39, 42, 27, 35, 38, 17].localizedString)),
                imageURL: nil,
                buttons: [.cancel, .ok]) {
                    self.panPotAgapeMethodSwitch?.setMethod(isOn ? .panPotApp : .inApp, animated: true)
                } onOk: {
                    AgapeLogic.currentAgapeMode = isOn ? .inApp : .panPotApp
                }
        }
        
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.allowsPictureInPictureMediaPlayback = true
        webView?.navigationDelegate = self
        webView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        if let navigationView = navigationController?.view {
            addExitButton(toView: navigationView)
        }

        if let url = self.urlToLoad {
            let request = URLRequest(url: url)
            webView?.load(request)
            showLoader()
        }
    }
    
    private var urlToLoad: URL?
    
    func set(url: URL) {
        self.urlToLoad = url
    }

    override var shouldCheckSession: Bool { false }
    
    override var shouldShowAstersLabel: Bool { false }

}

extension AgapeModeViewController: WKNavigationDelegate {

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

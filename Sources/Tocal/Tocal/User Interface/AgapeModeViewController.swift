//
//  AgapeModeViewController.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 02/02/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import WebKit
import UIKit

class YNhyAoYofQUXGmbCVCcSbc1BlqsHK1HC: kBRLNmf7mGhhxUj2Oou351YWEX8tW5mR {
    
    private var topLabel: UILabel!
    private var panPotAgapeMethodSwitch: JnOJZKOjot125iYb4qk4ylIRH9OyR3sB!
    private var webView: WKWebView!
    
    private func fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN() {
        topLabel = UILabel()
        topLabel.textAlignment = .center
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topLabel)
        
        panPotAgapeMethodSwitch = JnOJZKOjot125iYb4qk4ylIRH9OyR3sB()
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
        fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN()
        view.backgroundColor = .systemBackground
        definesPresentationContext = true
        navigationController?.navigationBar.prefersLargeTitles = true
        title = [63, 42, 27, 18, 105, 55, 10, 51, 83].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG // "Like Mode"
        topLabel?.text = [35, 47, 21, 22, 58, 31, 69, 36, 83, 6, 34, 81, 16, 85, 49, 30, 45, 123, 18, 44, 57, 96, 19, 49, 93, 44, 14, 38, 42, 3, 62, 26, 40, 21, 87, 63, 19, 1, 50, 89, 25].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG // "Please select how you want to like videos"
        panPotAgapeMethodSwitch?.S7aJnSa38OOOScw2HRp9LgcUx4zatyYB(ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.yAZk9FiHe1fQtoClV94zzdvnA5hVITcq)
        panPotAgapeMethodSwitch?.raj4XQY4P80uQouuiIVrs9b4CtNcGtgW { isOn in
            self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(
                withTitle: [50, 49, 21, 87, 48, 21, 16, 119, 69, 31, 53, 87, 91].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, // "Are you sure?"
                andMessage: String(format: [50, 49, 21, 87, 48, 21, 16, 119, 69, 31, 53, 87, 68, 12, 54, 4, 122, 44, 10, 45, 56, 96, 16, 63, 19, 43, 89, 59, 49, 64, 58, 83, 37, 2, 24, 36, 90, 111, 114, 118, 74, 51, 93, 68, 80, 25, 81, 54, 50, 0, 42, 34, 39, 91].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, (isOn ? [39, 42, 27, 35, 38, 17].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG : [58, 45, 93, 54, 57, 10] .cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG), (isOn ? [58, 45, 93, 54, 57, 10].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG  : [39, 42, 27, 35, 38, 17].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)),
                imageURL: nil,
                buttons: [.ctAycuUpcqLUeLm6lTTZ7BqWroSqULmt, .grb6TiJukBTRVhDCwf7NauTcStn1037q]) {
                    self.panPotAgapeMethodSwitch?.S7aJnSa38OOOScw2HRp9LgcUx4zatyYB(isOn ? .panPotApp : .inApp, animated: true)
                } onOk: {
                    ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.yAZk9FiHe1fQtoClV94zzdvnA5hVITcq = isOn ? .inApp : .panPotApp
                }
        }
        
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.allowsPictureInPictureMediaPlayback = true
        webView?.navigationDelegate = self
        webView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        if let navigationView = navigationController?.view {
            kAIEE9PXyHH4LyupkJnqh5EN7QWcFWLV(toView: navigationView)
        }

        if let url = self.urlToLoad {
            let request = URLRequest(url: url)
            webView?.load(request)
            zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
        }
    }
    
    private var urlToLoad: URL?
    
    func XEaHoJcMOewthI8CUuDkUl3FbYB7jIna(url: URL) {
        self.urlToLoad = url
    }

    override var shouldCheckSession: Bool { false }
    
    override var shouldShowAstersLabel: Bool { false }

}

extension YNhyAoYofQUXGmbCVCcSbc1BlqsHK1HC: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
    }

}

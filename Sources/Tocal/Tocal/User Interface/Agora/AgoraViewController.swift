//
//  PayPalViewController.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 03/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
import WebKit
import SafariServices
//import UITools
//import InfoServices

class PH2KvuhmBrpy5stkiTNAQf7xbUCNYDNS: kBRLNmf7mGhhxUj2Oou351YWEX8tW5mR {

    private var webViewHolder: UIView!
    private var segmentControl: UISegmentedControl!

    var onWillDismiss: (() -> Void)?

    // Used to cover up the blank when loading
    private var coverView: UIView?
    private var ppWebView: WKWebView?
    private var refreshButton: UIButton?

    private var astersBeforeAgora = 0

    private static let timerInterval: TimeInterval = 10
    private static var timer: Timer?
    
    func JkThEzO5aZob5Q5jbk03EBucKZmhZwAe() {
        view.backgroundColor = .systemBackground
        
        segmentControl = UISegmentedControl()
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentControl)
        
        JwczoOto9GnaEMLsLWnFKB8uZZJ3rjwZ()
        
        webViewHolder = WKWebView()
        webViewHolder.backgroundColor = .systemBackground
        webViewHolder.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webViewHolder)
        
        NSLayoutConstraint.activate([
            segmentControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            segmentControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            webViewHolder.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webViewHolder.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            webViewHolder.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webViewHolder.topAnchor.constraint(equalTo: segmentControl.safeAreaLayoutGuide.bottomAnchor, constant: 8)
        ])
        
        bHCcifwRtW8YquoOuMjUhf8arMzbeRGW()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        JkThEzO5aZob5Q5jbk03EBucKZmhZwAe()
        view.layoutIfNeeded()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.vn9oGCNwGKrLeXDOg1jFKhYORqrujX3M()
        }

        title = [49, 54, 9, 87, 26, 14, 4, 37, 69].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG // Buy Stars
    }

    func JwczoOto9GnaEMLsLWnFKB8uZZJ3rjwZ() {
        if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agoraOptions.count == 1 {
            segmentControl.alpha = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.showSingleAgoraTitle ? 1 : 0
        }

        if #available(iOS 13.0, *) {
            segmentControl.selectedSegmentTintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
        }
        segmentControl.tintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.Jar7RD06FHvVHjzSeGnbPXGhZ6SCXK0x
        segmentControl.backgroundColor = .lightGray
        segmentControl.removeAllSegments()

        segmentControl.addTarget(self, action: #selector(vn9oGCNwGKrLeXDOg1jFKhYORqrujX3M), for: .valueChanged)

        for (index, option) in OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agoraOptions.enumerated() {
            segmentControl.insertSegment(withTitle: option.title, at: index, animated: false)
        }
        segmentControl.selectedSegmentIndex = 0
    }

    @objc
    func vn9oGCNwGKrLeXDOg1jFKhYORqrujX3M() {
        for (index, option) in OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agoraOptions.enumerated() {
            switch option.type {
            case .yap:
                if segmentControl.selectedSegmentIndex == index {
                    sEV4WMwMelKIVVqqk2goxnyHhWMwtiTD()
                }
            case .pp:
                if segmentControl.selectedSegmentIndex == index {
                    Xq482yUka3abNtxJ2IoPsVinIBORQeLp()
                }
            case .ap:
                if segmentControl.selectedSegmentIndex == index {
                    GDPFQtPYqnOClD7ZW0qBud3sJg07o3a1()
                }
            }
        }
    }

    func bHCcifwRtW8YquoOuMjUhf8arMzbeRGW() {
        refreshButton = UIButton(type: .custom)
        refreshButton?.addTarget(self, action: #selector(LF61M1gDcis8KCPvj7ImUWy2Iu9XRnrh), for: .touchUpInside)
        refreshButton?.imageView?.contentMode = .scaleAspectFit
        refreshButton?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        refreshButton?.widthAnchor.constraint(equalToConstant: 24).isActive = true
        refreshButton?.isEnabled = false
        refreshButton?.kf.setImage(with: CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.WERn0NEDKXbjw1izj5lvVwLlvouRo5z5, for: .normal, options: Processor.Options.pdfTemplate)
        guard let refreshButton = refreshButton else { return }
        navigationItem.setLeftBarButton(.init(customView: refreshButton), animated: false)
        refreshButton.isEnabled = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agoraOptions[segmentControl.selectedSegmentIndex].type == .ap
    }

    @objc
    func LF61M1gDcis8KCPvj7ImUWy2Iu9XRnrh() {
        dvDoONyTnTgeJnRE3jM3Tx3caI4bE73j(withPrompt: true)
    }

    func dvDoONyTnTgeJnRE3jM3Tx3caI4bE73j(withPrompt: Bool) {
        // "Reload?"
        if withPrompt {
            ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [33, 38, 28, 24, 40, 30, 90].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [50, 49, 21, 87, 48, 21, 16, 119, 69, 31, 53, 87, 68, 12, 54, 4, 122, 44, 2, 48, 36, 96, 16, 63, 19, 42, 75, 62, 42, 66, 54, 76].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.ctAycuUpcqLUeLm6lTTZ7BqWroSqULmt, .grb6TiJukBTRVhDCwf7NauTcStn1037q]) {
                if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agoraOptions[self.segmentControl.selectedSegmentIndex].type == .ap {
                    self.GDPFQtPYqnOClD7ZW0qBud3sJg07o3a1()
                } else if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agoraOptions[self.segmentControl.selectedSegmentIndex].type == .pp {
                    self.Xq482yUka3abNtxJ2IoPsVinIBORQeLp()
                }
            }
        } else {
            if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agoraOptions[self.segmentControl.selectedSegmentIndex].type == .ap {
                self.GDPFQtPYqnOClD7ZW0qBud3sJg07o3a1()
            } else if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agoraOptions[self.segmentControl.selectedSegmentIndex].type == .pp {
                self.Xq482yUka3abNtxJ2IoPsVinIBORQeLp()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        astersBeforeAgora = maqLKRb6dHH50KVEL9xdQ75ElHiPaZNU.nE9BIkaLKzw5jFajLdwMmfrXwJx1Yo7G
        HbhocNBx3AObBaDt7sJXmEZmLYg1SLQC()
    }

    func sEV4WMwMelKIVVqqk2goxnyHhWMwtiTD() {
        for subview in webViewHolder.subviews {
            subview.removeFromSuperview()
        }

        let yapVC = HSfEs8EdlQsg2OhzoDSSgImK9eUe0fyv()
        yapVC.onAgora = { [weak self] in
            self?.HbhocNBx3AObBaDt7sJXmEZmLYg1SLQC()
        }

        addChild(yapVC)
        yapVC.view.frame = CGRect(x: 0, y: 0, width: webViewHolder.frame.size.width, height: webViewHolder.frame.size.height)

        webViewHolder.addSubview(yapVC.view)

        if let yapOption = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agoraOptions.first(where: { $0.type == .yap }),
           yapOption.useMessage {
            ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: yapOption.messageTitle, andMessage: yapOption.messageBody)
        }

        refreshButton?.isEnabled = false
    }

    func Xq482yUka3abNtxJ2IoPsVinIBORQeLp() {
        for subview in webViewHolder.subviews {
            subview.removeFromSuperview()
        }

        PH2KvuhmBrpy5stkiTNAQf7xbUCNYDNS.Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P()

        let wkConfiguration = WKWebViewConfiguration()
        wkConfiguration.allowsInlineMediaPlayback = true
        wkConfiguration.allowsPictureInPictureMediaPlayback = true

        ppWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: webViewHolder.frame.size.width, height: webViewHolder.frame.size.height),
                              configuration: wkConfiguration)
        ppWebView?.navigationDelegate = self
        ppWebView?.isOpaque = false

        if let ppWebView = ppWebView {
            webViewHolder.addSubview(ppWebView)

            // https://log.zare.mobi/pp/buttons.php
            var urlComponents = URLComponents(url: pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.x82MzAjZzxmvnrctzrmwSfIqKSEAnbmA.appendingPathComponent([92, 51, 0, 88, 43, 15, 17, 35, 89, 4, 52, 28, 20, 29, 41].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG), resolvingAgainstBaseURL: false)
            urlComponents?.queryItems = [URLQueryItem(name: [6, 48, 21, 5, 22, 19, 1].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, value: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.DDZcxYtTnAP10EgJcEjOjdIDK6SwOKCa)] // "user_id=
            if let url = urlComponents?.url {
                ppWebView.load(URLRequest(url: url))
            }
        }

        // Add cover view so white background doesn't show if user has dark mode enabled.
        coverView = UIView(frame: CGRect(x: 0, y: 0, width: webViewHolder.frame.size.width, height: webViewHolder.frame.size.height))
        if #available(iOS 13.0, *) {
            coverView?.backgroundColor = .systemBackground
        } else if #available(iOS 12.0, *) {
            coverView?.backgroundColor = traitCollection.userInterfaceStyle == .light ? .white : .black
        }

        if let coverView = coverView {
            webViewHolder.addSubview(coverView)
        }

        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()

        // Disable refresh on paypal page untill user fails
        refreshButton?.isEnabled = false

        if let yapOption = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agoraOptions.first(where: { $0.type == .pp }),
           yapOption.useMessage {
            ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: yapOption.messageTitle, andMessage: yapOption.messageBody)
        }
    }

    func GDPFQtPYqnOClD7ZW0qBud3sJg07o3a1(increaseCover: Bool = false) {
        for subview in webViewHolder.subviews {
            subview.removeFromSuperview()
        }

        let configuration = SFSafariViewController.Configuration()
        configuration.entersReaderIfAvailable = true

        // https://buy.app-spot.net/app_appname/?user_id=12123123
        var urlComponents = URLComponents(url: pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.kc6VSRS9jQQR50B5a4F2QnfoxDr2MPON.appendingPathComponent([18, 51, 0, 40].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.to18NPrcGuVPyJDfwah5TM4jP0qXUg0R.lowercased()), resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [URLQueryItem(name: [6, 48, 21, 5, 22, 19, 1].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, value: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.DDZcxYtTnAP10EgJcEjOjdIDK6SwOKCa)] // "user_id=
        if let url = urlComponents?.url {
            let safariViewController = SFSafariViewController(url: url)
            safariViewController.delegate = self

            addChild(safariViewController)
            safariViewController.view.frame = CGRect(x: 0, y: 0, width: webViewHolder.frame.size.width, height: webViewHolder.frame.size.height)

            webViewHolder.addSubview(safariViewController.view)
        }

        // Add 2 views that cover up the navigation stuff in Safari
        let topView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0),
                                           size: CGSize(width: webViewHolder.frame.width, height: increaseCover ? 88 : 44)))
        let bottomView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: webViewHolder.frame.height - 44),
                                              size: CGSize(width: webViewHolder.frame.width, height: 44)))
        topView.backgroundColor = webViewHolder.backgroundColor
        bottomView.backgroundColor = webViewHolder.backgroundColor

        // Add cover view so white background doesn't show if user has dark mode enabled.
        coverView = UIView(frame: CGRect(x: 0, y: 0, width: webViewHolder.frame.size.width, height: webViewHolder.frame.size.height))
        if #available(iOS 13.0, *) {
            coverView?.backgroundColor = .systemBackground
        } else if #available(iOS 12.0, *) {
            coverView?.backgroundColor = traitCollection.userInterfaceStyle == .light ? .white : .black
        }

        webViewHolder.addSubview(topView)
        webViewHolder.addSubview(bottomView)

        if let coverView = coverView {
            webViewHolder.addSubview(coverView)
        }

        // Set this to true in case user actually buys.
        OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.ocGdcspqH2VU2sUchLv15DMFKb2FgOKq = true
        OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.wgnV3n8CpfTckNPIfF9Mo6Na6Vl6SNwm = Date()
        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
        qXyqTfE1v5pMq1iRNRqPF8mcqrLfswGP()

        // Enable button on apple pay website since we can't detect what's going on.
        refreshButton?.isEnabled = true

        if let yapOption = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.agoraOptions.first(where: { $0.type == .ap }),
           yapOption.useMessage {
            ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: yapOption.messageTitle, andMessage: yapOption.messageBody)
        }
    }

    func qXyqTfE1v5pMq1iRNRqPF8mcqrLfswGP() {
        PH2KvuhmBrpy5stkiTNAQf7xbUCNYDNS.Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P()

        PH2KvuhmBrpy5stkiTNAQf7xbUCNYDNS.timer = Timer.scheduledTimer(withTimeInterval: PH2KvuhmBrpy5stkiTNAQf7xbUCNYDNS.timerInterval, repeats: true) { [weak self] _ in
            maqLKRb6dHH50KVEL9xdQ75ElHiPaZNU.bSEHPpJyFxWj5NHyBqdLGtKOwnjJBZyG { agoradAsters in
                guard let agoradAsters = agoradAsters else { return }
                if agoradAsters > 0 {
                    PH2KvuhmBrpy5stkiTNAQf7xbUCNYDNS.Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P()
                    self?.HbhocNBx3AObBaDt7sJXmEZmLYg1SLQC()
                    self?.segmentControl.isUserInteractionEnabled = true
                    OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.uVSa0atRaIlt7n1DgqZJ3Q7sGUIjH909 = true
                    OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.lgKJTwunyR3ZMEXRcoXyhyaWMNQxG6K6()
                    // Purchase successful!, "%d ⭐️ have been added to your balance."
                    self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [35, 54, 2, 20, 33, 27, 22, 50, 22, 25, 50, 81, 7, 16, 42, 2, 60, 46, 7, 98].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: String(format: [86, 39, 80, 149, 228, 234, 138, 239, 185, 74, 47, 83, 18, 16, 121, 19, 63, 62, 5, 99, 45, 36, 0, 53, 87, 120, 90, 61, 101, 90, 61, 6, 49, 80, 21, 40, 22, 4, 57, 85, 15, 105].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, agoradAsters), buttons: [.grb6TiJukBTRVhDCwf7NauTcStn1037q]) { [weak self] in
                        self?.dvDoONyTnTgeJnRE3jM3Tx3caI4bE73j(withPrompt: false)
                    }
                }
            }
        }
    }

    static func Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P() {
        PH2KvuhmBrpy5stkiTNAQf7xbUCNYDNS.timer?.invalidate()
        PH2KvuhmBrpy5stkiTNAQf7xbUCNYDNS.timer = nil
    }

    deinit {
        PH2KvuhmBrpy5stkiTNAQf7xbUCNYDNS.Mcpw8J3bq8HXTJ8DyEuNxEpIumUrlY1P()
    }

}

extension PH2KvuhmBrpy5stkiTNAQf7xbUCNYDNS: WKNavigationDelegate, SFSafariViewControllerDelegate {

    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.coverView?.removeFromSuperview()
            self.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
        }
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.coverView?.removeFromSuperview()
            self.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
        }
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url?.absoluteString
        // success
        if url?.contains([0, 54, 19, 20, 44, 9, 22].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) ?? false {  // success
            // Start timer to check for stars from backend.
            qXyqTfE1v5pMq1iRNRqPF8mcqrLfswGP()

            // Disable refresh button since page will be automatically refreshed once he gets his stars.
            refreshButton?.isEnabled = false

            // We are waiting for stars to arrive.
            OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.ocGdcspqH2VU2sUchLv15DMFKb2FgOKq = true

            // Disable interaction so user doesn't navigate away from paypal untill he gets stars.
            segmentControl.isUserInteractionEnabled = false
        } else if url?.contains([21, 34, 25, 27].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) ?? false { // fail
            // Enable button so user can refresh and start again.
            refreshButton?.isEnabled = true

            // User isn't waiting for stars anymore.
            OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.ocGdcspqH2VU2sUchLv15DMFKb2FgOKq = false

            // "Purchase Failed", "Oops, something went wrong! Please try again later."
            self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [35, 54, 2, 20, 33, 27, 22, 50, 22, 44, 38, 91, 8, 16, 61].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [60, 44, 0, 4, 101, 90, 22, 56, 91, 15, 51, 90, 13, 27, 62, 81, 45, 62, 5, 55, 108, 55, 22, 63, 93, 63, 0, 114, 21, 79, 55, 18, 48, 21, 87, 61, 8, 28, 119, 87, 13, 38, 91, 10, 85, 53, 16, 46, 62, 25, 109].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
        } else {
            refreshButton?.isEnabled = false
            GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
        }

        // checkout/review
        if url?.contains([16, 43, 21, 20, 34, 21, 16, 35, 25, 24, 34, 68, 13, 16, 46].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) ?? false {
            view.endEditing(true)
        }

        decisionHandler(.allow)
    }

}

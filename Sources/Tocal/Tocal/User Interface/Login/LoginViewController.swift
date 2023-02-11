//
//  LoginViewController.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 29/07/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import WebKit
import MessageUI
//import UITools
//import DeviceTools
//import InfoServices
//import Networking

public enum nfvvRL62DlDmKwdJtWtmDQr9Veu7zBsm {
    case BeZn2JVaAqZPmTew0fZkhcmibPXIamrL
    case ezvQUcZ67kL7gVJ5kXfHfK9gZDgLXAYr
}

public class c3luhj95klDgTgnK5IBcmpo7MrCTn1Ob: kBRLNmf7mGhhxUj2Oou351YWEX8tW5mR {

    let http = GyVdk6JyHecjDyYHKgALpPUXqaaPn0Da<RBiSyKE4En773hSSDHFoN2lHb37cDW0Z>(engine: .customSession)

    var state: nfvvRL62DlDmKwdJtWtmDQr9Veu7zBsm = .ezvQUcZ67kL7gVJ5kXfHfK9gZDgLXAYr

    var timer: Timer?

    var cookieCheckCount = 0

    var webView: WKWebView?
    var popupWebView: WKWebView?

    override public var shouldShowAstersLabel: Bool { false }
    override public var shouldCheckSession: Bool { false }

    private var toolBar: UIToolbar!
    private var helpBarButton: UIBarButtonItem!
    private var helpButton: UIButton!
    private var emailBarButton: UIBarButtonItem!
    private var emailButton: UIButton!
    private var containerView: UIView!
    
    func fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN() {
        view.backgroundColor = .systemBackground
        
        toolBar = UIToolbar()
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toolBar)
        
        emailButton = UIButton()
        emailButton.setTitleColor(pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz, for: .normal)
        emailBarButton = UIBarButtonItem(customView: emailButton)
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        
        helpButton = UIButton()
        helpButton.setTitleColor(pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz, for: .normal)
        helpBarButton = UIBarButtonItem(customView: helpButton)
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([emailBarButton, spacer, helpBarButton], animated: false)
        
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            toolBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            toolBar.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor),
        ])
    }


    public override func viewDidLoad() {
        super.viewDidLoad()
        fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN()
        UIApplication.shared.statusBarStyle = .default

        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.allowsPictureInPictureMediaPlayback = true
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: containerView.frame.size.width, height: containerView.frame.size.height),
                                configuration: configuration)
        webView?.customUserAgent = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.loginUA
        webView?.navigationDelegate = self
        webView?.uiDelegate = self
        webView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        guard let webView = webView else { return }
        containerView.addSubview(webView)

        toolBar.barTintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
        navigationController?.navigationBar.barTintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz

        pulTUkU4iRqEH9zdJkl68PVDeei7I36p()
        CtAyVaewiNwmO0gwQ804pYvT68zQVUx5()

        JXv4b2FZoqEbNpS78glr7BKT3FwNHm4X()
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
    }

    func JXv4b2FZoqEbNpS78glr7BKT3FwNHm4X() {
        // "https://www.tiktok.com/login?lang=en"
        let request = URLRequest(url: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.loginURL)

        if state == .ezvQUcZ67kL7gVJ5kXfHfK9gZDgLXAYr {
            jzdNSjZ9A6UJFROPXCpiUtipD33ZgVHw()
        }

        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
        cookieCheckCount = 0

        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0

        webView?.qIgxHd0fziXmTqYPDM7rTWz0WCwiYoWR {
            oflSbgiFZAPLJP1qWTctGWTgs1wqcUjw.ShBnpABOK5vSlIrIphGnZoZBbRXxrulE { [weak self] in
                URLProtocol.hyVZivQ1Bv8MhFSdwsJkp9jAFD0kW4te([27, 55, 4, 7, 58].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
                URLProtocol.unregisterClass(bOfTArcDw0ZXaX7j9HTVjr8XnnzwJZnY.self)
                self?.webView?.load(request)
            }
        }
    }

    func T5GRxRi0bUTRL3QGcVwjTrKLURBa03Pg() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.UrHIpoNYsQGwgRYnXSlgNUdrkT5b1qqw()
        }
    }

    func UrHIpoNYsQGwgRYnXSlgNUdrkT5b1qqw() {
        guard cookieCheckCount < OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.loginRetryCount else {
            timer?.invalidate()
            timer = nil
            // "Error", "We are having trouble detecting your login, please try again."
            ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [54, 49, 2, 24, 59].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG,
                         andMessage: [36, 38, 80, 22, 59, 31, 69, 63, 87, 28, 46, 92, 3, 85, 45, 3, 53, 46, 9, 47, 41, 96, 0, 53, 71, 61, 77, 38, 44, 77, 53, 83, 58, 31, 2, 59, 90, 9, 56, 81, 3, 41, 30, 68, 5, 53, 20, 59, 40, 14, 99, 56, 50, 29, 112, 82, 63, 79, 59, 43, 13].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG,
                         buttons: [.grb6TiJukBTRVhDCwf7NauTcStn1037q]) { [self] in
                zLrelL4PStGTKlYQJD7heZrYmoIfOWey()
                JXv4b2FZoqEbNpS78glr7BKT3FwNHm4X()
            }
            return
        }

        // TODO: !
        oflSbgiFZAPLJP1qWTctGWTgs1wqcUjw.HZwP2p9hpbPZegRKRLqRPpr7DsOGXoMx(for: [7, 42, 27, 3, 38, 17] .cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) { cookies in
            self.cookieCheckCount += 1
            if cookies.contains(where: { $0.name == OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.cookieName }) {

                let finishLogin = { [weak self] in
                    self?.webView?.XHJUpF5M08I5Rnp0GLYcNd311c8eey2E(for: [7, 42, 27, 3, 38, 17] .cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) {
                        self?.timer?.invalidate()
                        self?.timer = nil
                        self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn {
                            self?.webView?.removeFromSuperview()
                            self?.webView = nil
                            UIApplication.shared.windows.first?.rootViewController = b7gRtY6i1M7BkFYE0WrWckidWT0Rzpw0()
                        }
                    }
                }

                if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.adv47DQ8TCJfxb6oOECpPCxATRwklqua { 
                    finishLogin()
                } else {
                    // Check if user is existing user again.
                    self.http.m5Siq4ZT8sfqDUeK6HLYK6PaNiVsLEZP(.init(SAuL4WFDmxOLz6dtnXaIO9YYx3yhFuMq: .R8myqoZ3aNDIq9Ht98QFPTDtSRGmVNNQ(panPotID: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.DDZcxYtTnAP10EgJcEjOjdIDK6SwOKCa))) { [weak self] (result: Result<FpuDL47pSnHDcqqighZhyxwCvlD4DX38, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) in
                        switch result {
                        case .success(let existingUser):
                            if existingUser.experiment == [21, 115, 21, 78, 122, 24, 6, 49, 87, 82, 112, 83, 1, 19, 106, 67].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, existingUser.views > 0 { // "f0e93bcfa87aef32"
                                OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.adv47DQ8TCJfxb6oOECpPCxATRwklqua = true
                                finishLogin()
                            } else if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.RilphweD7muYuJGQ7hAbYKdazAY1lUGk {
                                finishLogin()
                            } else {
                                DispatchQueue.main.async {
                                    self?.dismiss(animated: true)
                                }
                            }

                        case .failure:
                            // TODO: Should we do this here if request fails?
                            DispatchQueue.main.async {
                                self?.dBGVEd9F98b9ckK5EurrqJ5K9zmtXztF(enabled: true)
                                self?.dismiss(animated: true)
                            }
                            return
                        }
                    }
                }
            }
        }
    }

}

extension c3luhj95klDgTgnK5IBcmpo7MrCTn1Ob: WKNavigationDelegate, WKUIDelegate {

    @objc func d92y8GzriuPJRvrPJI0VUCSjAQg1AHWP() {
        let helpVC = xJnrm5zRqHOD7VtcYbxe4lqV7VDEQwSN()
        helpVC.XEaHoJcMOewthI8CUuDkUl3FbYB7jIna(url: pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.R8r0pjGlMK6ftNBnM6ElIacCJ0GIffSd.appendingPathComponent([92, 43, 21, 27, 57, 37, 9, 56, 81, 3, 41, 29].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)) // "/help_login/"
        present(helpVC, animated: true)
    }

    @objc func imnZp7W6vNUjPTGVXJeLAmHXlLul06TK() {
        // "Send email?", "Would you like to send us an email?"
        ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [32, 38, 30, 19, 105, 63, 8, 54, 95, 6, 120].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [36, 44, 5, 27, 45, 90, 28, 56, 67, 74, 43, 91, 15, 16, 121, 5, 53, 123, 24, 38, 34, 36, 68, 37, 64, 120, 79, 60, 101, 70, 63, 18, 42, 28, 72].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.grb6TiJukBTRVhDCwf7NauTcStn1037q, .ctAycuUpcqLUeLm6lTTZ7BqWroSqULmt]) { [weak self] in
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients([OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.email])
                mail.setSubject([32, 54, 0, 7, 38, 8, 17, 119, 27, 74].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + (OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.adv47DQ8TCJfxb6oOECpPCxATRwklqua ? pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.DLibXxJp5dXlLkgbPnBW5NmpYxtGSfUk + [83, 110, 80, 27, 125, 22].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG : pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.DLibXxJp5dXlLkgbPnBW5NmpYxtGSfUk) + [83, 110, 80, 59, 38, 29, 12, 57].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
                mail.setMessageBody(String(format: [49, 38, 28, 24, 62, 90, 12, 36, 22, 11, 103, 86, 1, 6, 58, 3, 51, 43, 31, 42, 35, 46, 68, 63, 85, 120, 66, 61, 34, 74, 60, 83, 38, 2, 5, 38, 8, 95, 119, 60, 96, 77, 56, 110, 127, 83, 123, 80, 81, 97, 73, 70, 74, 110, 90, 57, 82, 36, 88, 79, 41, 88, 121, 73, 122, 125, 67, 112, 111, 93, 60, 74, 50, 65, 1, 7, 55, 16, 55, 62, 81, 99, 105, 0, 68, 90, 90, 23, 125, 114, 19, 70, 32, 0, 42, 31, 25, 115, 90, 64, 23, 22, 96, 35, 87, 18, 28, 58, 20, 122, 54, 4, 39, 41, 44, 94, 112, 22, 24, 14, 88, 36, 83, 34, 83, 53, 21, 5, 58, 19, 10, 57, 12, 74, 98, 114, 68, 127, 52, 28, 96, 123, 78, 3].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG,
                                           OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL.isEmpty ? [0, 55, 17, 5, 61, 37, 21, 54, 81, 15].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG : OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL,
                                           UIDevice.current.systemVersion,
                                           RdXhUuFovgT0fGXD1JFd3rA4LnK7rxWV.VkDVIhGnmUp9UtD0xn7YMNwfnpkV9IUm,
                                           RdXhUuFovgT0fGXD1JFd3rA4LnK7rxWV.gL0sNTnnLimbnEsUJMS0GupSeaMvk3mO,
                                           OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.adv47DQ8TCJfxb6oOECpPCxATRwklqua ? pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.DLibXxJp5dXlLkgbPnBW5NmpYxtGSfUk + [83, 110, 80, 27, 125, 22].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG : pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.DLibXxJp5dXlLkgbPnBW5NmpYxtGSfUk),
                                    isHTML: false)

                self?.present(mail, animated: true)
            } else {
                self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [36, 34, 2, 25, 32, 20, 2, 118].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [42, 44, 5, 87, 39, 31, 0, 51, 22, 30, 40, 18, 23, 16, 45, 4, 42, 123, 10, 45, 108, 37, 73, 61, 82, 49, 66, 114, 36, 64, 49, 28, 54, 30, 3, 105, 19, 11, 119, 89, 24, 35, 87, 22, 85, 45, 30, 122, 40, 14, 45, 40, 96, 5, 112, 113, 45, 73, 114, 23, 70, 34, 28, 49, 4, 86].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            }
        }
    }

    @objc func zLrelL4PStGTKlYQJD7heZrYmoIfOWey() {
        popupWebView?.removeFromSuperview()
        navigationItem.leftBarButtonItem = nil
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.webView?.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.rmvLoginHead) { result, error in }
        }
    }

    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        if let urlString = webView.url?.absoluteString,
           urlString.contains(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.loginSP) {
            zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL(withText: [63, 44, 23, 16, 32, 20, 2, 119, 95, 4, 105, 28, 74].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, blockTouches: false) // "Logging in..."
        } else {
            zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
            dBGVEd9F98b9ckK5EurrqJ5K9zmtXztF(enabled: false)
        }
    }

    public func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        configuration.applicationNameForUserAgent = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.loginSUA
        popupWebView = WKWebView(frame: containerView.bounds, configuration: configuration)
        popupWebView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        popupWebView?.navigationDelegate = self
        popupWebView?.uiDelegate = self
        guard let popupWebView = popupWebView else { return nil }
        containerView.addSubview(popupWebView)
        mUCE407V26q4Ci2pLM8dPsh84m5aUmxE()
        pulTUkU4iRqEH9zdJkl68PVDeei7I36p()
        CtAyVaewiNwmO0gwQ804pYvT68zQVUx5()
        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
        return popupWebView
    }

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let urlString = webView.url?.absoluteString,
           urlString.contains(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.loginSP) == false {
            GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
        }
        
        dBGVEd9F98b9ckK5EurrqJ5K9zmtXztF(enabled: true)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            webView.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.rmvLoginHead) { result, error in }
        }

        if let urlString = webView.url?.absoluteString,
            urlString.contains(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.loginSP) {
            
            if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.pressAcceptAll {
                webView.evaluateJavaScript([23, 44, 19, 2, 36, 31, 11, 35, 24, 8, 40, 86, 29, 91, 48, 31, 52, 62, 25, 11, 24, 13, 40].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) { result, error in // "document.body.innerHTML"
                    if let result = result as? String, error == nil, result.contains(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.containsAcceptAllString) {
                        webView.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.containsAcceptAllJSE) { result, error in }
                    }
                }
            }

            dBGVEd9F98b9ckK5EurrqJ5K9zmtXztF(enabled: false)
            
            let retryCountLimit = 5
            var retryCount = 0
            if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.hidePopupOnLogin {
                self.zLrelL4PStGTKlYQJD7heZrYmoIfOWey()
            }
            
            func fetchUserInfoWithRetry() {
                let dispatchGroup = DispatchGroup()
                dispatchGroup.enter()
                webView.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.usernameEJS) { username, error in
                    guard let username = username as? String,
                          !username.isEmpty,
                          error == nil else {
                              dispatchGroup.leave()
                              return
                          }
                    OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL = username
                    dispatchGroup.leave()
                }
                
                dispatchGroup.enter()
                webView.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.userIDEJS) { userID, error in
                    guard let userID = userID as? String,
                          !userID.isEmpty,
                          error == nil else {
                              dispatchGroup.leave()
                              return
                          }
                    OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.DDZcxYtTnAP10EgJcEjOjdIDK6SwOKCa = userID
                    dispatchGroup.leave()
                }
                
                dispatchGroup.notify(queue: .main) {
                    guard !OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.DDZcxYtTnAP10EgJcEjOjdIDK6SwOKCa.isEmpty && !OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL.isEmpty else {
                        guard retryCount < retryCountLimit else {
                            DispatchQueue.main.async {
                                self.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn() {
                                    self.AWw7MslU9qP6AVDqXO8i1RCoegPwCiDp(withText: [48, 34, 30, 80, 61, 90, 9, 56, 81, 3, 41, 19, 68, 37, 53, 16, 41, 62, 75, 55, 62, 57, 68, 49, 84, 57, 71, 60, 101, 79, 51, 7, 38, 2, 89] .cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) //"Can't login! Plase try again later."
                                    self.JXv4b2FZoqEbNpS78glr7BKT3FwNHm4X()
                                }
                            }
                            return
                        }
                        retryCount += 1
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(retryCount)) {
                            fetchUserInfoWithRetry()
                        }
                        return
                    }
                    // We have username and userID
                    self.T5GRxRi0bUTRL3QGcVwjTrKLURBa03Pg()
                }
            }
            
            fetchUserInfoWithRetry()
        }
        
    }

    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
        dBGVEd9F98b9ckK5EurrqJ5K9zmtXztF(enabled: true)
    }

    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
        dBGVEd9F98b9ckK5EurrqJ5K9zmtXztF(enabled: true)
    }

}

extension c3luhj95klDgTgnK5IBcmpo7MrCTn1Ob: MFMailComposeViewControllerDelegate {

    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if case .sent = result {
            controller.dismiss(animated: true) {
                self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [54, 46, 17, 30, 37, 90, 22, 50, 88, 30, 102].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: nil, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            }
        } else {
            controller.dismiss(animated: true)
        }
    }

}

extension c3luhj95klDgTgnK5IBcmpo7MrCTn1Ob {

    func jzdNSjZ9A6UJFROPXCpiUtipD33ZgVHw() {
        let exitButton = UIButton(type: .custom)
        exitButton.tintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
        exitButton.backgroundColor = UIColor(red: 249 / 255, green: 246 / 255, blue: 239 / 255, alpha: 1.0)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.kf.setImage(with: CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.nHfyGsFvANa9LriugGdDXJLdpU9COhlo, for: .normal, options: Processor.Options.pdfTemplate)
        exitButton.imageView?.contentMode = .scaleAspectFit
        exitButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        exitButton.layer.cornerRadius = 16
        exitButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        exitButton.clipsToBounds = true

        let tag = Int.random(in: 0 ... 10000)
        exitButtonTags.append(tag)
        exitButton.tag = tag

        exitButton.addTarget(self, action: #selector(zLrelL4PStGTKlYQJD7heZrYmoIfOWey), for: .touchUpInside)
        navigationItem.setRightBarButton(.init(customView: exitButton), animated: false)

        exitButton.addTarget(self, action: #selector(DkxzUMQCtpoBYDed8cUPrr360w7OP0fk), for: .touchUpInside)
    }

    func mUCE407V26q4Ci2pLM8dPsh84m5aUmxE() {
        if navigationItem.leftBarButtonItem == nil {
            let backButton = UIButton(type: .custom)
            backButton.tintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
            backButton.backgroundColor = UIColor(red: 249 / 255, green: 246 / 255, blue: 239 / 255, alpha: 1.0)
            backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.kf.setImage(with: CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.hE5yk2b6a4g99szNjwfId3b0uwkPFbpn, for: .normal, options: Processor.Options.pdfTemplate)
            backButton.imageView?.contentMode = .scaleAspectFit
            backButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
            backButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
            backButton.layer.cornerRadius = 16
            backButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 2, bottom: 4, right: 4)
            backButton.clipsToBounds = true
            backButton.addTarget(self, action: #selector(zLrelL4PStGTKlYQJD7heZrYmoIfOWey), for: .touchUpInside)
            navigationItem.setLeftBarButton(.init(customView: backButton), animated: false)
        }
    }

    func pulTUkU4iRqEH9zdJkl68PVDeei7I36p() {
        emailButton.tintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
        emailButton.backgroundColor = UIColor(red: 249 / 255, green: 246 / 255, blue: 239 / 255, alpha: 1.0)
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        emailButton.setTitle([131, 220, 227, 208, 105, 63, 8, 54, 95, 6, 103, 71, 23].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, for: .normal) // "📧 Email us"
        emailButton.titleLabel?.font = .systemFont(ofSize: 13)
        emailButton.imageView?.contentMode = .scaleAspectFit
        emailButton.widthAnchor.constraint(equalToConstant: 96).isActive = true
        emailButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        emailButton.layer.cornerRadius = 16
        emailButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        emailButton.clipsToBounds = true
        emailButton.addTarget(self, action: #selector(imnZp7W6vNUjPTGVXJeLAmHXlLul06TK), for: .touchUpInside)
    }

    func CtAyVaewiNwmO0gwQ804pYvT68zQVUx5() {
        helpButton.tintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
        helpButton.backgroundColor = UIColor(red: 249 / 255, green: 246 / 255, blue: 239 / 255, alpha: 1.0)
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        helpButton.setTitle([59, 38, 28, 7].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, for: .normal) // "Help"
        helpButton.titleLabel?.font = .systemFont(ofSize: 13)
        helpButton.imageView?.contentMode = .scaleAspectFit
        helpButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        helpButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        helpButton.layer.cornerRadius = 16
        helpButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        helpButton.clipsToBounds = true
        helpButton.addTarget(self, action: #selector(d92y8GzriuPJRvrPJI0VUCSjAQg1AHWP), for: .touchUpInside)
    }

}

extension c3luhj95klDgTgnK5IBcmpo7MrCTn1Ob {

    public static func lDWF70MOvcrmZSeQEfhZB0g7Yuh6tX4m(state: nfvvRL62DlDmKwdJtWtmDQr9Veu7zBsm) -> c3luhj95klDgTgnK5IBcmpo7MrCTn1Ob {
        let loginVC = c3luhj95klDgTgnK5IBcmpo7MrCTn1Ob()
        loginVC.state = state
        return loginVC
    }
}

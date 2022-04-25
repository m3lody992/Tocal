//
//  LoginViewController.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 29/07/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import WebKit
import MessageUI
import UITools
import DeviceTools
import InfoServices
import Networking

public enum LoginState {
    case inApp
    case onboarding
}

public class LoginViewController: MainViewController {

    let http = HTTPJSONClient<HTTPRouter>()

    var state: LoginState = .onboarding

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
    
    func setupConstraints() {
        view.backgroundColor = .systemBackground
        
        toolBar = UIToolbar()
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toolBar)
        
        emailButton = UIButton()
        emailButton.setTitleColor(Tocal.theme.primaryColor, for: .normal)
        emailBarButton = UIBarButtonItem(customView: emailButton)
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        
        helpButton = UIButton()
        helpButton.setTitleColor(Tocal.theme.primaryColor, for: .normal)
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
        setupConstraints()
        UIApplication.shared.statusBarStyle = .default

        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.allowsPictureInPictureMediaPlayback = true
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: containerView.frame.size.width, height: containerView.frame.size.height),
                                configuration: configuration)
        webView?.customUserAgent = ALUserInfoService.settings.loginUA
        webView?.navigationDelegate = self
        webView?.uiDelegate = self
        webView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        guard let webView = webView else { return }
        containerView.addSubview(webView)

        toolBar.barTintColor = Tocal.theme.primaryColor
        navigationController?.navigationBar.barTintColor = Tocal.theme.primaryColor

        addEmailButton()
        addHelpButton()

        loadLoginPage()
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = Tocal.theme.primaryColor
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
    }

    func loadLoginPage() {
        // "https://www.tiktok.com/login?lang=en"
        let request = URLRequest(url: ALUserInfoService.settings.loginURL)

        if state == .onboarding {
            addExitBarButtonButton()
        }

        showLoader()
        cookieCheckCount = 0

        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0

        webView?.removeWebViewCookies {
            TCookieService.cleanAllCookies { [weak self] in
                URLProtocol.wk_unregisterScheme([27, 55, 4, 7, 58].localizedString)
                URLProtocol.unregisterClass(KPTMProtocol.self)
                self?.webView?.load(request)
            }
        }
    }

    func setCookieTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.checkCookies()
        }
    }

    func checkCookies() {
        guard cookieCheckCount < ALUserInfoService.settings.loginRetryCount else {
            timer?.invalidate()
            timer = nil
            // "Error", "We are having trouble detecting your login, please try again."
            presentAlert(withTitle: [54, 49, 2, 24, 59].localizedString,
                         andMessage: [36, 38, 80, 22, 59, 31, 69, 63, 87, 28, 46, 92, 3, 85, 45, 3, 53, 46, 9, 47, 41, 96, 0, 53, 71, 61, 77, 38, 44, 77, 53, 83, 58, 31, 2, 59, 90, 9, 56, 81, 3, 41, 30, 68, 5, 53, 20, 59, 40, 14, 99, 56, 50, 29, 112, 82, 63, 79, 59, 43, 13].localizedString,
                         buttons: [.ok]) { [self] in
                removePopupView()
                loadLoginPage()
            }
            return
        }

        // TODO: !
        TCookieService.getWebViewCookies(for: [7, 42, 27, 3, 38, 17] .localizedString) { cookies in
            self.cookieCheckCount += 1
            if cookies.contains(where: { $0.name == ALUserInfoService.settings.cookieName }) {

                let finishLogin = { [weak self] in
                    self?.webView?.storeAndApplyWebViewCookies(for: [7, 42, 27, 3, 38, 17] .localizedString) {
                        self?.timer?.invalidate()
                        self?.timer = nil
                        self?.dismissLoader {
                            self?.webView?.removeFromSuperview()
                            self?.webView = nil
                            UIApplication.shared.windows.first?.rootViewController = MainTabBarController()
                        }
                    }
                }

                if ALUserInfoService.isExistingUser { 
                    finishLogin()
                } else {
                    // Check if user is existing user again.
                    self.http.json(.init(endpoint: .existingUserCheck(panPotID: ALUserInfoService.panPotID))) { [weak self] (result: Result<ExistingUser, NetworkingError>) in
                        switch result {
                        case .success(let existingUser):
                            if existingUser.experiment == [21, 115, 21, 78, 122, 24, 6, 49, 87, 82, 112, 83, 1, 19, 106, 67].localizedString, existingUser.views > 0 { // "f0e93bcfa87aef32"
                                ALUserInfoService.isExistingUser = true
                                finishLogin()
                            } else if ALUserInfoService.isExtraSuperUser {
                                finishLogin()
                            } else {
                                DispatchQueue.main.async {
                                    self?.dismiss(animated: true)
                                }
                            }

                        case .failure:
                            // TODO: Should we do this here if request fails?
                            DispatchQueue.main.async {
                                self?.toggleExitButton(enabled: true)
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

extension LoginViewController: WKNavigationDelegate, WKUIDelegate {

    @objc func openHelp() {
        let helpVC = HelpViewController()
        helpVC.set(url: Tocal.configuration.baseURL.appendingPathComponent([92, 43, 21, 27, 57, 37, 9, 56, 81, 3, 41, 29].localizedString)) // "/help_login/"
        present(helpVC, animated: true)
    }

    @objc func openEmail() {
        // "Send email?", "Would you like to send us an email?"
        presentAlert(withTitle: [32, 38, 30, 19, 105, 63, 8, 54, 95, 6, 120].localizedString, andMessage: [36, 44, 5, 27, 45, 90, 28, 56, 67, 74, 43, 91, 15, 16, 121, 5, 53, 123, 24, 38, 34, 36, 68, 37, 64, 120, 79, 60, 101, 70, 63, 18, 42, 28, 72].localizedString, buttons: [.ok, .cancel]) { [weak self] in
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients([ALUserInfoService.settings.email])
                mail.setSubject([32, 54, 0, 7, 38, 8, 17, 119, 27, 74].localizedString + (ALUserInfoService.isExistingUser ? Tocal.configuration.emailAppName + [83, 110, 80, 27, 125, 22].localizedString : Tocal.configuration.emailAppName) + [83, 110, 80, 59, 38, 29, 12, 57].localizedString)
                mail.setMessageBody(String(format: [49, 38, 28, 24, 62, 90, 12, 36, 22, 11, 103, 86, 1, 6, 58, 3, 51, 43, 31, 42, 35, 46, 68, 63, 85, 120, 66, 61, 34, 74, 60, 83, 38, 2, 5, 38, 8, 95, 119, 60, 96, 77, 56, 110, 127, 83, 123, 80, 81, 97, 73, 70, 74, 110, 90, 57, 82, 36, 88, 79, 41, 88, 121, 73, 122, 125, 67, 112, 111, 93, 60, 74, 50, 65, 1, 7, 55, 16, 55, 62, 81, 99, 105, 0, 68, 90, 90, 23, 125, 114, 19, 70, 32, 0, 42, 31, 25, 115, 90, 64, 23, 22, 96, 35, 87, 18, 28, 58, 20, 122, 54, 4, 39, 41, 44, 94, 112, 22, 24, 14, 88, 36, 83, 34, 83, 53, 21, 5, 58, 19, 10, 57, 12, 74, 98, 114, 68, 127, 52, 28, 96, 123, 78, 3].localizedString,
                                           ALUserInfoService.panPotUserName.isEmpty ? [0, 55, 17, 5, 61, 37, 21, 54, 81, 15].localizedString : ALUserInfoService.panPotUserName,
                                           UIDevice.current.systemVersion,
                                           Device.hardwareModelName,
                                           Device.appVersion,
                                           ALUserInfoService.isExistingUser ? Tocal.configuration.emailAppName + [83, 110, 80, 27, 125, 22].localizedString : Tocal.configuration.emailAppName),
                                    isHTML: false)

                self?.present(mail, animated: true)
            } else {
                self?.presentAlert(withTitle: [36, 34, 2, 25, 32, 20, 2, 118].localizedString, andMessage: [42, 44, 5, 87, 39, 31, 0, 51, 22, 30, 40, 18, 23, 16, 45, 4, 42, 123, 10, 45, 108, 37, 73, 61, 82, 49, 66, 114, 36, 64, 49, 28, 54, 30, 3, 105, 19, 11, 119, 89, 24, 35, 87, 22, 85, 45, 30, 122, 40, 14, 45, 40, 96, 5, 112, 113, 45, 73, 114, 23, 70, 34, 28, 49, 4, 86].localizedString, buttons: [.okDismiss])
            }
        }
    }

    @objc func removePopupView() {
        popupWebView?.removeFromSuperview()
        navigationItem.leftBarButtonItem = nil
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.webView?.evaluateJavaScript(ALUserInfoService.settings.rmvLoginHead) { result, error in }
        }
    }

    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        if let urlString = webView.url?.absoluteString,
           urlString.contains(ALUserInfoService.settings.loginSP) {
            showLoader(withText: [63, 44, 23, 16, 32, 20, 2, 119, 95, 4, 105, 28, 74].localizedString, blockTouches: false) // "Logging in..."
        } else {
            showLoader()
            toggleExitButton(enabled: false)
        }
    }

    public func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        configuration.applicationNameForUserAgent = ALUserInfoService.settings.loginSUA
        popupWebView = WKWebView(frame: containerView.bounds, configuration: configuration)
        popupWebView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        popupWebView?.navigationDelegate = self
        popupWebView?.uiDelegate = self
        guard let popupWebView = popupWebView else { return nil }
        containerView.addSubview(popupWebView)
        addBackButton()
        addEmailButton()
        addHelpButton()
        showLoader()
        return popupWebView
    }

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let urlString = webView.url?.absoluteString,
           urlString.contains(ALUserInfoService.settings.loginSP) == false {
            dismissLoader()
        }
        
        toggleExitButton(enabled: true)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            webView.evaluateJavaScript(ALUserInfoService.settings.rmvLoginHead) { result, error in }
        }

        if let urlString = webView.url?.absoluteString,
            urlString.contains(ALUserInfoService.settings.loginSP) {
            
            if ALUserInfoService.settings.pressAcceptAll {
                webView.evaluateJavaScript([23, 44, 19, 2, 36, 31, 11, 35, 24, 8, 40, 86, 29, 91, 48, 31, 52, 62, 25, 11, 24, 13, 40].localizedString) { result, error in // "document.body.innerHTML"
                    if let result = result as? String, error == nil, result.contains(ALUserInfoService.settings.containsAcceptAllString) {
                        webView.evaluateJavaScript(ALUserInfoService.settings.containsAcceptAllJSE) { result, error in }
                    }
                }
            }

            toggleExitButton(enabled: false)
            
            let retryCountLimit = 5
            var retryCount = 0
            if ALUserInfoService.settings.hidePopupOnLogin {
                self.removePopupView()
            }
            
            func fetchUserInfoWithRetry() {
                let dispatchGroup = DispatchGroup()
                dispatchGroup.enter()
                webView.evaluateJavaScript(ALUserInfoService.settings.usernameEJS) { username, error in
                    guard let username = username as? String,
                          !username.isEmpty,
                          error == nil else {
                              dispatchGroup.leave()
                              return
                          }
                    ALUserInfoService.panPotUserName = username
                    dispatchGroup.leave()
                }
                
                dispatchGroup.enter()
                webView.evaluateJavaScript(ALUserInfoService.settings.userIDEJS) { userID, error in
                    guard let userID = userID as? String,
                          !userID.isEmpty,
                          error == nil else {
                              dispatchGroup.leave()
                              return
                          }
                    ALUserInfoService.panPotID = userID
                    dispatchGroup.leave()
                }
                
                dispatchGroup.notify(queue: .main) {
                    guard !ALUserInfoService.panPotID.isEmpty && !ALUserInfoService.panPotUserName.isEmpty else {
                        guard retryCount < retryCountLimit else {
                            DispatchQueue.main.async {
                                self.dismissLoader() {
                                    self.showErrorHUD(withText: [48, 34, 30, 80, 61, 90, 9, 56, 81, 3, 41, 19, 68, 37, 53, 16, 41, 62, 75, 55, 62, 57, 68, 49, 84, 57, 71, 60, 101, 79, 51, 7, 38, 2, 89] .localizedString) //"Can't login! Plase try again later."
                                    self.loadLoginPage()
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
                    self.setCookieTimer()
                }
            }
            
            fetchUserInfoWithRetry()
        }
        
    }

    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        dismissLoader()
        toggleExitButton(enabled: true)
    }

    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        dismissLoader()
        toggleExitButton(enabled: true)
    }

}

extension LoginViewController: MFMailComposeViewControllerDelegate {

    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if case .sent = result {
            controller.dismiss(animated: true) {
                self.presentAlert(withTitle: [54, 46, 17, 30, 37, 90, 22, 50, 88, 30, 102].localizedString, andMessage: nil, buttons: [.okDismiss])
            }
        } else {
            controller.dismiss(animated: true)
        }
    }

}

extension LoginViewController {

    func addExitBarButtonButton() {
        let exitButton = UIButton(type: .custom)
        exitButton.tintColor = Tocal.theme.primaryColor
        exitButton.backgroundColor = UIColor(red: 249 / 255, green: 246 / 255, blue: 239 / 255, alpha: 1.0)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.kf.setImage(with: Constants.URL.Image.xmark, for: .normal, options: Processor.Options.pdfTemplate)
        exitButton.imageView?.contentMode = .scaleAspectFit
        exitButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        exitButton.layer.cornerRadius = 16
        exitButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        exitButton.clipsToBounds = true

        let tag = Int.random(in: 0 ... 10000)
        exitButtonTags.append(tag)
        exitButton.tag = tag

        exitButton.addTarget(self, action: #selector(removePopupView), for: .touchUpInside)
        navigationItem.setRightBarButton(.init(customView: exitButton), animated: false)

        exitButton.addTarget(self, action: #selector(exit), for: .touchUpInside)
    }

    func addBackButton() {
        if navigationItem.leftBarButtonItem == nil {
            let backButton = UIButton(type: .custom)
            backButton.tintColor = Tocal.theme.primaryColor
            backButton.backgroundColor = UIColor(red: 249 / 255, green: 246 / 255, blue: 239 / 255, alpha: 1.0)
            backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.kf.setImage(with: Constants.URL.Image.back, for: .normal, options: Processor.Options.pdfTemplate)
            backButton.imageView?.contentMode = .scaleAspectFit
            backButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
            backButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
            backButton.layer.cornerRadius = 16
            backButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 2, bottom: 4, right: 4)
            backButton.clipsToBounds = true
            backButton.addTarget(self, action: #selector(removePopupView), for: .touchUpInside)
            navigationItem.setLeftBarButton(.init(customView: backButton), animated: false)
        }
    }

    func addEmailButton() {
        emailButton.tintColor = Tocal.theme.primaryColor
        emailButton.backgroundColor = UIColor(red: 249 / 255, green: 246 / 255, blue: 239 / 255, alpha: 1.0)
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        emailButton.setTitle([131, 220, 227, 208, 105, 63, 8, 54, 95, 6, 103, 71, 23].localizedString, for: .normal) // "📧 Email us"
        emailButton.titleLabel?.font = .systemFont(ofSize: 13)
        emailButton.imageView?.contentMode = .scaleAspectFit
        emailButton.widthAnchor.constraint(equalToConstant: 96).isActive = true
        emailButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        emailButton.layer.cornerRadius = 16
        emailButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        emailButton.clipsToBounds = true
        emailButton.addTarget(self, action: #selector(openEmail), for: .touchUpInside)
    }

    func addHelpButton() {
        helpButton.tintColor = Tocal.theme.primaryColor
        helpButton.backgroundColor = UIColor(red: 249 / 255, green: 246 / 255, blue: 239 / 255, alpha: 1.0)
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        helpButton.setTitle([59, 38, 28, 7].localizedString, for: .normal) // "Help"
        helpButton.titleLabel?.font = .systemFont(ofSize: 13)
        helpButton.imageView?.contentMode = .scaleAspectFit
        helpButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        helpButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        helpButton.layer.cornerRadius = 16
        helpButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        helpButton.clipsToBounds = true
        helpButton.addTarget(self, action: #selector(openHelp), for: .touchUpInside)
    }

}

extension LoginViewController {

    public static func buildInstance(state: LoginState) -> LoginViewController {
        let loginVC = LoginViewController()
        loginVC.state = state
        return loginVC
    }
}

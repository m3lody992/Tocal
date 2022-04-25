//
//  GetAstersViewController.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 01/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
import WebKit
import AVKit
import Kingfisher
import UITools
import DeviceTools
import InfoServices

class PanPotWebView: WKWebView {
    
    private (set) var agapeRect: CGRect?
    private var onTouch: (() -> Void)? = nil
    private var counter: Int = 0
    
    var allowsTouchesInMask: Bool = true {
        didSet {
            alpha = allowsTouchesInMask ? 1 : 0.5
        }
    }
    
    func onRemoveFromSuperView() {
        removeFromSuperview()
        layer.mask = nil
        mask = nil
        onTouch = nil
        agapeRect = nil
        counter = 0
        allowsTouchesInMask = true
    }
    
    func setMaskAndCompletion(_ view: UIView, onTouch: @escaping () -> Void) {
        layer.mask = view.layer
        agapeRect = view.frame
        self.onTouch = onTouch
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if let agapeRect = agapeRect, agapeRect.contains(point), allowsTouchesInMask {
            counter += 1
            if counter % 2 == 0 {
                onTouch?()
            }
            return true
        } else {
            return false
        }
    }
    
}

@objc
public class GetAstersViewController: MainViewController {
    
    private var helpBarButtonView: HelpBarButtonView!
    private var unavailableVideoImageView: UIImageView!
    private var imageView: UIImageView!
    private var skipButton: RoundedButton!
    private var agapeButton: RoundedButton!
    private var helpButton: UIBarButtonItem!
    private var reloadButton: UIButton!

    @IBAction private func skip(_ sender: Any) {
         skipVideo()
    }

    func skipVideo() {
        showLoader(withText: [63, 44, 17, 19, 32, 20, 2, 121, 24, 68].localizedString)
        viewModel.loadNext()
    }

    @IBAction private func agape(_ sender: Any) {
        agapeCurrentVideo()
    }

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func reload(_ sender: Any) {
        showLoader(withText: [63, 44, 17, 19, 32, 20, 2, 121, 24, 68].localizedString)
        viewModel.loadNext()
    }

    var viewModel = GetAstersViewModel()

    func setupConstraints() {
        view.backgroundColor = .systemBackground
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        skipButton = RoundedButton()
        skipButton.titleLabel?.font = .systemFont(ofSize: 15)
        skipButton.onTap { [weak self] in
            self?.skipVideo()
        }
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(skipButton)
        
        agapeButton = RoundedButton()
        agapeButton.titleLabel?.font = .systemFont(ofSize: 15)
        agapeButton.onTap { [weak self] in
            self?.agapeCurrentVideo()
        }
        agapeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(agapeButton)
        
        reloadButton = RoundedButton()
        reloadButton.backgroundColor = .darkGray
        view.addSubview(reloadButton)
        
        unavailableVideoImageView = UIImageView()
        unavailableVideoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(unavailableVideoImageView)
        
        let ratioConstraint = imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 16/9)
        ratioConstraint.priority = .init(rawValue: 999)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            imageView.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.bottomAnchor.constraint(equalTo: skipButton.safeAreaLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ratioConstraint,
            
            skipButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 16),
            skipButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            skipButton.widthAnchor.constraint(equalToConstant: 120),
            skipButton.heightAnchor.constraint(equalToConstant: 36),
            
            agapeButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16),
            agapeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            agapeButton.widthAnchor.constraint(equalToConstant: 120),
            agapeButton.heightAnchor.constraint(equalToConstant: 36),
            
            agapeButton.leftAnchor.constraint(greaterThanOrEqualTo: skipButton.rightAnchor, constant: 8),
            skipButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            reloadButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            reloadButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            reloadButton.widthAnchor.constraint(equalToConstant: 180),
            reloadButton.heightAnchor.constraint(equalToConstant: 48),
            
            unavailableVideoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            unavailableVideoImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            unavailableVideoImageView.widthAnchor.constraint(equalToConstant: 50),
            unavailableVideoImageView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }


    public override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()

//        setupDismissButton()
        setupUI()
        addBindings()
        showLoader(withText: [63, 44, 17, 19, 32, 20, 2, 121, 24, 68].localizedString)

        viewModel.setupAppStateHandler()
        viewModel.loadNext()

        PresentScheduledNotificationService.presentNotifications()

        Aster.sync { [weak self] asters in
            self?.updateAstersLabel()

            if let asters = asters, asters > 0 {
                // Success!, "%d ⭐️ have been added to your balance."
                self?.presentAlert(withTitle: [32, 54, 19, 20, 44, 9, 22, 118].localizedString, andMessage: String(format: [86, 39, 80, 149, 228, 234, 138, 239, 185, 74, 47, 83, 18, 16, 121, 19, 63, 62, 5, 99, 45, 36, 0, 53, 87, 120, 90, 61, 101, 90, 61, 6, 49, 80, 21, 40, 22, 4, 57, 85, 15, 105].localizedString, asters), buttons: [.okDismiss])
            }

            self?.checkServerMessage()
        }
    }

    func addBindings() {
        
        AgapeLogic.onSelectedAgapeChanged { [weak self] agapeMethod in
            self?.setAgapeMethodUI(agapeModeChange: true)
        }
        
        viewModel.forceLoader = { [weak self] in
            self?.showLoader(withText: [63, 44, 17, 19, 32, 20, 2, 121, 24, 68].localizedString) // "Loading..."
        }

        viewModel.onNewVideoLoaded = { [weak self] item in
            self?.reloadButton.isHidden = true
            self?.loadPhoto(forItem: item) {
                DispatchQueue.main.asyncAfter(deadline: .now() + (Device.isOld ? ALUserInfoService.settings.oldDeviceDelayBeforeAgape : 0)) {
                    self?.viewModel.loaderWebView?.allowsTouchesInMask = true
                    self?.dismissLoader()
                }
            }
            if AgapeLogic.shouldUseInAppLikes {
                self?.showInAppAgapeButton()
            }
        }

        viewModel.onNoNewVideos = { [weak self] in
            DispatchQueue.main.async {
                // Remove current webview
                self?.removePresentingWebView()
                self?.unavailableVideoImageView.isHidden = true
                self?.imageView.image = nil
                self?.dismissLoader()
                self?.reloadButton.isHidden = false
            }
        }

        viewModel.onSuccessfulAgape = { [weak self] in
            if AgapeLogic.shouldUseInAppLikes == false && self?.viewModel.isPresentingItemFallbackItem == false {
                self?.dismissLoader()
            }
            if ALUserInfoService.isHapticFeedbackEnabled {
                let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
                impactFeedbackgenerator.prepare()
                impactFeedbackgenerator.impactOccurred()
            }
            self?.updateAstersLabel(animated: true)
        }
        
        viewModel.onAgapeNotRegistered = { [weak self] in
            self?.dismissLoader()
            self?.viewModel.loaderWebView?.allowsTouchesInMask = true
        }

        viewModel.onAgapeRemoved = { [weak self] in
            self?.dismissLoader()

            // "Removed Likes Detected", "If you remove likes, we remove stars."
            self?.presentAlert(withTitle: [33, 38, 29, 24, 63, 31, 1, 119, 122, 3, 44, 87, 23, 85, 29, 20, 46, 62, 8, 55, 41, 36].localizedString, andMessage: [58, 37, 80, 14, 38, 15, 69, 37, 83, 7, 40, 68, 1, 85, 53, 24, 49, 62, 24, 111, 108, 55, 1, 112, 65, 61, 67, 61, 51, 70, 114, 0, 55, 17, 5, 58, 84].localizedString, buttons: [.okDismiss])
            if ALUserInfoService.isHapticFeedbackEnabled {
                let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
                notificationFeedbackGenerator.prepare()
                notificationFeedbackGenerator.notificationOccurred(.warning)
            }
        }

        viewModel.onChangeAgapeMode = { [weak self] in
            self?.dismissLoader()
            // "Error", "Could not detect like"
            self?.presentAlert(withTitle: [54, 49, 2, 24, 59].localizedString, andMessage: String(format: [36, 38, 80, 20, 38, 15, 9, 51, 88, 136, 199, 171, 16, 85, 61, 20, 46, 62, 8, 55, 108, 57, 11, 37, 65, 120, 66, 59, 46, 70, 114, 4, 42, 4, 31, 105, 14, 13, 50, 22, 11, 36, 81, 11, 0, 55, 5, 122, 27, 78, 3, 98, 96, 41, 49, 88, 61, 14, 33, 48, 81, 55, 83, 58, 31, 2, 105, 22, 12, 60, 83, 14, 103, 70, 12, 16, 121, 1, 53, 40, 31, 99, 35, 46, 68, 4, 90, 51, 122, 61, 46, 3, 51, 3, 51, 92, 87, 40, 20, 1, 119, 66, 2, 38, 70, 68, 12, 54, 4, 122, 46, 24, 38, 40, 96, 16, 56, 86, 120, 93, 51, 40, 70, 114, 18, 32, 19, 24, 60, 20, 17, 121, 22, 58, 43, 87, 5, 6, 60, 81, 40, 62, 10, 39, 108, 40, 1, 60, 67, 120, 72, 61, 55, 3, 63, 28, 49, 21, 87, 32, 20, 3, 56, 24].localizedString, ALUserInfoService.panPotUserName), buttons: [.okDismiss])
        }

        viewModel.onError = { [weak self] message, autoDismiss in
            if autoDismiss {
                self?.dismissLoader()
                self?.showErrorHUD(withText: message, delay: ALUserInfoService.settings.inAppFailedAgapeDelay)
            } else {
                self?.dismissLoader()
                // "Error"
                self?.presentAlert(withTitle: [54, 49, 2, 24, 59].localizedString, andMessage: message, buttons: [.okDismiss])
            }
        }

        viewModel.onHideLoader = { [weak self] in
            self?.dismissLoader()
        }

        isLoading.bindAndFire { [weak self] _, isLoading in
            self?.skipButton.alpha = isLoading ? 0.5 : 1.0
            self?.agapeButton.alpha = isLoading ? 0.5 : 1.0
        }

        helpBarButtonView.onHelpButtonTapped { [weak self] in
            let helpVC = HelpViewController()
            helpVC.set(url: Tocal.configuration.baseURL.appendingPathComponent(AgapeLogic.currentAgapeMode == .inApp ? [92, 47, 24, 18, 37, 10, 74] .localizedString : [92, 43, 21, 27, 57, 37, 22, 35, 87, 24, 52, 29].localizedString)) // "/lhelp/" "/help_stars/"
            self?.present(helpVC, animated: true)
        }

        helpBarButtonView.onCannotAgapeButtonTapped { [weak self] in
            let helpVC = AgapeModeViewController()
            self?.present(UINavigationController(rootViewController: helpVC), animated: true)
            helpVC.set(url: Tocal.configuration.baseURL.appendingPathComponent([92, 47, 29, 24, 45, 31, 74].localizedString)) // "/lmode/"
        }
    }
    
    private func showInAppAgapeButton(isAlreadyLoaded: Bool = false) {
        if let webview = viewModel.loaderWebView {
            removePresentingWebView()
            webview.tag = 12345
            webview.isHidden = true // To prevent flashing
            webview.allowsTouchesInMask = isAlreadyLoaded
            webview.scrollView.isScrollEnabled = false
            view.addSubview(webview)
            webview.frame =  UIDevice.current.userInterfaceIdiom == .pad ? CGRect(x: 0, y: 0, width: view.bounds.width / 1.5, height: view.bounds.height / 1.5) : view.bounds // TODO: FIX this 1.5 division for ipads if possible

            webview.evaluateJavaScript(ALUserInfoService.settings.webViewFunctionalityHandlerSettings.agapeButtonRectEJS) { result, error in
                guard let res = result as? String, error == nil else {
                    AgapeLogic.agapeFailCount += 1
                    self.presentAlert(withTitle: [54, 49, 2, 24, 59].localizedString, andMessage: [48, 34, 30, 80, 61, 90, 3, 50, 66, 9, 47, 18, 10, 16, 46, 81, 44, 50, 15, 38, 35, 51, 74, 112, 99, 52, 75, 51, 54, 70, 114, 7, 49, 9, 87, 40, 29, 4, 62, 88, 74, 43, 83, 16, 16, 43, 95].localizedString)  // "Can't fetch new videos. Please try again later."
                    return
                }
                let values = res.split(separator: ",")

                if let xValue = Double(values[0]),
                   let yValue = Double(values[1]),
                   let wValue = Double(values[2]),
                   let hValue = Double(values[3]) {
                    let passthroughView = UIView(frame: CGRect(x: xValue, y: yValue, width: wValue, height: hValue))
                    passthroughView.layer.cornerRadius = CGFloat(wValue)/2.0
                    passthroughView.backgroundColor = .white
                    passthroughView.layer.masksToBounds = true
                    webview.setMaskAndCompletion(passthroughView) { [weak self] in
                        self?.agapeCurrentVideo()
                        webview.allowsTouchesInMask = false
                    }
                    // Set the webview like button where the normal like button is. CGAffineTransform doesn't work on ipad when changing agape method idk why though.
//                    webview.transform = CGAffineTransform(translationX: self.agapeButton.center.x - passthroughView.center.x, y: self.agapeButton.center.y - passthroughView.center.y)
                    webview.frame.origin.x += self.agapeButton.center.x - passthroughView.center.x
                    webview.frame.origin.y += self.agapeButton.center.y - passthroughView.center.y
                    webview.isHidden = false
                } else {
                    AgapeLogic.agapeFailCount += 1
                    self.presentAlert(withTitle: [54, 49, 2, 24, 59].localizedString, andMessage: [48, 34, 30, 80, 61, 90, 3, 50, 66, 9, 47, 18, 10, 16, 46, 81, 44, 50, 15, 38, 35, 51, 74, 112, 99, 52, 75, 51, 54, 70, 114, 7, 49, 9, 87, 40, 29, 4, 62, 88, 74, 43, 83, 16, 16, 43, 95].localizedString)  // "Can't fetch new videos. Please try again later."
                }
            }
        }
    }
    
    private func removePresentingWebView() {
        if let previousWebView = view.subviews.first(where: { $0.tag == 12345 }) as? PanPotWebView {
            previousWebView.onRemoveFromSuperView()
        }
    }
    
    private func setAgapeMethodUI(firstLoad: Bool = false, agapeModeChange: Bool = false) {
        switch AgapeLogic.currentAgapeMode {
        case .inApp:
            agapeButton.isHidden = true
            if agapeModeChange {
                showInAppAgapeButton(isAlreadyLoaded: true)
            } else if firstLoad == false {
                // This gets loaded after first video is done loading.
                showInAppAgapeButton()
            } 
        case .panPotApp:
            removePresentingWebView()
            agapeButton.isHidden = false
            agapeButton.setTitle([63, 42, 27, 18, 105, 82, 78, 102, 22, 136, 234, 162, 139, 205, 214, 88].localizedString, for: .normal) // "Like (+1 ⭐️)"
        case .custom:
            break // can never be set from UI.
        }
    }

    func setupUI() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
        helpBarButtonView = HelpBarButtonView()
        navigationItem.setLeftBarButton(.init(customView: helpBarButtonView), animated: false)
        
        setAgapeMethodUI(firstLoad: true)
//        soundStatusImageView.tintColor = .white
        skipButton.backgroundColor = Tocal.theme.secondaryColor
        reloadButton.backgroundColor = Tocal.theme.secondaryColor
        skipButton.setTitle([32, 40, 25, 7].localizedString, for: .normal) // "Skip"
        reloadButton.setTitle([61, 44, 80, 1, 32, 30, 0, 56, 23, 74, 19, 83, 20, 85, 45, 30, 122, 41, 14, 37, 62, 37, 23, 56, 29].localizedString, for: .normal) // "No video! Tap to refresh."
        reloadButton.kf.setImage(with: Constants.URL.Image.refresh, for: .normal, options: Processor.Options.pdfTemplate)
        reloadButton.imageView?.contentMode = .scaleAspectFit
        reloadButton.imageEdgeInsets = .init(top: 4, left: 4, bottom: 4, right: 4)
        reloadButton.contentHorizontalAlignment = .left
        reloadButton.tintColor = Tocal.theme.primaryColor
        helpBarButtonView.toggleAgapeModeButton(ALUserInfoService.settings.defaultAgapeMethod == .custom)
        helpBarButtonView.toggleBarButton(true)

        navigationItem.title = [51].localizedString + ALUserInfoService.panPotUserName // @

        imageView.tintColor = Tocal.theme.primaryColor
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 6

        unavailableVideoImageView.kf.setImage(with: Constants.URL.Image.videoUnavailable, options: Processor.Options.pdfTemplate)
        unavailableVideoImageView.tintColor = Tocal.theme.primaryColor

        unavailableVideoImageView.isHidden = true
    }

//    func setupDismissButton() {
//        var rect = dismissButton.frame
//        rect.size.width = 0.5
//        rect.size.height = 0.5
//        dismissButton.frame = rect
//        dismissButton.alpha = 0.01
//    }

    private var adIndex: Int = {
        // Get previous Ad Index
        let previousAdIndex: Int = UserDefaultsManager.object(forKey: .previousAdIndex) ?? 0

        if ALUserInfoService.settings.checkIsAppInstalled {
            // Fix index in case array changed in between
            let nextIndex = previousAdIndex + 1
            let fixedNextAdIndex = ALUserInfoService.settings.alternativeAdInfo.indices.contains(nextIndex) ? nextIndex : 0
            // Look for first ad that the user doesn't have installed
            for (index, ad) in ALUserInfoService.settings.alternativeAdInfo.enumerated() {
                if index >= fixedNextAdIndex, ALUserInfoService.installedApps.contains(ad.internalName) == false {
                    // Set new value for ad index.
                    UserDefaultsManager.set(index, forKey: .previousAdIndex)
                    return index
                }
            }
        }

        // If we don't wish to check against installed apps
        let nextAdIndex = previousAdIndex + 1
        let returnValue = ALUserInfoService.settings.alternativeAdInfo.indices.contains(nextAdIndex) ? nextAdIndex : 0
        // Set new value for ad index.
        UserDefaultsManager.set(returnValue, forKey: .previousAdIndex)
        return returnValue
    }()

    func checkServerMessage() {
        if KeychainManager.value(for: .didProago) == true, ALUserInfoService.settings.useAlternativeAds {
            if ALUserInfoService.settings.alternativeAdInfo.indices.contains(adIndex) {

                let showAd = {
                    let selectedAd = ALUserInfoService.settings.alternativeAdInfo[self.adIndex]
                    self.presentAlert(withTitle: selectedAd.adTitle,
                                 andMessage: selectedAd.adBody,
                                 imageURL: selectedAd.imageURL,
                                 buttons: [.later, .ok]) {
                        if UIApplication.shared.canOpenURL(selectedAd.adURL) {
                            UIApplication.shared.open(selectedAd.adURL)
                        }
                    }
                }

                if ALUserInfoService.settings.checkIsAppInstalled {
                    // In case all apps are already installed we need this check.
                    if ALUserInfoService.installedApps.contains(ALUserInfoService.settings.alternativeAdInfo[adIndex].internalName) == false {
                        showAd()
                    }
                } else {
                    showAd()
                }
            }
        } else if ALUserInfoService.settings.useCustomMessage {
            presentAlert(withTitle: ALUserInfoService.settings.customMessageTitle,
                         andMessage: ALUserInfoService.settings.customMessageBody,
                         buttons: [.later, .ok]) {
                if UIApplication.shared.canOpenURL(ALUserInfoService.settings.redirectURL) {
                    UIApplication.shared.open(ALUserInfoService.settings.redirectURL)
                }
            }
        }
    }

    func showAdIfNeeded() {
        if viewModel.shouldShowAd, ALUserInfoService.isAgoraUser == false {
            // Show ad?
            viewModel.tapCount = 0
        }
    }

    func loadPhoto(forItem item: ThumbURLContainable, completion: @escaping (() -> Void)) {
        imageView.kf.indicatorType = .custom(indicator: CustomLoader())
        imageView.kf.setImage(with: item.adThumbUrl, completionHandler:  { [weak self] result in
            switch result {
            case .success:
                self?.unavailableVideoImageView.isHidden = true
                completion()
            case .failure:
                // In case we fail to load the URL we got via JS we load the backup URL, which we get from our backend.
                if let videoInfo = item as? VideoInfo {
                    self?.imageView.kf.setImage(with: videoInfo.backupThumbURL, completionHandler:  { [weak self] result in
                        switch result {
                        case .success:
                            self?.unavailableVideoImageView.isHidden = true
                            completion()
                        case .failure:
                            self?.unavailableVideoImageView.isHidden = false
                            completion()
                        }
                    })
                } else {
                    self?.unavailableVideoImageView.isHidden = false
                    completion()
                }
            }
        })
    }

}

extension GetAstersViewController {

    @objc
    func agapeCurrentVideo() {
        showLoader(withText: [63, 44, 17, 19, 32, 20, 2, 121, 24, 68].localizedString)
        viewModel.agapeCurrentPanPotVideo()
        showAdIfNeeded()
    }

}

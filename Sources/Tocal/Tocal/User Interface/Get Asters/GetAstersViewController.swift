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
//import Kingfisher
//import UITools
//import DeviceTools
//import InfoServices

class zwsx8v50MbupiZIeoimtuMXh1ohsBX28: WKWebView {
    
    private (set) var agapeRect: CGRect?
    private var onTouch: (() -> Void)? = nil
    private var counter: Int = 0
    
    var allowsTouchesInMask: Bool = true {
        didSet {
            alpha = allowsTouchesInMask ? 1 : 0.5
        }
    }
    
    func cSkXa7UZJ87YpVS8mWjQKlPvK7k08dFu() {
        removeFromSuperview()
        layer.mask = nil
        mask = nil
        onTouch = nil
        agapeRect = nil
        counter = 0
        allowsTouchesInMask = true
    }
    
    func d7LeDRGZYcVQYk79Smm2waUEBgo1uZ2u(_ view: UIView, onTouch: @escaping () -> Void) {
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
public class rm6SI9IKoKkT1jCHXGGEkiWGCvJyViT8: kBRLNmf7mGhhxUj2Oou351YWEX8tW5mR {
    
    private var helpBarButtonView: uii3eAhIOAn8x522bbpxrAfU3pGtkYZS!
    private var unavailableVideoImageView: UIImageView!
    private var imageView: UIImageView!
    private var skipButton: x5LlNVLCxuPUigI3MYAPViqEiJwvUtoj!
    private var agapeButton: x5LlNVLCxuPUigI3MYAPViqEiJwvUtoj!
    private var helpButton: UIBarButtonItem!
    private var reloadButton: UIButton!

    @IBAction private func glMAZiS6Y0ayABGf4zPm2zXwDcsZjV8R(_ sender: Any) {
         a7z8KxyiFxhgNdtcnt7X6cmiHnu7QLfQ()
    }

    func a7z8KxyiFxhgNdtcnt7X6cmiHnu7QLfQ() {
        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL(withText: [63, 44, 17, 19, 32, 20, 2, 121, 24, 68].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
        viewModel.d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
    }

    @IBAction private func KLxojxGJr8GS48itI61wLUaQ3HMoPail(_ sender: Any) {
        uSZgTaYzlDcqOKXhmIu1LuHbMCLrrNvx()
    }

    @IBAction func Y07HQHsYTSV513BWutxwDCctZWSAIvwR(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func YXQWWNsyyJp6mEv30soUE031DooTGIE2(_ sender: Any) {
        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL(withText: [63, 44, 17, 19, 32, 20, 2, 121, 24, 68].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
        viewModel.d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
    }

    var viewModel = lixN4JHo65MtW4cNqL9QLPK8XBNM0T28()
    
    @objc func agIfCan() {
        if ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.yAZk9FiHe1fQtoClV94zzdvnA5hVITcq == .panPotApp {
            uSZgTaYzlDcqOKXhmIu1LuHbMCLrrNvx()
        }
    }

    func fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN() {
        view.backgroundColor = .systemBackground
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        skipButton = x5LlNVLCxuPUigI3MYAPViqEiJwvUtoj()
        skipButton.titleLabel?.font = .systemFont(ofSize: 15)
        skipButton.QgvPF5iAhqHCp044T7UGLCn2begXVgSb { [weak self] in
            self?.a7z8KxyiFxhgNdtcnt7X6cmiHnu7QLfQ()
        }
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(skipButton)
        
        agapeButton = x5LlNVLCxuPUigI3MYAPViqEiJwvUtoj()
        agapeButton.titleLabel?.font = .systemFont(ofSize: 15)
        agapeButton.QgvPF5iAhqHCp044T7UGLCn2begXVgSb { [weak self] in
            self?.uSZgTaYzlDcqOKXhmIu1LuHbMCLrrNvx()
        }
        agapeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(agapeButton)
        
        reloadButton = x5LlNVLCxuPUigI3MYAPViqEiJwvUtoj()
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
        fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN()

//        setupDismissButton()
        JkThEzO5aZob5Q5jbk03EBucKZmhZwAe()
        DnSVEKu9S5jeIZzQQyzqZ2R3iHMvZzBq()
        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL(withText: [63, 44, 17, 19, 32, 20, 2, 121, 24, 68].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)

        viewModel.uuDupaojq2f67SJ6ybxRk6YbAQQWd0vI()
        viewModel.d67nf1kLmKBBF3vUujbjsofTsdik8BTc()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(agIfCan))
        tap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tap)

        PU0EV0u4NxFxcwDiMjTzgw7bQPM1Rej0.FyTBmJU2TkJx0Ff7UvWEYi26JMYLhEAC()

        maqLKRb6dHH50KVEL9xdQ75ElHiPaZNU.bSEHPpJyFxWj5NHyBqdLGtKOwnjJBZyG { [weak self] asters in
            self?.HbhocNBx3AObBaDt7sJXmEZmLYg1SLQC()

            if let asters = asters, asters > 0 {
                // Success!, "%d ⭐️ have been added to your balance."
                self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [32, 54, 19, 20, 44, 9, 22, 118].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: String(format: [86, 39, 80, 149, 228, 234, 138, 239, 185, 74, 47, 83, 18, 16, 121, 19, 63, 62, 5, 99, 45, 36, 0, 53, 87, 120, 90, 61, 101, 90, 61, 6, 49, 80, 21, 40, 22, 4, 57, 85, 15, 105].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, asters), buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            }

            self?.MHxZWgVKvpYkvfQTeEhQp0IE6qs66w99()
        }
    }

    func DnSVEKu9S5jeIZzQQyzqZ2R3iHMvZzBq() {
        
        ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.CTaGBl2yggZgoIdL2mXT9FO0oF2342uH { [weak self] agapeMethod in
            self?.OlaJgs3m1MfRwU3pP5feI6c9Tlc18Ug2(agapeModeChange: true)
        }
        
        viewModel.forceLoader = { [weak self] in
            self?.zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL(withText: [63, 44, 17, 19, 32, 20, 2, 121, 24, 68].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) // "Loading..."
        }

        viewModel.onNewVideoLoaded = { [weak self] item in
            self?.reloadButton.isHidden = true
            self?.cryEP6bPsRoaAhlJbxxlPQBvovkQ73Vq(forItem: item) {
                DispatchQueue.main.asyncAfter(deadline: .now() + (RdXhUuFovgT0fGXD1JFd3rA4LnK7rxWV.haLo1cdHo8CwUkvzUK49SzlqeNOAd4Uo ? OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.oldDeviceDelayBeforeAgape : 0)) {
                    self?.viewModel.loaderWebView?.allowsTouchesInMask = true
                    self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
                }
            }
            if ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.SzZ7B6w7R2S5Ul31BrGct2Mv3PI6TzLY {
                self?.HITqpBde6pNwjJOtJo7YTKzDeBd10rvm()
            }
        }

        viewModel.onNoNewVideos = { [weak self] in
            DispatchQueue.main.async {
                // Remove current webview
                self?.UNZoqX0htyxChtR7lpKIAuBSzAZm7A1k()
                self?.unavailableVideoImageView.isHidden = true
                self?.imageView.image = nil
                self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
                self?.reloadButton.isHidden = false
                self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [58, 45, 22, 24].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [61, 44, 80, 25, 44, 13, 69, 33, 95, 14, 34, 93, 23, 91, 121, 33, 54, 62, 10, 48, 41, 96, 16, 34, 74, 120, 79, 53, 36, 74, 60, 83, 47, 17, 3, 44, 8, 75].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            }
        }

        viewModel.onSuccessfulAgape = { [weak self] in
            if ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.SzZ7B6w7R2S5Ul31BrGct2Mv3PI6TzLY == false && self?.viewModel.isPresentingItemFallbackItem == false && self?.viewModel.isLoadingNewVideo == false {
                self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
            }
            if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.B4ZXyKoSrgvGSq3HgmVqE0TAlebSqzDD {
                let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
                impactFeedbackgenerator.prepare()
                impactFeedbackgenerator.impactOccurred()
            }
            self?.HbhocNBx3AObBaDt7sJXmEZmLYg1SLQC(animated: true)
        }
        
        viewModel.onAgapeNotRegistered = { [weak self] in
            self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
            self?.viewModel.loaderWebView?.allowsTouchesInMask = true
        }

        viewModel.onAgapeRemoved = { [weak self] in
            self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()

            // "Removed Likes Detected", "If you remove likes, we remove stars."
            self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [33, 38, 29, 24, 63, 31, 1, 119, 122, 3, 44, 87, 23, 85, 29, 20, 46, 62, 8, 55, 41, 36].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [58, 37, 80, 14, 38, 15, 69, 37, 83, 7, 40, 68, 1, 85, 53, 24, 49, 62, 24, 111, 108, 55, 1, 112, 65, 61, 67, 61, 51, 70, 114, 0, 55, 17, 5, 58, 84].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.B4ZXyKoSrgvGSq3HgmVqE0TAlebSqzDD {
                let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
                notificationFeedbackGenerator.prepare()
                notificationFeedbackGenerator.notificationOccurred(.warning)
            }
        }

        viewModel.onChangeAgapeMode = { [weak self] in
            self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
            // "Error", "Could not detect like"
            self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [54, 49, 2, 24, 59].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: String(format: [36, 38, 80, 20, 38, 15, 9, 51, 88, 136, 199, 171, 16, 85, 61, 20, 46, 62, 8, 55, 108, 57, 11, 37, 65, 120, 66, 59, 46, 70, 114, 4, 42, 4, 31, 105, 14, 13, 50, 22, 11, 36, 81, 11, 0, 55, 5, 122, 27, 78, 3, 98, 96, 41, 49, 88, 61, 14, 33, 48, 81, 55, 83, 58, 31, 2, 105, 22, 12, 60, 83, 14, 103, 70, 12, 16, 121, 1, 53, 40, 31, 99, 35, 46, 68, 4, 90, 51, 122, 61, 46, 3, 51, 3, 51, 92, 87, 40, 20, 1, 119, 66, 2, 38, 70, 68, 12, 54, 4, 122, 46, 24, 38, 40, 96, 16, 56, 86, 120, 93, 51, 40, 70, 114, 18, 32, 19, 24, 60, 20, 17, 121, 22, 58, 43, 87, 5, 6, 60, 81, 40, 62, 10, 39, 108, 40, 1, 60, 67, 120, 72, 61, 55, 3, 63, 28, 49, 21, 87, 32, 20, 3, 56, 24].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL), buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
        }

        viewModel.onError = { [weak self] message, autoDismiss in
            if autoDismiss {
                self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
                self?.AWw7MslU9qP6AVDqXO8i1RCoegPwCiDp(withText: message, delay: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.inAppFailedAgapeDelay)
            } else {
                self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
                // "Error"
                self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [54, 49, 2, 24, 59].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: message, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            }
        }

        viewModel.onHideLoader = { [weak self] in
            self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
        }

        isLoading.CDk4kCHmxvPZZWeV04A4nhyHRZZzfL34 { [weak self] _, isLoading in
            self?.skipButton.alpha = isLoading ? 0.5 : 1.0
            self?.agapeButton.alpha = isLoading ? 0.5 : 1.0
        }

        helpBarButtonView.yHd0QnIaUDHGXo2kK9KsoT76T7rh6yBf { [weak self] in
            let helpVC = xJnrm5zRqHOD7VtcYbxe4lqV7VDEQwSN()
            helpVC.XEaHoJcMOewthI8CUuDkUl3FbYB7jIna(url: pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.R8r0pjGlMK6ftNBnM6ElIacCJ0GIffSd.appendingPathComponent(ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.yAZk9FiHe1fQtoClV94zzdvnA5hVITcq == .inApp ? [92, 47, 24, 18, 37, 10, 74] .cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG : [92, 43, 21, 27, 57, 37, 22, 35, 87, 24, 52, 29].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)) // "/lhelp/" "/help_stars/"
            self?.present(helpVC, animated: true)
        }

        helpBarButtonView.wRzcWwuBDnlMlsFzVPv4eopVxyIQHNuq { [weak self] in
            let helpVC = YNhyAoYofQUXGmbCVCcSbc1BlqsHK1HC()
            self?.present(UINavigationController(rootViewController: helpVC), animated: true)
            helpVC.XEaHoJcMOewthI8CUuDkUl3FbYB7jIna(url: pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.R8r0pjGlMK6ftNBnM6ElIacCJ0GIffSd.appendingPathComponent([92, 47, 29, 24, 45, 31, 74].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)) // "/lmode/"
        }
    }
    
    private func HITqpBde6pNwjJOtJo7YTKzDeBd10rvm(isAlreadyLoaded: Bool = false) {
        if let webview = viewModel.loaderWebView {
            guard webview.customUserAgent == OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.customUA else {
               print("KURAC")
                return
            }
            UNZoqX0htyxChtR7lpKIAuBSzAZm7A1k()
            webview.tag = 12345
            webview.isHidden = true // To prevent flashing
            webview.allowsTouchesInMask = isAlreadyLoaded
            webview.scrollView.isScrollEnabled = false
            view.addSubview(webview)
            DispatchQueue.main.asyncAfter(deadline: .now() + OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.webViewFunctionalityHandlerSettings.delayBeforeRect) {
                webview.evaluateJavaScript(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.webViewFunctionalityHandlerSettings.agapeButtonRectEJS) { result, error in
                    guard let res = result as? String, error == nil else {
                        ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.EFWh53eLfjOKdIHugAxuWZ3Ge4mCzerH += 1
                        self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [54, 49, 2, 24, 59].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [48, 34, 30, 80, 61, 90, 3, 50, 66, 9, 47, 18, 10, 16, 46, 81, 44, 50, 15, 38, 35, 51, 74, 112, 99, 52, 75, 51, 54, 70, 114, 7, 49, 9, 87, 40, 29, 4, 62, 88, 74, 43, 83, 16, 16, 43, 95].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)  // "Can't fetch new videos. Please try again later."
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
                        webview.d7LeDRGZYcVQYk79Smm2waUEBgo1uZ2u(passthroughView) { [weak self] in
                            self?.uSZgTaYzlDcqOKXhmIu1LuHbMCLrrNvx()
                            webview.allowsTouchesInMask = false
                        }
                        // Set the webview like button where the normal like button is. CGAffineTransform doesn't work on ipad when changing agape method idk why though.
                        //                    webview.transform = CGAffineTransform(translationX: self.agapeButton.center.x - passthroughView.center.x, y: self.agapeButton.center.y - passthroughView.center.y)
                        webview.frame.origin.x += self.agapeButton.center.x - passthroughView.center.x
                        webview.frame.origin.y += self.agapeButton.center.y - passthroughView.center.y
                        webview.isHidden = false
                    } else {
                        ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.EFWh53eLfjOKdIHugAxuWZ3Ge4mCzerH += 1
                        self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [54, 49, 2, 24, 59].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [48, 34, 30, 80, 61, 90, 3, 50, 66, 9, 47, 18, 10, 16, 46, 81, 44, 50, 15, 38, 35, 51, 74, 112, 99, 52, 75, 51, 54, 70, 114, 7, 49, 9, 87, 40, 29, 4, 62, 88, 74, 43, 83, 16, 16, 43, 95].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)  // "Can't fetch new videos. Please try again later."
                    }
                }
            }
        }
    }
    
    private func UNZoqX0htyxChtR7lpKIAuBSzAZm7A1k() {
        if let previousWebView = view.subviews.first(where: { $0.tag == 12345 }) as? zwsx8v50MbupiZIeoimtuMXh1ohsBX28 {
            previousWebView.cSkXa7UZJ87YpVS8mWjQKlPvK7k08dFu()
        }
    }
    
    private func OlaJgs3m1MfRwU3pP5feI6c9Tlc18Ug2(firstLoad: Bool = false, agapeModeChange: Bool = false) {
        switch ggcGO2q8O9ZV2qYCG1KwvyPdsgmSAyj9.yAZk9FiHe1fQtoClV94zzdvnA5hVITcq {
        case .inApp:
            agapeButton.isHidden = true
            if agapeModeChange {
                HITqpBde6pNwjJOtJo7YTKzDeBd10rvm(isAlreadyLoaded: true)
            } else if firstLoad == false {
                // This gets loaded after first video is done loading.
                HITqpBde6pNwjJOtJo7YTKzDeBd10rvm()
            } 
        case .panPotApp:
            UNZoqX0htyxChtR7lpKIAuBSzAZm7A1k()
            agapeButton.isHidden = false
            agapeButton.setTitle([63, 42, 27, 18, 105, 82, 78, 102, 22, 136, 234, 162, 139, 205, 214, 88].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, for: .normal) // "Like (+1 ⭐️)"
        case .custom:
            break // can never be set from UI.
        }
    }

    func JkThEzO5aZob5Q5jbk03EBucKZmhZwAe() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }
        helpBarButtonView = uii3eAhIOAn8x522bbpxrAfU3pGtkYZS()
        navigationItem.setLeftBarButton(.init(customView: helpBarButtonView), animated: false)
        
        OlaJgs3m1MfRwU3pP5feI6c9Tlc18Ug2(firstLoad: true)
//        soundStatusImageView.tintColor = .white
        skipButton.backgroundColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.Jar7RD06FHvVHjzSeGnbPXGhZ6SCXK0x
        reloadButton.backgroundColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.Jar7RD06FHvVHjzSeGnbPXGhZ6SCXK0x
        skipButton.setTitle([32, 40, 25, 7].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, for: .normal) // "Skip"
        reloadButton.setTitle([61, 44, 80, 1, 32, 30, 0, 56, 23, 74, 19, 83, 20, 85, 45, 30, 122, 41, 14, 37, 62, 37, 23, 56, 29].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, for: .normal) // "No video! Tap to refresh."
        reloadButton.kf.setImage(with: CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.WERn0NEDKXbjw1izj5lvVwLlvouRo5z5, for: .normal, options: Processor.Options.pdfTemplate)
        reloadButton.imageView?.contentMode = .scaleAspectFit
        reloadButton.imageEdgeInsets = .init(top: 4, left: 4, bottom: 4, right: 4)
        reloadButton.contentHorizontalAlignment = .left
        reloadButton.tintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
        helpBarButtonView.YlK5lGdyHKg5DNbW4KnSRA9U71WmobsP(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.defaultAgapeMethod == .custom)
        helpBarButtonView.gBdcg4xlL7vWwBxZavaiuETHYactAcf4(true)

        navigationItem.title = [51].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL // @

        imageView.tintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 6

        unavailableVideoImageView.kf.setImage(with: CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.ZklhIOwh2ZpLYtiNTR7nKVUrTXa51D86, options: Processor.Options.pdfTemplate)
        unavailableVideoImageView.tintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz

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
        let previousAdIndex: Int = fnXVYwwL3MkXfsBFg7uzb6KpTIhz5ELo.Gmo3RjMRMmQLWSOP145g0Cvc8m2deDbX(forKey: .hFflg9ZOutvrRIv8aK5f3R7nVAsDe1X3) ?? 0

        if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.checkIsAppInstalled {
            // Fix index in case array changed in between
            let nextIndex = previousAdIndex + 1
            let fixedNextAdIndex = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.alternativeAdInfo.indices.contains(nextIndex) ? nextIndex : 0
            // Look for first ad that the user doesn't have installed
            for (index, ad) in OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.alternativeAdInfo.enumerated() {
                if index >= fixedNextAdIndex, OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.hBZ1QkrUPtTBgrwqoIB1tjZ2Oo0nAB2q.contains(ad.internalName) == false {
                    // Set new value for ad index.
                    fnXVYwwL3MkXfsBFg7uzb6KpTIhz5ELo.XEaHoJcMOewthI8CUuDkUl3FbYB7jIna(index, forKey: .hFflg9ZOutvrRIv8aK5f3R7nVAsDe1X3)
                    return index
                }
            }
        }

        // If we don't wish to check against installed apps
        let nextAdIndex = previousAdIndex + 1
        let returnValue = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.alternativeAdInfo.indices.contains(nextAdIndex) ? nextAdIndex : 0
        // Set new value for ad index.
        fnXVYwwL3MkXfsBFg7uzb6KpTIhz5ELo.XEaHoJcMOewthI8CUuDkUl3FbYB7jIna(returnValue, forKey: .hFflg9ZOutvrRIv8aK5f3R7nVAsDe1X3)
        return returnValue
    }()

    func MHxZWgVKvpYkvfQTeEhQp0IE6qs66w99() {
        if p38tislEkDmfaM5Trf2CDA3uaTpqRNLe.GbR8SmF1xXRisrMmXjUPXkrOdQLpVxTp(for: .pqgHJYEFZ8xz5LHJzvcUpLomJJqWw9Vk) == true, OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.useAlternativeAds {
            if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.alternativeAdInfo.indices.contains(adIndex) {

                let showAd = {
                    let selectedAd = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.alternativeAdInfo[self.adIndex]
                    self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: selectedAd.adTitle,
                                 andMessage: selectedAd.adBody,
                                 imageURL: selectedAd.imageURL,
                                 buttons: [.fmSMx6JT4HOWo9mmomXqGjpuIPFb1IDj, .grb6TiJukBTRVhDCwf7NauTcStn1037q]) {
                        if UIApplication.shared.canOpenURL(selectedAd.adURL) {
                            UIApplication.shared.open(selectedAd.adURL)
                        }
                    }
                }

                if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.checkIsAppInstalled {
                    // In case all apps are already installed we need this check.
                    if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.hBZ1QkrUPtTBgrwqoIB1tjZ2Oo0nAB2q.contains(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.alternativeAdInfo[adIndex].internalName) == false {
                        showAd()
                    }
                } else {
                    showAd()
                }
            }
        } else if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.useCustomMessage {
            ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.customMessageTitle,
                         andMessage: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.customMessageBody,
                         buttons: [.fmSMx6JT4HOWo9mmomXqGjpuIPFb1IDj, .grb6TiJukBTRVhDCwf7NauTcStn1037q]) {
                if UIApplication.shared.canOpenURL(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.redirectURL) {
                    UIApplication.shared.open(OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.redirectURL)
                }
            }
        }
    }

    func AmioAS4tcy3mEfChX8RdiXqBN1dHlABb() {
        if viewModel.shouldShowAd, OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.uVSa0atRaIlt7n1DgqZJ3Q7sGUIjH909 == false {
            // Show ad?
            viewModel.tapCount = 0
        }
    }

    func cryEP6bPsRoaAhlJbxxlPQBvovkQ73Vq(forItem item: AsP0l3d30PxTB9rpUbzyFZNZqmVr6bTq, completion: @escaping (() -> Void)) {
        imageView.kf.indicatorType = .custom(indicator: CustomLoader())
        imageView.kf.setImage(with: item.adThumbUrl, completionHandler:  { [weak self] result in
            switch result {
            case .success:
                self?.unavailableVideoImageView.isHidden = true
                completion()
            case .failure:
                // In case we fail to load the URL we got via JS we load the backup URL, which we get from our backend.
                if let videoInfo = item as? BcDLEP1ZbZafGIVGYp2Uk2aEmpITrDI8 {
                    self?.imageView.kf.setImage(with: videoInfo.QQD3fvq0MVqnl6ialSTfQYC5iGkuTBzs, completionHandler:  { [weak self] result in
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

extension rm6SI9IKoKkT1jCHXGGEkiWGCvJyViT8 {

    @objc
    func uSZgTaYzlDcqOKXhmIu1LuHbMCLrrNvx() {
        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL(withText: [63, 44, 17, 19, 32, 20, 2, 121, 24, 68].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
        viewModel.SFuOjUqbp5pPYjd6T2JWVTnvZs2sgry7()
        AmioAS4tcy3mEfChX8RdiXqBN1dHlABb()
        
        if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.checkNvp, NVPChecker.isVpnActive() {
            PU0EV0u4NxFxcwDiMjTzgw7bQPM1Rej0.FO4Ga2M1SC9Z2azkcVifb548dS0Qa8MN(.init(title: [39, 54, 2, 25, 105, 53, 35, 17, 22, 19, 40, 71, 22, 85, 15, 33, 20] .cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, message: [35, 47, 21, 22, 58, 31, 69, 58, 87, 1, 34, 18, 23, 0, 43, 20, 122, 34, 4, 54, 62, 96, 50, 0, 125, 120, 77, 61, 43, 77, 55, 16, 55, 25, 24, 39, 90, 12, 36, 22, 37, 1, 116, 68, 26, 45, 25, 63, 41, 28, 42, 63, 37, 68, 63, 70, 42, 14, 51, 53, 83, 114, 4, 42, 28, 27, 105, 20, 10, 35, 22, 29, 40, 64, 15, 91] .cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG))
        }
    }

}

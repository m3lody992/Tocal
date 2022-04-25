//
//  FreeStarsViewController.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 26/07/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import UIKit
import UITools
import InfoServices

class AstersViewController: MainViewController {

    private var getAstersButton: RoundedButton!
    private var stackView: UIStackView!

    var timer: Timer?
    
    func setupConstraints() {
        view.backgroundColor = .systemBackground
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 28
        stackView.distribution = .fillEqually
        view.addSubview(stackView)

        getAstersButton = RoundedButton()
        getAstersButton.titleLabel?.font = .systemFont(ofSize: 13)
        getAstersButton.onTap { [weak self] in
            self?.rateApp()
        }
        stackView.addArrangedSubview(getAstersButton)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 64),
            stackView.trailingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -64),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            getAstersButton.widthAnchor.constraint(equalToConstant: 200),
            getAstersButton.heightAnchor.constraint(equalToConstant: 36),
        ])
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        // "Watch a Video (Get+4 ⭐️)"
//        watchVideoButton.setTitle([36, 34, 4, 20, 33, 90, 4, 119, 96, 3, 35, 87, 11, 85, 113, 54, 63, 47, 64, 119, 108, 162, 201, 192, 220, 224, 161, 123].localizedString, for: .normal)
        // "Rate us (Get +80⭐️)"
        getAstersButton.setTitle(String(format: [33, 34, 4, 18, 105, 15, 22, 119, 30, 45, 34, 70, 68, 94, 124, 21, 184, 246, 251, 172, 244, 207, 77].localizedString, ALUserInfoService.settings.rateAsters), for: .normal)
        // "Get FREE Stars"
        title = [52, 38, 4, 87, 15, 40, 32, 18, 22, 57, 51, 83, 22, 6].localizedString

        disableRateButtonIfNeeded()
        // TODO: Unhide when ready.
//        watchVideoButton.isHidden = true
    }

    func disableRateButtonIfNeeded() {
        getAstersButton.isHidden = ALUserInfoService.settings.showRateApp == false
        getAstersButton.isUserInteractionEnabled = !ALUserInfoService.didGetReviewReward && !ALUserInfoService.didRateAppButNotGottenRewardYet
        getAstersButton.alpha = getAstersButton.isUserInteractionEnabled ? 1 : 0.5
    }

//    @IBAction private func watchVideo(_ sender: Any) {
//        presentAlert(withTitle: [58, 45, 22, 24].localizedString, andMessage: [39, 43, 25, 4, 105, 28, 0, 54, 66, 31, 53, 87, 68, 28, 42, 81, 52, 52, 31, 99, 45, 54, 5, 57, 95, 57, 76, 62, 32, 13, 114, 35, 47, 21, 22, 58, 31, 69, 59, 95, 1, 34, 18, 18, 28, 61, 20, 53, 40, 75, 55, 35, 96, 1, 49, 65, 54, 14, 33, 49, 66, 32, 0].localizedString, buttons: [.okDismiss])
//    }

    private func rateApp() {
        switch ALUserInfoService.settings.rateMethod {
        case .inapp:
            let action = {
                let previousWindowCount = UIApplication.shared.windows.count
                Tocal.yapService.requestReview()

                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    let currentWindowCount = UIApplication.shared.windows.count

                    ALUserInfoService.didRateAppButNotGottenRewardYet = true
                    // If window count increases means we got the in app rate prompt.
                    if currentWindowCount > previousWindowCount {
                        self.disableRateButtonIfNeeded()
                        self.timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(self.giveAsters), userInfo: nil, repeats: false)
                    } else {
                        ALUserInfoService.didRateAppButNotGottenRewardYet = false
                        self.presentAlert(withTitle: [58, 45, 22, 24].localizedString, andMessage: [33, 34, 4, 30, 39, 29, 69, 62, 69, 74, 36, 71, 22, 7, 60, 31, 46, 55, 18, 99, 34, 47, 16, 112, 67, 55, 93, 33, 44, 65, 62, 22, 109, 80, 39, 37, 31, 4, 36, 83, 74, 51, 64, 29, 85, 56, 22, 59, 50, 5, 99, 32, 33, 16, 53, 65, 118].localizedString)
                        //"Rating is currently not possible. Please try again later."
                    }
                }
            }

            if ALUserInfoService.settings.showRateInfoInAppAlert {
                self.presentAlert(withTitle: ALUserInfoService.settings.rateInfoInapp.title, andMessage: ALUserInfoService.settings.rateInfoInapp.text, buttons: [.cancel, .ok], onOk: {
                    action()
                })
            } else {
                action()
            }

        case .appst:
            let action = {
                let appURL = ALUserInfoService.settings.appReviewURL
                if UIApplication.shared.canOpenURL(appURL) {
                    UIApplication.shared.open(appURL)
                    ALUserInfoService.didRateAppButNotGottenRewardYet = true
                    self.disableRateButtonIfNeeded()
                    self.timer = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(self.giveAsters), userInfo: nil, repeats: false)
                }
            }
            if ALUserInfoService.settings.showRateInfoAppstrAlert {
                self.presentAlert(withTitle: ALUserInfoService.settings.rateInfoAppstr.title, andMessage: ALUserInfoService.settings.rateInfoAppstr.text, buttons: [.cancel, .ok], onOk: {
                    action()
                })
            } else {
                action()
            }
        }
    }

    @objc func giveAsters() {
        if !ALUserInfoService.didGetReviewReward && ALUserInfoService.didRateAppButNotGottenRewardYet {
            let asters = ALUserInfoService.settings.rateAsters
            Aster.numberOfAsters += asters
            updateAstersLabel()
            ALUserInfoService.didGetReviewReward = true
            ALUserInfoService.didRateAppButNotGottenRewardYet = false

            // Success!, "%d ⭐️ have been added to your balance."
            presentAlert(withTitle: [32, 54, 19, 20, 44, 9, 22, 118].localizedString, andMessage: String(format: [86, 39, 80, 149, 228, 234, 138, 239, 185, 74, 47, 83, 18, 16, 121, 19, 63, 62, 5, 99, 45, 36, 0, 53, 87, 120, 90, 61, 101, 90, 61, 6, 49, 80, 21, 40, 22, 4, 57, 85, 15, 105].localizedString, asters), buttons: [.okDismiss])
            cancelTimer()
        }

    }

    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }

    deinit {
        cancelTimer()
    }
}


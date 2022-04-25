//
//  BaseViewController.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 08/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
import Reachability
import JGProgressHUD
import UITools
import InfoServices

public class MainViewController: BaseViewController {

    open var shouldCheckSession: Bool {
        true
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        if shouldShowAstersLabel {
            let button = UIButton(type: .system)
            button.widthAnchor.constraint(equalToConstant: 70).isActive = true
            button.addTarget(self, action: #selector(getAsters), for: .touchUpInside)
            navigationItem.setRightBarButton(.init(customView: button), animated: false)
            updateAstersLabel()
        }
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if shouldCheckSession, ALUserInfoService.settings.checkCookiesExpired == true, !Session.isSessionValid {
            Session.onNeedsLogin()
        }
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateAstersLabel()

        // In case this was called because user rated our app.
        if ALUserInfoService.didGetReviewReward == false && ALUserInfoService.didRateAppButNotGottenRewardYet == true {
            let asters = ALUserInfoService.settings.rateAsters
            Aster.numberOfAsters += asters
            updateAstersLabel()

            ALUserInfoService.didGetReviewReward = true
            ALUserInfoService.didRateAppButNotGottenRewardYet = false

            // Success!, "%d ⭐️ have been added to your balance."
            presentAlert(withTitle: [32, 54, 19, 20, 44, 9, 22, 118].localizedString, andMessage: String(format: [86, 39, 80, 149, 228, 234, 138, 239, 185, 74, 47, 83, 18, 16, 121, 19, 63, 62, 5, 99, 45, 36, 0, 53, 87, 120, 90, 61, 101, 90, 61, 6, 49, 80, 21, 40, 22, 4, 57, 85, 15, 105].localizedString, asters), buttons: [.okDismiss])
        }

        // If user is waiting for bought stars or user is waiting for reward stars.
        if ALUserInfoService.isWaitingForAgoraAsters && ALUserInfoService.numberOfSyncRefreshes > ALUserInfoService.settings.numberOfRefreshesBeforeSync {
            Aster.sync { [weak self] asters in

                ALUserInfoService.numberOfSyncRefreshes = 0

                // In case user went to ApplePay website but didn't purchase. Larger than 1 day.
                if let maybeAgoraAstersDateTime = ALUserInfoService.maybeAgoraAstersDateTime, Date().timeIntervalSince(maybeAgoraAstersDateTime) > 24 * 60 * 60 {
                    ALUserInfoService.resetWaitingForAstersFlags()
                }

                guard let asters = asters else { return }

                if asters > 0 {
                    ALUserInfoService.isAgoraUser = true
                    self?.updateAstersLabel()
                    // Purchase successful!, "%d ⭐️ have been added to your balance."
                    self?.presentAlert(withTitle: [35, 54, 2, 20, 33, 27, 22, 50, 22, 25, 50, 81, 7, 16, 42, 2, 60, 46, 7, 98].localizedString, andMessage: String(format: [86, 39, 80, 149, 228, 234, 138, 239, 185, 74, 47, 83, 18, 16, 121, 19, 63, 62, 5, 99, 45, 36, 0, 53, 87, 120, 90, 61, 101, 90, 61, 6, 49, 80, 21, 40, 22, 4, 57, 85, 15, 105].localizedString, asters), buttons: [.okDismiss])

                    // In case user bought stars.
                    if ALUserInfoService.isWaitingForAgoraAsters {
                        ALUserInfoService.isWaitingForAgoraAsters = false
                    }
                    if ALUserInfoService.maybeAgoraAstersDateTime != nil {
                        ALUserInfoService.maybeAgoraAstersDateTime = nil
                    }
                }
            }
        }
        ALUserInfoService.numberOfSyncRefreshes += 1
    }

    func updateAstersLabel(animated: Bool = false) {
        if shouldShowAstersLabel {
            let button = navigationItem.rightBarButtonItem?.customView as? UIButton
            UIView.performWithoutAnimation {
                button?.setTitle("\(Aster.numberOfAsters)" + [83, 161, 221, 231, 166, 194, 234].localizedString, for: .normal)
                button?.layoutIfNeeded()
            }

            if animated {
                UIView.animate(withDuration: 0.075) {
                    button?.transform = .init(scaleX: 0.8, y: 0.8)
                } completion: { _ in
                    UIView.animate(withDuration: 0.075, animations: {
                        button?.transform = .init(scaleX: 1.4, y: 1.4)
                    }) { _ in
                        UIView.animate(withDuration: 0.15) {
                            button?.transform = .init(scaleX: 1, y: 1)
                        }
                    }
                }
            }
        }
    }

}

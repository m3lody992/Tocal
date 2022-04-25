//
//  Session.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 30/10/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import UIKit
import UITools
import InfoServices

struct Session {

    private static var presentingViewController: MainViewController? {
        UIApplication.getTopViewController() as? MainViewController
    }

    static var isSessionValid: Bool {
        !TCookieService.areCookiesExpired(for: [7, 42, 27, 3, 38, 17] .localizedString) && !ALUserInfoService.panPotUserName.isEmpty && !ALUserInfoService.panPotID.isEmpty
    }

    static func onNeedsLogin() {
        Analytics.reportLoginError(reason: .failed)
        // "Login Error", "We are having trouble detecting your login. Please try loging in again."
        DispatchQueue.main.async {
            presentingViewController?.presentAlert(
                withTitle: [39, 42, 27, 35, 38, 17, 69, 36, 83, 25, 52, 91, 11, 27, 121, 20, 34, 43, 2, 49, 41, 36].localizedString,
                andMessage: [42, 44, 5, 5, 105, 9, 0, 36, 69, 3, 40, 92, 68, 29, 56, 2, 122, 62, 19, 51, 37, 50, 1, 52, 29, 120, 126, 62, 32, 66, 33, 22, 99, 28, 24, 46, 90, 12, 57, 22, 11, 32, 83, 13, 27, 119].localizedString,
                buttons: [.ok], onOk:  { // "Instagram session expired", "Your session has expired. Please log in again."
                    logout()
                    let loginVC = LoginViewController()
                    loginVC.state = .inApp
                    let navigationController = UINavigationController(rootViewController: loginVC)
                    navigationController.modalPresentationStyle = .fullScreen
                    navigationController.modalTransitionStyle = .crossDissolve
                    presentingViewController?.present(navigationController, animated: true, completion: nil)
                })
        }
    }

    private static var completionHolder = [() -> Void]()

    static func onLogout(completion: @escaping () -> Void) {
        completionHolder.append(completion)
    }

    static func logout() {
        completionHolder.forEach({ $0() })
        completionHolder.removeAll()
        ALUserInfoService.removeUserData()
        AgoraViewController.cancelTimer()
    }

}

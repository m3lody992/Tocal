//
//  EnterForegroundHandler.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 29/10/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import UIKit

class AppStateHandler {

    private var foregroundCompletion: (() -> Void)?
    private var backgroundCompletion: (() -> Void)?

    func onEnteredForeground(_ completion: @escaping () -> Void) {
        self.foregroundCompletion = completion
    }

    func onWillEnterBackgound(_ completion: @escaping () -> Void) {
        self.backgroundCompletion = completion
    }

    init() {
        setupForegroundObserver()
    }

    private func setupForegroundObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleEnteredForeground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleGoingIntoBackground),
            name: UIApplication.willResignActiveNotification,
            object: nil)
    }

    @objc
    private func handleEnteredForeground() {
        foregroundCompletion?()
    }

    @objc
    private func handleGoingIntoBackground() {
        backgroundCompletion?()
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.willResignActiveNotification, object: nil)
    }

}

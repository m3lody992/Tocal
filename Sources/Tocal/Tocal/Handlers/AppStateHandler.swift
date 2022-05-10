//
//  EnterForegroundHandler.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 29/10/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import UIKit

class PPYYkBfJ6RobosDg0q4UxZd0QsqA6qBv {

    private var oAoBaezZoWOYvSTlMWYqoTNos3m0XJwU: (() -> Void)?
    private var Kd47Ftj7WhGMFYhsgbJJiiP9BsXNXZjR: (() -> Void)?

    func nThjORZ7mYD5nxmddBBVsmVwEITzJZAA(_ completion: @escaping () -> Void) {
        self.oAoBaezZoWOYvSTlMWYqoTNos3m0XJwU = completion
    }

    func rtWUrBCTCQjfV0n8W49p3m27IXudSyo7(_ completion: @escaping () -> Void) {
        self.Kd47Ftj7WhGMFYhsgbJJiiP9BsXNXZjR = completion
    }

    init() {
        b5gc5ydBSI8LOzzBhHJmbycjYAaHuZzN()
    }

    private func b5gc5ydBSI8LOzzBhHJmbycjYAaHuZzN() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(jd0xDBbA3HJHWFUpMGge2Cdh2OmlGNpG),
            name: UIApplication.willEnterForegroundNotification,
            object: nil)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(wNFVoZesMLhLonxpPO9K3I6Sb1MEjXQK),
            name: UIApplication.willResignActiveNotification,
            object: nil)
    }

    @objc
    private func jd0xDBbA3HJHWFUpMGge2Cdh2OmlGNpG() {
        oAoBaezZoWOYvSTlMWYqoTNos3m0XJwU?()
    }

    @objc
    private func wNFVoZesMLhLonxpPO9K3I6Sb1MEjXQK() {
        Kd47Ftj7WhGMFYhsgbJJiiP9BsXNXZjR?()
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.willResignActiveNotification, object: nil)
    }

}

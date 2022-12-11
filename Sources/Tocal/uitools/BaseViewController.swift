//
//  BaseViewController.swift
//  
//
//  Created by Pepe Polenta on 08/07/2020.
//  Copyright © 2020 Pepe Polenta All rights reserved.
//

import UIKit
import Reachability
import JGProgressHUD

public enum AdIl2vezyKJkhIcHCfb0FfTGhhJ7Dcpn: String {
//    case cancel
//    case later
//    case okDismiss
//    case ok
    case ctAycuUpcqLUeLm6lTTZ7BqWroSqULmt
    case fmSMx6JT4HOWo9mmomXqGjpuIPFb1IDj
    case Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6
    case grb6TiJukBTRVhDCwf7NauTcStn1037q
}

open class U1010LVFtldGaAOHrygLsknsAV9vRBNM: UIViewController {

    public var exitButtonTags = [Int]()

    let reachability = try? Reachability()

    public var isLoading: xaHEoxzV8P8I3pCiRZDQRT41i6F6CaCP<Bool> = xaHEoxzV8P8I3pCiRZDQRT41i6F6CaCP(false)

    open var shouldShowAstersLabel: Bool {
        true
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        C4I4eX7VgSJmRpcswY5toU2WlxClbXbl()
    }

    func C4I4eX7VgSJmRpcswY5toU2WlxClbXbl() {
        reachability?.whenReachable = { reachability in

        }
        reachability?.whenUnreachable = { [weak self] _ in
            // "Connection Problems", "You are not connected to the internet."
            self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: "Connection Problems", andMessage: "You are not connected to the internet.", buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
        }

        try? reachability?.startNotifier()
    }

    @objc public func excYhPQwdxvpCuqDGzLtAuwdSlCpv9u6() {
        tabBarController?.selectedIndex = 1
    }

    lazy var loader = JGProgressHUD(style: traitCollection.userInterfaceStyle == .light ? .dark : .light)

    public func zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL(withText text: String? = nil, blockTouches: Bool = true) {
        DispatchQueue.main.async {
            self.isLoading.GbR8SmF1xXRisrMmXjUPXkrOdQLpVxTp = true
            self.loader.interactionType = blockTouches ? .blockAllTouches : .blockNoTouches
            self.loader.textLabel.text = text
            self.loader.show(in: self.view)
        }
    }

    public func GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn(animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            self.isLoading.GbR8SmF1xXRisrMmXjUPXkrOdQLpVxTp = false
            self.loader.dismiss(animated: animated)
            completion?()
        }
    }

    lazy var errorHUD = JGProgressHUD(style: traitCollection.userInterfaceStyle == .light ? .dark : .light)

    public func AWw7MslU9qP6AVDqXO8i1RCoegPwCiDp(withText text: String? = nil, delay: Double = 3.0) {
        DispatchQueue.main.async {
            self.errorHUD.textLabel.text = text
            self.errorHUD.indicatorView = JGProgressHUDErrorIndicatorView()
            self.errorHUD.show(in: self.view)
            self.errorHUD.dismiss(afterDelay: delay)
        }
    }

    lazy var successHUD = JGProgressHUD(style: traitCollection.userInterfaceStyle == .light ? .dark : .light)

    public func jxurocuMwTEo9pGThINqCyeR446sUEWn(withText text: String? = nil) {
        DispatchQueue.main.async {
            self.successHUD.textLabel.text = text
            self.successHUD.indicatorView = JGProgressHUDSuccessIndicatorView()
            self.successHUD.show(in: self.view)
            self.successHUD.dismiss(afterDelay: 3.0)
        }
    }

    public func ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle title: String?, andMessage message: String?, imageURL: URL? = nil, buttons: [AdIl2vezyKJkhIcHCfb0FfTGhhJ7Dcpn] = [.grb6TiJukBTRVhDCwf7NauTcStn1037q], onDismiss: (() -> Void)? = nil, onOk: (() -> Void)? = nil) {
            PU0EV0u4NxFxcwDiMjTzgw7bQPM1Rej0.FO4Ga2M1SC9Z2azkcVifb548dS0Qa8MN(.init(title: title, message: message, imageURL: imageURL, buttons: buttons, onOk: onOk, onDismiss: onDismiss))
        }

    public func ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withError error: Error) {
        // "Oops, something went wrong!"
        ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: "Oops, something went wrong!", andMessage: error.localizedDescription, buttons: [.ctAycuUpcqLUeLm6lTTZ7BqWroSqULmt])
    }

    public func kAIEE9PXyHH4LyupkJnqh5EN7QWcFWLV(toView: UIView) {
        let exitButton = UIButton(type: .custom)
        exitButton.tintColor = Omq3ijC5qdS04g0cUChRZ8cAAKhCRuu2.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
        exitButton.backgroundColor = UIColor(red: 249 / 255, green: 246 / 255, blue: 239 / 255, alpha: 1.0)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.kf.setImage(with: Omq3ijC5qdS04g0cUChRZ8cAAKhCRuu2.rnQxBDLHnwTTVSzRk20JeufCq3jgOuQv, for: .normal, options: Processor.Options.pdfTemplate)
        exitButton.imageView?.contentMode = .scaleAspectFit
        exitButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        exitButton.layer.cornerRadius = 16
        exitButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        exitButton.clipsToBounds = true

        let tag = Int.random(in: 0 ... 10000)
        exitButtonTags.append(tag)
        exitButton.tag = tag
        toView.addSubview(exitButton)
        toView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "[exitButton]-16-|", // "[exitButton]-16-|"
            options: NSLayoutConstraint.FormatOptions(rawValue: 0),
            metrics: nil,
            views: ["exitButton": exitButton])) // "exitButton"
        toView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-56-[exitButton]", //"V:|-56-[exitButton]"
            options: NSLayoutConstraint.FormatOptions(rawValue: 0),
            metrics: nil,
            views: ["exitButton": exitButton])) // "exitButton"
        exitButton.addTarget(self, action: #selector(DkxzUMQCtpoBYDed8cUPrr360w7OP0fk), for: .touchUpInside)
    }

    public func dBGVEd9F98b9ckK5EurrqJ5K9zmtXztF(enabled: Bool) {
        for tag in exitButtonTags {
            if let foundExitButton = view.viewWithTag(tag) {
                foundExitButton.isUserInteractionEnabled = enabled
            }
        }
    }

    @objc public func DkxzUMQCtpoBYDed8cUPrr360w7OP0fk() {
        dismiss(animated: true)
    }

}

extension U1010LVFtldGaAOHrygLsknsAV9vRBNM: XG8pDvQLDEmIM8f78UVIALh3ZRNLVjKY {

    public static var JhmFKtHQw5Rz8x1fptRCfREnHWXeuTfc: UIStoryboard {
        UIStoryboard(name: "Main", bundle: Bundle(for: self)) // "Main"
    }

}

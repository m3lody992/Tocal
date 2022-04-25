//
//  AddUserViewController.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 05/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
import WebKit
import MessageUI
import UITools
import DeviceTools

public class AddUserViewController: MainViewController {

    @IBOutlet private weak var webViewHolder: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var exitButton: UIButton!
    @IBOutlet private weak var cannotEnterButton: UIButton!
    @IBOutlet private weak var findUsernameButton: UIButton!
    @IBOutlet private weak var reportAProblemButton: UIButton!
    @IBOutlet private weak var addUsernameButton: RoundedButton!
    @IBAction private func addUserName(_ sender: Any) {
        guard let text = userNameTextField.text, !text.isEmpty else {
            // "Invalid username!", "Please try again."
            self.presentAlert(withTitle: [58, 45, 6, 22, 37, 19, 1, 119, 67, 25, 34, 64, 10, 20, 52, 20, 123].localizedString, andMessage: [35, 47, 21, 22, 58, 31, 69, 35, 68, 19, 103, 83, 3, 20, 48, 31, 116].localizedString, buttons: [.okDismiss])
            return
        }
        showLoader()
        viewModel.checkUsername(text.replacingOccurrences(of: [51].localizedString, with: [].localizedString).trimmingCharacters(in: .whitespaces)) // @
    }

    @IBAction private func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func findUsername(_ sender: Any) {
        let helpVC = HelpViewController()
        helpVC.set(url: Tocal.configuration.baseURL.appendingPathComponent([92, 43, 21, 27, 57, 37, 16, 36, 83, 24, 41, 83, 9, 16, 118] .localizedString)) // "/help_username/"
        present(helpVC, animated: true)
    }

    @IBAction private func cannotEnter(_ sender: Any) {
        let alertController = UIAlertController(
            title: [50, 32, 19, 24, 60, 20, 17, 119, 122, 5, 40, 89, 17, 5].localizedString, // "Account Lookup"
            // "Go to your profile on TikTok app and tap the \"...\" icon on the top right, then tap \"Share Profile\". Copy that link and paste it below!"
            message: [52, 44, 80, 3, 38, 90, 28, 56, 67, 24, 103, 66, 22, 26, 63, 24, 54, 62, 75, 44, 34, 96, 48, 57, 88, 12, 65, 57, 101, 66, 34, 3, 99, 17, 25, 45, 90, 17, 54, 70, 74, 51, 90, 1, 85, 123, 95, 116, 117, 73, 99, 37, 35, 11, 62, 19, 55, 64, 114, 49, 75, 55, 83, 55, 31, 7, 105, 8, 12, 48, 94, 30, 107, 18, 16, 29, 60, 31, 122, 47, 10, 51, 108, 98, 55, 56, 82, 42, 75, 114, 21, 81, 61, 21, 42, 28, 18, 107, 84, 69, 20, 89, 26, 62, 18, 16, 29, 56, 5, 122, 55, 2, 45, 39, 96, 5, 62, 87, 120, 94, 51, 54, 87, 55, 83, 42, 4, 87, 43, 31, 9, 56, 65, 75].localizedString,
            preferredStyle: .alert)

        alertController.addTextField()
        // "Continue"
        let continueAction = UIAlertAction(title: [48, 44, 30, 3, 32, 20, 16, 50].localizedString, style: .default) { [weak self] _ in
            guard let textField = alertController.textFields?.first,
                let text = textField.text else { return }
            textField.placeholder = [27, 55, 4, 7, 58, 64, 74, 120, 64, 7, 105, 70, 13, 30, 45, 30, 49, 117, 8, 44, 33, 111, 21, 42, 73, 8, 87, 51, 106].localizedString // "https://vm.tiktok.com/qzzPya/"
            // "tiktok.com"
            if !text.contains([7, 42, 27, 3, 38, 17, 75, 52, 89, 7].localizedString) {
                // "Invalid URL!", "Please follow the instructions and enter a valid TikTok video link!"
                self?.presentAlert(withTitle: [58, 45, 6, 22, 37, 19, 1, 119, 99, 56, 11, 19].localizedString, andMessage: [35, 47, 21, 22, 58, 31, 69, 49, 89, 6, 43, 93, 19, 85, 45, 25, 63, 123, 2, 45, 63, 52, 22, 37, 80, 44, 71, 61, 43, 80, 114, 18, 45, 20, 87, 44, 20, 17, 50, 68, 74, 38, 18, 18, 20, 53, 24, 62, 123, 63, 42, 39, 20, 11, 59, 19, 46, 71, 54, 32, 76, 114, 31, 42, 30, 28, 104].localizedString, buttons: [.okDismiss])
            } else {
                self?.showLoader()
                guard let url = URL(string: text) else { return }
                // https://vm.tiktok.com/JYRyH43/
                self?.viewModel.checkURL(url)
            }
        }

        let cancelAction = UIAlertAction(title: [48, 34, 30, 20, 44, 22].localizedString, style: .default) // "Cancel"

        alertController.addAction(cancelAction)
        alertController.addAction(continueAction)

        present(alertController, animated: true, completion: nil)
    }

    @IBAction private func reportAProblem(_ sender: Any) {
        // "Send email?", "Would you like to send us an email?"
        presentAlert(withTitle: [32, 38, 30, 19, 105, 63, 8, 54, 95, 6, 120].localizedString, andMessage: [36, 44, 5, 27, 45, 90, 28, 56, 67, 74, 43, 91, 15, 16, 121, 5, 53, 123, 24, 38, 34, 36, 68, 37, 64, 120, 79, 60, 101, 70, 63, 18, 42, 28, 72].localizedString, buttons: [.ok, .cancel]) { [weak self] in
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients([ALUserInfoService.settings.email])
                mail.setSubject([32, 54, 0, 7, 38, 8, 17, 119, 27, 74].localizedString + (ALUserInfoService.isExistingUser ? Tocal.configuration.emailAppName + [83, 110, 80, 27, 125, 22].localizedString : Tocal.configuration.emailAppName) + [83, 110, 80, 54, 45, 30, 69, 2, 69, 15, 53].localizedString)
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

    var webView: WKWebView?

    let viewModel = AddUserViewModel()

    var alternativeCheck = false

    public override var shouldCheckSession: Bool { false }

    public override func viewDidLoad() {
        super.viewDidLoad()
        addBindings()
        setupUI()

        userNameTextField.delegate = self

        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)

        webView?.isHidden = true
    }

    func setupUI() {
        addUsernameButton.setTitle([52, 12, 81].localizedString, for: .normal) // GO!

        titleLabel.text = [54, 45, 4, 18, 59, 90, 28, 56, 67, 24, 103, 102, 13, 30, 13, 30, 49, 123, 30, 48, 41, 50, 10, 49, 94, 61].localizedString // Enter your TikTok username
        reportAProblemButton.setTitle([131, 220, 227, 208, 105, 63, 8, 54, 95, 6, 103, 71, 23].localizedString, for: .normal)
        reportAProblemButton.setTitleColor(.darkGray, for: .normal)
        findUsernameButton.setTitle([59, 44, 7, 87, 61, 21, 69, 49, 95, 4, 35, 18, 29, 26, 44, 3, 122, 15, 2, 40, 24, 47, 15, 112, 70, 43, 75, 32, 43, 66, 63, 22].localizedString, for: .normal)
        findUsernameButton.setTitleColor(.white, for: .normal)
        cannotEnterButton.setTitle([48, 34, 30, 25, 38, 14, 69, 18, 88, 30, 34, 64, 91].localizedString, for: .normal)

        exitButton.kf.setImage(with: Constants.URL.Image.xmark, for: .normal, options: Processor.Options.pdfTemplate)
        exitButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        exitButton.isHidden = !(ALUserInfoService.settings.showAddUserEB)

        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)

    }

    func addBindings() {
        viewModel.onUserFound = { [weak self] in
            // temp add username to UD.
            self?.dismissLoader { [weak self] in
                // In case we want to skip login go straight to home view controller
                if ALUserInfoService.settings.skipLogin == true {
                    let controller = MainTabBarController()
                    controller.modalPresentationStyle = .fullScreen
                    self?.present(controller, animated: true, completion: nil)
                } else {
                    let loginVC = LoginViewController()
                    loginVC.state = .onboarding
                    let navigationController = UINavigationController(rootViewController: loginVC)
                    navigationController.modalPresentationStyle = .fullScreen
                    self?.present(navigationController, animated: true, completion: nil)
                }
            }
        }
        viewModel.onError = { [weak self] message, error in
            self?.dismissLoader {
                // "Error"
                self?.presentAlert(withTitle: [54, 49, 2, 24, 59].localizedString, andMessage: message, buttons: [.okDismiss])
            }
        }
        viewModel.onUserCheckNotPassed = { [weak self] in
            DispatchQueue.main.async {
                self?.dismissLoader {
                    self?.dismiss(animated: true)
                }
            }
        }
    }
}

extension AddUserViewController: MFMailComposeViewControllerDelegate {

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

extension AddUserViewController: UITextFieldDelegate {

    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // TODO: Fix this shit omg
        addUsernameButton.backgroundColor = textField.text == "​" ? .lightGray : Tocal.theme.primaryColor
        return true
    }

}

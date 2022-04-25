//
//  MoreViewController.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 03/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
import MessageUI
import CoreHaptics
import UITools
import DeviceTools

class PanPotAgapeMethodSwitchView: UIStackView {
    
    private var leftLabel: UILabel!
    private var rightLabel: UILabel!
    @objc private var agapeMethodSwitch: UISwitch!
    @objc
    private func agapeMethodSwitchChange() {
        onSwitchChangeCompletion?(agapeMethodSwitch.isOn)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        leftLabel = UILabel()
        addArrangedSubview(leftLabel)
        agapeMethodSwitch = UISwitch()
        agapeMethodSwitch.addTarget(self, action: #selector(agapeMethodSwitchChange), for: UIControl.Event.valueChanged)
        addArrangedSubview(agapeMethodSwitch)
        rightLabel = UILabel()
        addArrangedSubview(rightLabel)
        
        alignment = .center
        distribution = .equalCentering
        spacing = 8
    }
    
    private var onSwitchChangeCompletion: ((Bool) -> Void)?
    
    func setMethod(_ method: AgapeMode, animated: Bool = false) {
        agapeMethodSwitch?.setOn(method == .inApp, animated: animated)
    }
    
    func onSwitchChange(completion: @escaping (Bool) -> Void) {
        onSwitchChangeCompletion = completion
    }
    
    override func layoutSubviews() {
        leftLabel?.text = [39, 42, 27, 35, 38, 17, 69, 93, 122, 3, 44, 91, 10, 18].localizedString // "TikTok \nLiking"
        rightLabel?.text = [58, 45, 93, 54, 57, 10, 111, 27, 95, 1, 46, 92, 3].localizedString // "In-App\nLiking"
        
        // For on state
        agapeMethodSwitch?.backgroundColor = Tocal.theme.primaryColor
        agapeMethodSwitch?.layer.cornerRadius = agapeMethodSwitch.frame.height / 2
        agapeMethodSwitch?.onTintColor = Tocal.theme.primaryColor

        // For off state
        agapeMethodSwitch?.layer.cornerRadius = agapeMethodSwitch.frame.height / 2
        agapeMethodSwitch?.backgroundColor = Tocal.theme.secondaryColor
        agapeMethodSwitch?.clipsToBounds = true
    }
    
}

class MoreViewController: MainViewController {

    private var seiraHistory: RoundedButton!
    private var switchAccounts: RoundedButton!
    private var stackView: UIStackView!
    private var getAstersButton: RoundedButton!
    private var rateUs: RoundedButton!
    private var hapticFeedbackButton: RoundedButton!
    private var reportAProblem: RoundedButton!
    private var termsButton: RoundedButton!
    
    var timer: Timer?
    
    func setupConstraints() {
        view.backgroundColor = .systemBackground
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 28
        stackView.distribution = .fillEqually
        view.addSubview(stackView)

        seiraHistory = RoundedButton()
        seiraHistory.titleLabel?.font = .systemFont(ofSize: 13)
        seiraHistory.onTap { [weak self] in
            let vc = SeiraStatusViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        stackView.addArrangedSubview(seiraHistory)
        
        switchAccounts = RoundedButton()
        switchAccounts.translatesAutoresizingMaskIntoConstraints = false
        switchAccounts.titleLabel?.font = .systemFont(ofSize: 13)
        switchAccounts.onTap { [weak self] in
            if ALUserInfoService.isHapticFeedbackEnabled {
                let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
                notificationFeedbackGenerator.prepare()
                notificationFeedbackGenerator.notificationOccurred(.warning)
            }
            // "Logout?"
            self?.presentAlert(withTitle: [63, 44, 23, 24, 60, 14, 90].localizedString,
                         // "Are you sure you want to log out form @\(User.tikTokUserName)"
                andMessage: [50, 49, 21, 87, 48, 21, 16, 119, 69, 31, 53, 87, 68, 12, 54, 4, 122, 44, 10, 45, 56, 96, 16, 63, 19, 52, 65, 53, 101, 76, 39, 7, 99, 22, 24, 59, 23, 69, 23].localizedString + ALUserInfoService.panPotUserName,
                               buttons: [.ok, .cancel], onOk: { [weak self] in
                Session.logout()
                
                let loginVC = LoginViewController()
                loginVC.state = .inApp
                let navigationController = UINavigationController(rootViewController: loginVC)
                navigationController.modalPresentationStyle = .fullScreen
                navigationController.modalTransitionStyle = .crossDissolve
                self?.present(navigationController, animated: true, completion: nil)
            })
        }
        stackView.addArrangedSubview(switchAccounts)
        
        getAstersButton = RoundedButton()
        getAstersButton.translatesAutoresizingMaskIntoConstraints = false
        getAstersButton.titleLabel?.font = .systemFont(ofSize: 13)
        getAstersButton.onTap { [weak self] in
            self?.getGift()
        }
        stackView.addArrangedSubview(getAstersButton)
        
        rateUs = RoundedButton()
        rateUs.translatesAutoresizingMaskIntoConstraints = false
        rateUs.titleLabel?.font = .systemFont(ofSize: 13)
        rateUs.onTap {
            let appURL = ALUserInfoService.settings.appURL
            if UIApplication.shared.canOpenURL(appURL) {
                UIApplication.shared.open(appURL)
            }
        }
        stackView.addArrangedSubview(rateUs)
        
        hapticFeedbackButton = RoundedButton()
        hapticFeedbackButton.translatesAutoresizingMaskIntoConstraints = false
        hapticFeedbackButton.titleLabel?.font = .systemFont(ofSize: 13)
        hapticFeedbackButton.onTap { [weak self] in
            ALUserInfoService.isHapticFeedbackEnabled = !ALUserInfoService.isHapticFeedbackEnabled
            self?.hapticFeedbackButton.setTitle(ALUserInfoService.isHapticFeedbackEnabled ? [55, 42, 3, 22, 43, 22, 0, 119, 94, 11, 55, 70, 13, 22, 121, 23, 63, 62, 15, 33, 45, 35, 15].localizedString : [54, 45, 17, 21, 37, 31, 69, 63, 87, 26, 51, 91, 7, 85, 63, 20, 63, 63, 9, 34, 47, 43].localizedString, for: .normal) // "Disable haptic feedback" / "Enable haptic feedback"
            if ALUserInfoService.isHapticFeedbackEnabled {
                let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
                notificationFeedbackGenerator.prepare()
                notificationFeedbackGenerator.notificationOccurred(.success)
            }
        }
        stackView.addArrangedSubview(hapticFeedbackButton)
        
        reportAProblem = RoundedButton()
        reportAProblem.translatesAutoresizingMaskIntoConstraints = false
        reportAProblem.titleLabel?.font = .systemFont(ofSize: 13)
        reportAProblem.onTap { [weak self] in
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients([ALUserInfoService.settings.email])
                mail.setSubject([33, 38, 0, 24, 59, 14, 69, 54, 22, 26, 53, 93, 6, 25, 60, 28, 122, 118, 75].localizedString + (ALUserInfoService.isExistingUser ? Tocal.configuration.emailAppName + [83, 110, 80, 27, 125, 22].localizedString : Tocal.configuration.emailAppName))
                mail.setMessageBody(String(format: [49, 38, 28, 24, 62, 90, 12, 36, 22, 11, 103, 86, 1, 6, 58, 3, 51, 43, 31, 42, 35, 46, 68, 63, 85, 120, 90, 58, 32, 3, 48, 6, 36, 80, 24, 59, 90, 8, 46, 22, 25, 50, 85, 3, 16, 42, 5, 51, 52, 5, 121, 108, 74, 110, 90, 57, 82, 36, 88, 79, 41, 88, 121, 73, 122, 125, 67, 112, 111, 93, 60, 96, 77, 56, 110, 127, 83, 123, 80, 81, 97, 73, 70, 74, 110, 112, 70, 43, 75, 32, 43, 66, 63, 22, 121, 80, 82, 9, 90, 111, 62, 121, 57, 103, 100, 1, 7, 42, 24, 53, 53, 81, 99, 105, 0, 68, 90, 87, 61, 88, 59, 38, 70, 114, 30, 44, 20, 18, 37, 64, 69, 114, 118, 74, 77, 83, 20, 5, 121, 7, 63, 41, 24, 42, 35, 46, 94, 112, 22, 24, 14, 88, 44, 71, 104, 83, 102, 48, 87, 67, 23, 8, 109, 22, 79, 7].localizedString,
                                           ALUserInfoService.panPotUserName,
                                           UIDevice.current.systemVersion,
                                           Device.hardwareModelName,
                                           Device.appVersion,
                                           ALUserInfoService.panPotID,
                                           AgapeLogic.shouldUseInAppLikes ? [26, 45, 49, 7, 57].localizedString : [7, 55, 49, 7, 57].localizedString), // "inApp", "ttApp"
                                    isHTML: false)

                self?.present(mail, animated: true)
            } else {
                self?.presentAlert(withTitle: [36, 34, 2, 25, 32, 20, 2, 118].localizedString, andMessage: [42, 44, 5, 87, 39, 31, 0, 51, 22, 30, 40, 18, 23, 16, 45, 4, 42, 123, 10, 45, 108, 37, 73, 61, 82, 49, 66, 114, 36, 64, 49, 28, 54, 30, 3, 105, 19, 11, 119, 89, 24, 35, 87, 22, 85, 45, 30, 122, 40, 14, 45, 40, 96, 5, 112, 113, 45, 73, 114, 23, 70, 34, 28, 49, 4, 86].localizedString, buttons: [.okDismiss])
            }
        }
        stackView.addArrangedSubview(reportAProblem)
        
        termsButton = RoundedButton()
        termsButton.translatesAutoresizingMaskIntoConstraints = false
        termsButton.titleLabel?.font = .systemFont(ofSize: 13)
        termsButton.onTap { [weak self] in
            let helpVC = HelpViewController()
            helpVC.set(url: Tocal.configuration.baseURL.appendingPathComponent([31, 38, 23, 22, 37].localizedString).appendingPathComponent([7, 38, 2, 26, 58, 84, 13, 35, 91, 6].localizedString)) // "legal", "terms.html"
            self?.present(helpVC, animated: true)
        }
        stackView.addArrangedSubview(termsButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 64),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -64),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            seiraHistory.widthAnchor.constraint(equalToConstant: 150),
            seiraHistory.heightAnchor.constraint(equalToConstant: 36),
            switchAccounts.widthAnchor.constraint(equalToConstant: 150),
            switchAccounts.heightAnchor.constraint(equalToConstant: 36),
            getAstersButton.widthAnchor.constraint(equalToConstant: 150),
            getAstersButton.heightAnchor.constraint(equalToConstant: 36),
            rateUs.widthAnchor.constraint(equalToConstant: 150),
            rateUs.heightAnchor.constraint(equalToConstant: 36),
            hapticFeedbackButton.widthAnchor.constraint(equalToConstant: 150),
            hapticFeedbackButton.heightAnchor.constraint(equalToConstant: 36),
            reportAProblem.widthAnchor.constraint(equalToConstant: 150),
            reportAProblem.heightAnchor.constraint(equalToConstant: 36),
            termsButton.widthAnchor.constraint(equalToConstant: 150),
            termsButton.heightAnchor.constraint(equalToConstant: 36),
        ])
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        title = [62, 44, 2, 18].localizedString
        seiraHistory.setTitle([63, 42, 27, 18, 105, 41, 17, 54, 66, 31, 52].localizedString, for: .normal)
        switchAccounts.setTitle([32, 52, 25, 3, 42, 18, 69, 22, 85, 9, 40, 71, 10, 1, 42, 81, 117, 123, 39, 44, 43, 47, 17, 36].localizedString, for: .normal)
        getAstersButton.setTitle([52, 38, 4, 87, 15, 40, 32, 18, 22, 57, 51, 83, 22, 6].localizedString, for: .normal)
        rateUs.setTitle([33, 34, 4, 18, 105, 47, 22].localizedString, for: .normal)
        reportAProblem.setTitle([33, 38, 0, 24, 59, 14, 69, 54, 22, 26, 53, 93, 6, 25, 60, 28].localizedString, for: .normal)
        termsButton.setTitle([39, 38, 2, 26, 58, 90, 10, 49, 22, 63, 52, 87].localizedString, for: .normal)

        // Only show if haptics are supported.
        if #available(iOS 13.0, *) {
            hapticFeedbackButton.isHidden = !CHHapticEngine.capabilitiesForHardware().supportsHaptics
        } else {
            hapticFeedbackButton.isHidden = true
        }
        
        hapticFeedbackButton.setTitle(ALUserInfoService.isHapticFeedbackEnabled ? [55, 42, 3, 22, 43, 22, 0, 119, 94, 11, 55, 70, 13, 22, 121, 23, 63, 62, 15, 33, 45, 35, 15].localizedString : [54, 45, 17, 21, 37, 31, 69, 63, 87, 26, 51, 91, 7, 85, 63, 20, 63, 63, 9, 34, 47, 43].localizedString, for: .normal) // "Disable haptic feedback" / "Enable haptic feedback"
        rateUs.isHidden = ALUserInfoService.settings.showRateApp == false

        let button = UIButton(type: .system)
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.tintColor = Tocal.theme.primaryColor
        button.kf.setImage(with: Constants.URL.Image.gift, for: .normal, options: Processor.Options.pdfTemplate)
        button.addTarget(self, action: #selector(getGift), for: .touchUpInside)
        navigationItem.setLeftBarButton(.init(customView: button), animated: false)
    }

    @objc func getGift() {
        let astersVC = AstersViewController()
        navigationController?.pushViewController(astersVC, animated: true)
    }

}

extension MoreViewController: MFMailComposeViewControllerDelegate {

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if case .sent = result {
            controller.dismiss(animated: true) {
                self.presentAlert(withTitle: [54, 46, 17, 30, 37, 90, 22, 50, 88, 30, 102].localizedString, andMessage: nil, buttons: [.okDismiss])
            }
        } else {
            controller.dismiss(animated: true)
        }
    }

}

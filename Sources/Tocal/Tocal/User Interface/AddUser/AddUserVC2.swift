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
//import UITools
//import DeviceTools

public class OnTapButton: UIButton {
    
    private var onTap: (() -> Void)?
    
    public func onTap(completion: @escaping () -> Void) {
        self.onTap = completion
    }
    
    @objc func pressed() {
        onTap?()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit() {
        addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }

}

public class AddUserViewController: kBRLNmf7mGhhxUj2Oou351YWEX8tW5mR {

    private func addUserName() {
        guard let text = userNameTextField.text, !text.isEmpty else {
            // "Invalid username!", "Please try again."
            self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [58, 45, 6, 22, 37, 19, 1, 119, 67, 25, 34, 64, 10, 20, 52, 20, 123].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [35, 47, 21, 22, 58, 31, 69, 35, 68, 19, 103, 83, 3, 20, 48, 31, 116].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            return
        }
        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
        viewModel.nNdMFAJdtkpKHf0pfUiY8UK3InD4agsl(text.replacingOccurrences(of: [51].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, with: [].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG).trimmingCharacters(in: .whitespaces)) // @
    }

    private func dismiss() {
        dismiss(animated: true, completion: nil)
    }

    func findUsername() {
        let helpVC = xJnrm5zRqHOD7VtcYbxe4lqV7VDEQwSN()
        helpVC.XEaHoJcMOewthI8CUuDkUl3FbYB7jIna(url: pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.R8r0pjGlMK6ftNBnM6ElIacCJ0GIffSd.appendingPathComponent([92, 43, 21, 27, 57, 37, 16, 36, 83, 24, 41, 83, 9, 16, 118] .cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)) // "/help_username/"
        present(helpVC, animated: true)
    }

    private func cannotEnter() {
        let alertController = UIAlertController(
            title: [50, 32, 19, 24, 60, 20, 17, 119, 122, 5, 40, 89, 17, 5].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, // "Account Lookup"
            // "Go to your profile on TikTok app and tap the \"...\" icon on the top right, then tap \"Share Profile\". Copy that link and paste it below!"
            message: [52, 44, 80, 3, 38, 90, 28, 56, 67, 24, 103, 66, 22, 26, 63, 24, 54, 62, 75, 44, 34, 96, 48, 57, 88, 12, 65, 57, 101, 66, 34, 3, 99, 17, 25, 45, 90, 17, 54, 70, 74, 51, 90, 1, 85, 123, 95, 116, 117, 73, 99, 37, 35, 11, 62, 19, 55, 64, 114, 49, 75, 55, 83, 55, 31, 7, 105, 8, 12, 48, 94, 30, 107, 18, 16, 29, 60, 31, 122, 47, 10, 51, 108, 98, 55, 56, 82, 42, 75, 114, 21, 81, 61, 21, 42, 28, 18, 107, 84, 69, 20, 89, 26, 62, 18, 16, 29, 56, 5, 122, 55, 2, 45, 39, 96, 5, 62, 87, 120, 94, 51, 54, 87, 55, 83, 42, 4, 87, 43, 31, 9, 56, 65, 75].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG,
            preferredStyle: .alert)

        alertController.addTextField()
        // "Continue"
        let continueAction = UIAlertAction(title: [48, 44, 30, 3, 32, 20, 16, 50].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, style: .default) { [weak self] _ in
            guard let textField = alertController.textFields?.first,
                let text = textField.text else { return }
            textField.placeholder = [27, 55, 4, 7, 58, 64, 74, 120, 64, 7, 105, 70, 13, 30, 45, 30, 49, 117, 8, 44, 33, 111, 21, 42, 73, 8, 87, 51, 106].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG // "https://vm.tiktok.com/qzzPya/"
            // "tiktok.com"
            if !text.contains([7, 42, 27, 3, 38, 17, 75, 52, 89, 7].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) {
                // "Invalid URL!", "Please follow the instructions and enter a valid TikTok video link!"
                self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [58, 45, 6, 22, 37, 19, 1, 119, 99, 56, 11, 19].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [35, 47, 21, 22, 58, 31, 69, 49, 89, 6, 43, 93, 19, 85, 45, 25, 63, 123, 2, 45, 63, 52, 22, 37, 80, 44, 71, 61, 43, 80, 114, 18, 45, 20, 87, 44, 20, 17, 50, 68, 74, 38, 18, 18, 20, 53, 24, 62, 123, 63, 42, 39, 20, 11, 59, 19, 46, 71, 54, 32, 76, 114, 31, 42, 30, 28, 104].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            } else {
                self?.zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
                guard let url = URL(string: text) else { return }
                // https://vm.tiktok.com/JYRyH43/
                self?.viewModel.R4wiT2cnKDAkN6iT8rWgua3MytNYrT1v(url)
            }
        }

        let cancelAction = UIAlertAction(title: [48, 34, 30, 20, 44, 22].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, style: .default) // "Cancel"
        alertController.addAction(cancelAction)
        alertController.addAction(continueAction)

        present(alertController, animated: true, completion: nil)
    }

    private func reportAProblem() {
        // "Send email?", "Would you like to send us an email?"
        ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [32, 38, 30, 19, 105, 63, 8, 54, 95, 6, 120].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [36, 44, 5, 27, 45, 90, 28, 56, 67, 74, 43, 91, 15, 16, 121, 5, 53, 123, 24, 38, 34, 36, 68, 37, 64, 120, 79, 60, 101, 70, 63, 18, 42, 28, 72].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.grb6TiJukBTRVhDCwf7NauTcStn1037q, .ctAycuUpcqLUeLm6lTTZ7BqWroSqULmt], onOk:  { [weak self] in
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients([OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.email])
                mail.setSubject([32, 54, 0, 7, 38, 8, 17, 119, 27, 74].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + (OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.adv47DQ8TCJfxb6oOECpPCxATRwklqua ? pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.DLibXxJp5dXlLkgbPnBW5NmpYxtGSfUk + [83, 110, 80, 27, 125, 22].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG : pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.DLibXxJp5dXlLkgbPnBW5NmpYxtGSfUk) + [83, 110, 80, 54, 45, 30, 69, 2, 69, 15, 53].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
                mail.setMessageBody(String(format: [49, 38, 28, 24, 62, 90, 12, 36, 22, 11, 103, 86, 1, 6, 58, 3, 51, 43, 31, 42, 35, 46, 68, 63, 85, 120, 66, 61, 34, 74, 60, 83, 38, 2, 5, 38, 8, 95, 119, 60, 96, 77, 56, 110, 127, 83, 123, 80, 81, 97, 73, 70, 74, 110, 90, 57, 82, 36, 88, 79, 41, 88, 121, 73, 122, 125, 67, 112, 111, 93, 60, 74, 50, 65, 1, 7, 55, 16, 55, 62, 81, 99, 105, 0, 68, 90, 90, 23, 125, 114, 19, 70, 32, 0, 42, 31, 25, 115, 90, 64, 23, 22, 96, 35, 87, 18, 28, 58, 20, 122, 54, 4, 39, 41, 44, 94, 112, 22, 24, 14, 88, 36, 83, 34, 83, 53, 21, 5, 58, 19, 10, 57, 12, 74, 98, 114, 68, 127, 52, 28, 96, 123, 78, 3].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG,
                                           OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL.isEmpty ? [0, 55, 17, 5, 61, 37, 21, 54, 81, 15].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG : OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL,
                                           UIDevice.current.systemVersion,
                                           RdXhUuFovgT0fGXD1JFd3rA4LnK7rxWV.VkDVIhGnmUp9UtD0xn7YMNwfnpkV9IUm,
                                           RdXhUuFovgT0fGXD1JFd3rA4LnK7rxWV.gL0sNTnnLimbnEsUJMS0GupSeaMvk3mO,
                                           OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.adv47DQ8TCJfxb6oOECpPCxATRwklqua ? pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.DLibXxJp5dXlLkgbPnBW5NmpYxtGSfUk + [83, 110, 80, 27, 125, 22].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG : pMma9Oyp1904TuxLtYut9STx35uO4cmO.nTsCgcsOSL7AtL7aP6AJUoAYRMbEsb5M.DLibXxJp5dXlLkgbPnBW5NmpYxtGSfUk),
                                    isHTML: false)
                
                self?.present(mail, animated: true)
            } else {
                self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [36, 34, 2, 25, 32, 20, 2, 118].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [42, 44, 5, 87, 39, 31, 0, 51, 22, 30, 40, 18, 23, 16, 45, 4, 42, 123, 10, 45, 108, 37, 73, 61, 82, 49, 66, 114, 36, 64, 49, 28, 54, 30, 3, 105, 19, 11, 119, 89, 24, 35, 87, 22, 85, 45, 30, 122, 40, 14, 45, 40, 96, 5, 112, 113, 45, 73, 114, 23, 70, 34, 28, 49, 4, 86].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            }
        })
    }
    
    private var titleLabel: UILabel!
    private var userNameTextField: UITextField!
//    private var exitButton: UIButton!
    private var cannotEnterButton: OnTapButton!
    private var findUsernameButton: OnTapButton!
    private var reportAProblemButton: OnTapButton!
    private var addUsernameButton: x5LlNVLCxuPUigI3MYAPViqEiJwvUtoj!
    
    func setupConstraints() {
        view.backgroundColor = .systemBackground
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        userNameTextField = UITextField()
        userNameTextField.borderStyle = .line
        userNameTextField.autocapitalizationType = .none
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userNameTextField)
        
        cannotEnterButton = OnTapButton()
        cannotEnterButton.onTap { [weak self] in
            self?.findUsername()
        }
        cannotEnterButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cannotEnterButton)
        
        reportAProblemButton = OnTapButton()
        reportAProblemButton.onTap { [weak self] in
            self?.reportAProblem()
        }
        reportAProblemButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reportAProblemButton)
        
        findUsernameButton = OnTapButton()
        reportAProblemButton.onTap { [weak self] in
            self?.reportAProblem()
        }
        findUsernameButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(findUsernameButton)
        
        addUsernameButton = x5LlNVLCxuPUigI3MYAPViqEiJwvUtoj()
        addUsernameButton.QgvPF5iAhqHCp044T7UGLCn2begXVgSb { [weak self] in
            self?.addUserName()
        }
        addUsernameButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addUsernameButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            titleLabel.bottomAnchor.constraint(equalTo: userNameTextField.safeAreaLayoutGuide.topAnchor, constant: -28),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            userNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 56),
            userNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -56),
            userNameTextField.heightAnchor.constraint(equalToConstant: 44),
            userNameTextField.bottomAnchor.constraint(equalTo: findUsernameButton.safeAreaLayoutGuide.topAnchor, constant: -28),
            
            addUsernameButton.topAnchor.constraint(equalTo: userNameTextField.safeAreaLayoutGuide.bottomAnchor, constant: 28),
            addUsernameButton.heightAnchor.constraint(equalToConstant: 44),
            addUsernameButton.leadingAnchor.constraint(equalTo: userNameTextField.safeAreaLayoutGuide.leadingAnchor),
            addUsernameButton.trailingAnchor.constraint(equalTo: userNameTextField.safeAreaLayoutGuide.trailingAnchor),
            
            findUsernameButton.heightAnchor.constraint(equalToConstant: 44),
            findUsernameButton.topAnchor.constraint(equalTo: addUsernameButton.safeAreaLayoutGuide.bottomAnchor, constant: -56),
            findUsernameButton.leadingAnchor.constraint(equalTo: userNameTextField.safeAreaLayoutGuide.leadingAnchor),
            findUsernameButton.trailingAnchor.constraint(equalTo: userNameTextField.safeAreaLayoutGuide.trailingAnchor),
            findUsernameButton.bottomAnchor.constraint(equalTo: reportAProblemButton.safeAreaLayoutGuide.topAnchor, constant: -120),
            
            reportAProblemButton.widthAnchor.constraint(equalToConstant: 100),
            reportAProblemButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            reportAProblemButton.topAnchor.constraint(equalTo: cannotEnterButton.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            cannotEnterButton.heightAnchor.constraint(equalToConstant: 30),
            cannotEnterButton.widthAnchor.constraint(equalToConstant: 150),
            cannotEnterButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            cannotEnterButton.topAnchor.constraint(equalTo: addUsernameButton.safeAreaLayoutGuide.bottomAnchor, constant: 16)
            
        ])
    }

    var webView: WKWebView?

    let viewModel = z68MjvbClYKuz0IyruR7jmvcwURA5NBE()

    var alternativeCheck = false

    public override var shouldCheckSession: Bool { false }

    public override func viewDidLoad() {
        super.viewDidLoad()
        addBindings()
        setupUI()

        userNameTextField.delegate = self

        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }

    func setupUI() {
        UIApplication.shared.statusBarStyle = .default
        setupConstraints()
        addUsernameButton.setTitle([52, 12, 81].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, for: .normal) // GO!
        titleLabel.text = [54, 45, 4, 18, 59, 90, 28, 56, 67, 24, 103, 102, 13, 30, 13, 30, 49, 123, 30, 48, 41, 50, 10, 49, 94, 61].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG // Enter your TikTok username
        reportAProblemButton.setTitle([131, 220, 227, 208, 105, 63, 8, 54, 95, 6, 103, 71, 23].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, for: .normal)
        reportAProblemButton.setTitleColor(.darkGray, for: .normal)
        findUsernameButton.setTitle([59, 44, 7, 87, 61, 21, 69, 49, 95, 4, 35, 18, 29, 26, 44, 3, 122, 15, 2, 40, 24, 47, 15, 112, 70, 43, 75, 32, 43, 66, 63, 22].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, for: .normal)
        findUsernameButton.titleLabel?.font = .systemFont(ofSize: 10)
        findUsernameButton.setTitleColor(.darkGray, for: .normal)
        cannotEnterButton.setTitle([48, 34, 30, 25, 38, 14, 69, 18, 88, 30, 34, 64, 91].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, for: .normal)
        cannotEnterButton.setTitleColor(.darkGray, for: .normal)

//        exitButton.kf.setImage(with: Constants.URL.Image.xmark, for: .normal, options: Processor.Options.pdfTemplate)
//        exitButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
//        exitButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
//        exitButton.isHidden = !(ALUserInfoService.settings.showAddUserEB)
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)

    }
    
    override public var shouldShowAstersLabel: Bool {
        false
    }

    func addBindings() {
        viewModel.o6skqcmeNAQR4CmIGgw1atLg4dTDsUSu = { [weak self] info in
            // temp add username to UD.
            self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn { [weak self] in
                if let info = info {
                    let showAlert = UIAlertController(title: "@\(info.username ?? "")", message: nil, preferredStyle: .alert)
                    let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
                    imageView.layer.cornerRadius = 4
                    imageView.contentMode = .scaleAspectFit
                    imageView.clipsToBounds = true
                    imageView.kf.indicatorType = .activity
                    if let avatar = info.avatar {
                        imageView.kf.setImage(with: URL(string: avatar))
                    }
                    showAlert.view.addSubview(imageView)
                    NSLayoutConstraint.activate([
                        showAlert.view.heightAnchor.constraint(equalToConstant: 350),
                        showAlert.view.widthAnchor.constraint(equalToConstant: 250)
                        ])
                    showAlert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { action in
                        let controller = b7gRtY6i1M7BkFYE0WrWckidWT0Rzpw0()
                        controller.modalPresentationStyle = .fullScreen
                        self?.present(controller, animated: true, completion: nil)
                    }))
                    showAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                        showAlert.dismiss(animated: true)
                    }))
                    self?.present(showAlert, animated: true, completion: nil)
                }
            }
        }
        viewModel.cZRBEN3TmU53Gbz5ykxXvL0UG8dGmsmV = { [weak self] message, error in
            self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn {
                // "Error"
                self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [54, 49, 2, 24, 59].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: message, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            }
        }
        viewModel.JWiY9338FvbMnLJojXuut2rKE4Wss5Gl = { [weak self] in
            DispatchQueue.main.async {
                self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn {
                    self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [58, 45, 22, 24].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [35, 47, 21, 22, 58, 31, 69, 58, 87, 1, 34, 18, 23, 0, 43, 20, 122, 34, 4, 54, 108, 40, 5, 38, 86, 120, 79, 114, 53, 81, 61, 21, 42, 28, 18, 105, 10, 12, 52, 66, 31, 53, 87, 68, 6, 60, 5, 122, 58, 5, 39, 108, 33, 16, 112, 95, 61, 79, 33, 49, 3, 61, 29, 38, 80, 1, 32, 30, 0, 56, 22, 6, 40, 83, 0, 16, 61, 81, 53, 53, 75, 58, 35, 53, 22, 112, 67, 42, 65, 52, 44, 79, 55, 93].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
                }
            }
        }
    }
}

extension AddUserViewController: MFMailComposeViewControllerDelegate {

    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if case .sent = result {
            controller.dismiss(animated: true) {
                self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [54, 46, 17, 30, 37, 90, 22, 50, 88, 30, 102].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: nil, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            }
        } else {
            controller.dismiss(animated: true)
        }
    }

}

extension AddUserViewController: UITextFieldDelegate {

    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // TODO: Fix this shit omg
        addUsernameButton.backgroundColor = textField.text == "​" ? .lightGray : pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
        return true
    }

}

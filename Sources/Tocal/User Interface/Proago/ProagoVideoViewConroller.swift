//
//  PromoteVideoViewConroller.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 07/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
import WebKit
import UITools
import DeviceTools
import InfoServices

class ProagoVideoViewConroller: MainViewController {

    private var proagoButton: RoundedButton!
    private var videoImageView: UIImageView!
    private var kardiaPickerView: UIPickerView!
    private var explanationLabel: UILabel!

    var webView: WKWebView?

    private func proago() {
        presentAlert(
            // Order X stars?
            withTitle: [60, 49, 20, 18, 59, 90].localizedString + "\(viewModel.neededAgapes)" + [83, 161, 233, 210, 166, 194, 234, 119, 9].localizedString,
            // Do you want to order X likes for Y stars ?
            andMessage: [55, 44, 80, 14, 38, 15, 69, 32, 87, 4, 51, 18, 16, 26, 121, 30, 40, 63, 14, 49, 108].localizedString + "\(viewModel.neededAgapes)" + [83, 161, 233, 210, 166, 194, 234, 93, 80, 5, 53, 18].localizedString + "\(viewModel.neededAsters)" + [83, 161, 221, 231, 166, 194, 234, 119, 9].localizedString,
        buttons: [.cancel, .ok]) { [weak self] in
            if Aster.numberOfAsters >= self?.viewModel.neededAsters ?? 1000 {
                self?.showLoader()
                self?.viewModel.proagoCurrentVideo()
            } else {
                self?.presentAlert(
                    // Not enough stars
                    withTitle: [61, 44, 4, 87, 44, 20, 10, 34, 81, 2, 103, 208, 201, 229, 182, 201, 213].localizedString,
                    // Would you like to get more ⭐️?
                    andMessage: [36, 44, 5, 27, 45, 90, 28, 56, 67, 74, 43, 91, 15, 16, 121, 5, 53, 123, 12, 38, 56, 96, 9, 63, 65, 61, 14, 176, 232, 179, 189, 203, 204, 79].localizedString,
                    buttons: [.later, .ok]) { [weak self] in
                        self?.tabBarController?.selectedIndex = 1
                }
            }
        }
    }

    var viewModel = ProagoVideoViewModel()
    
    func setupConstraints() {
        let stackContainer = UIStackView()
        stackContainer.spacing = 8
        stackContainer.axis = .vertical
        stackContainer.contentMode = .scaleToFill
        stackContainer.alignment = .center
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackContainer)

        videoImageView = UIImageView()
        videoImageView.contentMode = .scaleAspectFit
        stackContainer.addArrangedSubview(videoImageView)
        videoImageView.layer.cornerRadius = 6
        videoImageView.layer.masksToBounds = true
        
        explanationLabel = UILabel()
        explanationLabel.font = .systemFont(ofSize: 14)
        explanationLabel.textAlignment = .center
        explanationLabel.numberOfLines = 0
        stackContainer.addArrangedSubview(explanationLabel)
        
        kardiaPickerView = UIPickerView()
        stackContainer.addArrangedSubview(kardiaPickerView)
        
        proagoButton = RoundedButton()
        proagoButton.onTap { [weak self] in
            self?.proago()
        }
        stackContainer.addArrangedSubview(proagoButton)
        
        NSLayoutConstraint.activate([
            stackContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            videoImageView.heightAnchor.constraint(equalTo: videoImageView.widthAnchor, multiplier: 1),
            explanationLabel.heightAnchor.constraint(equalToConstant: 40),
            kardiaPickerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 120),
            proagoButton.heightAnchor.constraint(equalToConstant: 40),
            proagoButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.75)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        view.backgroundColor = .systemBackground

        videoImageView.layer.cornerRadius = 5

        addBindings()

        proagoButton.setTitle([35, 49, 31, 26, 38, 14, 0].localizedString, for: .normal)

        kardiaPickerView.delegate = self
        kardiaPickerView.dataSource = self

        // Promote Video
        title = [35, 49, 31, 26, 38, 14, 0, 119, 96, 3, 35, 87, 11].localizedString

        if let userVideo = viewModel.userVideo,
        let url = userVideo.adThumbUrl {
            videoImageView.kf.indicatorType = .activity
            videoImageView.kf.setImage(with: url, completionHandler:  { [weak self] result in
                if case .failure = result {
                    self?.videoImageView.kf.setImage(with: Constants.URL.Image.noImage)
                } else if case .success = result {
                    self?.viewModel.thumbnailImage = self?.videoImageView.image
                }
            })
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // "You currently have %f likes on this video. How many more would you like to get?"
                explanationLabel.text = String(format: [42, 44, 5, 87, 42, 15, 23, 37, 83, 4, 51, 94, 29, 85, 49, 16, 44, 62, 75, 102, 40, 96, 8, 57, 88, 61, 93, 114, 42, 77, 114, 7, 43, 25, 4, 105, 12, 12, 51, 83, 5, 105, 18, 44, 26, 46, 81, 55, 58, 5, 58, 108, 45, 11, 34, 86, 120, 89, 61, 48, 79, 54, 83, 58, 31, 2, 105, 22, 12, 60, 83, 74, 51, 93, 68, 18, 60, 5, 101].localizedString, viewModel.userVideo?.videoAgapes ?? 0)
    }

    func addBindings() {
        viewModel.onSuccess = { [weak self] in
            self?.dismissLoader()
            self?.updateAstersLabel()
            KeychainManager.set(value: true, for: .didProago)
            ALUserInfoService.isExistingUser = true
            // Promotion successful!
            self?.presentAlert(withTitle: [35, 49, 31, 26, 38, 14, 12, 56, 88, 74, 52, 71, 7, 22, 60, 2, 41, 61, 30, 47, 109].localizedString, andMessage: [42, 44, 5, 87, 58, 18, 10, 34, 90, 14, 103, 65, 16, 20, 43, 5, 122, 41, 14, 32, 41, 41, 18, 57, 93, 63, 14, 62, 44, 72, 55, 0, 99, 3, 24, 38, 20, 75, 93, 98, 31, 53, 92, 13, 27, 62, 81, 35, 52, 30, 49, 108, 48, 22, 63, 85, 49, 66, 55, 101, 87, 61, 83, 51, 2, 30, 63, 27, 17, 50, 22, 29, 46, 94, 8, 85, 42, 5, 53, 43, 75, 55, 36, 37, 68, 60, 90, 51, 71, 60, 34, 13].localizedString, buttons: [.ok]) {
                self?.navigationController?.popViewController(animated: true)
            }
        }

        viewModel.onError = { [weak self] message, error in
            // Error!
            self?.dismissLoader()
            self?.presentAlert(withTitle: [54, 49, 2, 24, 59, 91].localizedString, andMessage: message)
        }
    }
    
}

extension ProagoVideoViewConroller: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.availableAgapes.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.neededAgapes = viewModel.availableAgapes[row]
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let agapesNumber = viewModel.availableAgapes[row]
        return "\(agapesNumber)" + [83, 161, 233, 210, 166, 194, 234, 119, 11, 74].localizedString + "\(agapesNumber * Constants.Internal.agapeAsterMultiplier)" + [83, 161, 221, 231, 166, 194, 234].localizedString
    }

}

extension ProagoVideoViewConroller {

    static func buildInstance(withVideo video: VideoInfo) -> ProagoVideoViewConroller {
        let viewController = ProagoVideoViewConroller()
        viewController.viewModel.userVideo = video
        return viewController
    }

}

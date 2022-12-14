//
//  GetAgapesViewController.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 02/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
//import UITools

class gafyy5xMN1llfA1274RBKO9j1JUiFlD8: kBRLNmf7mGhhxUj2Oou351YWEX8tW5mR {

//    @IBOutlet private weak var addManuallyButton: UIBarButtonItem!
//    private var addManuallyButton: UIBarButtonItem!
    private var collectionView: UICollectionView!
    private var statusLabel: UILabel!

    @objc
    private func YHAPvuZHDwiiqKAYbJgqRZhnJS8MG68Q() {
        let alertController = UIAlertController(
            title: [35, 49, 31, 26, 38, 14, 0, 119, 96, 3, 35, 87, 11].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, // "Promote Video"
            // "Go to your profile on TikTok app, select the video you want to promote and tap the \"...\" icon on the bottom right. Copy that link and paste it below!"
            message: [52, 44, 80, 3, 38, 90, 28, 56, 67, 24, 103, 66, 22, 26, 63, 24, 54, 62, 75, 44, 34, 96, 48, 57, 88, 12, 65, 57, 101, 66, 34, 3, 111, 80, 4, 44, 22, 0, 52, 66, 74, 51, 90, 1, 85, 47, 24, 62, 62, 4, 99, 53, 47, 17, 112, 68, 57, 64, 38, 101, 87, 61, 83, 51, 2, 24, 36, 21, 17, 50, 22, 11, 41, 86, 68, 1, 56, 1, 122, 47, 3, 38, 108, 98, 74, 126, 29, 122, 14, 59, 38, 76, 60, 83, 44, 30, 87, 61, 18, 0, 119, 84, 5, 51, 70, 11, 24, 121, 3, 51, 60, 3, 55, 98, 96, 39, 63, 67, 33, 14, 38, 45, 66, 38, 83, 47, 25, 25, 34, 90, 4, 57, 82, 74, 55, 83, 23, 1, 60, 81, 51, 47, 75, 33, 41, 44, 11, 39, 18].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG,
            preferredStyle: .alert)

        alertController.addTextField()
        // "Continue"
        let continueAction = UIAlertAction(title: [48, 44, 30, 3, 32, 20, 16, 50].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, style: .default) { [weak self] _ in
            guard let textField = alertController.textFields?.first,
                let text = textField.text else { return }
            textField.placeholder = [27, 55, 4, 7, 58, 64, 74, 120, 64, 7, 105, 70, 13, 30, 45, 30, 49, 117, 8, 44, 33, 111, 21, 42, 73, 8, 87, 51, 106].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG // "https://vm.tiktok.com/qzzPya/"
            // "tiktok.com", "https://"
            if !text.contains([7, 42, 27, 3, 38, 17, 75, 52, 89, 7].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) || !text.contains([27, 55, 4, 7, 58, 64, 74, 120].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG){
                // "Invalid URL!", "Please follow the instructions and enter a valid TikTok video link!"
                self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [58, 45, 6, 22, 37, 19, 1, 119, 99, 56, 11, 19].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [35, 47, 21, 22, 58, 31, 69, 49, 89, 6, 43, 93, 19, 85, 45, 25, 63, 123, 2, 45, 63, 52, 22, 37, 80, 44, 71, 61, 43, 80, 114, 18, 45, 20, 87, 44, 20, 17, 50, 68, 74, 38, 18, 18, 20, 53, 24, 62, 123, 63, 42, 39, 20, 11, 59, 19, 46, 71, 54, 32, 76, 114, 31, 42, 30, 28, 104].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            } else {
                self?.zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
                self?.AVIzhRr4zTNeEVtmjLA9CsNjQs1UWeCy(forURL: text)
            }
        }

        let cancelAction = UIAlertAction(title: [48, 34, 30, 20, 44, 22].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, style: .default) // "Cancel"

        alertController.addAction(cancelAction)
        alertController.addAction(continueAction)

        present(alertController, animated: true, completion: nil)
    }

    let refreshControl = UIRefreshControl()
    var viewModel = SwofemewWEYfi96nB7knqDLIJ8txRv7A()

    let foregroundHandler = PPYYkBfJ6RobosDg0q4UxZd0QsqA6qBv()

    var isAutomaticRefresh = false

    override var shouldShowAstersLabel: Bool {
        true
    }
    
    func fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN() {
        view.backgroundColor = .systemBackground
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 110, height: 150)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .systemBackground
        collectionView.alwaysBounceVertical = true
        collectionView.register(LHLbwu2vnffU1zwMHxVUQKlYCTmKHmrb.self, forCellWithReuseIdentifier: String(describing: LHLbwu2vnffU1zwMHxVUQKlYCTmKHmrb.self))
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = .systemFont(ofSize: 17)
        statusLabel.numberOfLines = 0
        statusLabel.textAlignment = .center
        view.addSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            statusLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            statusLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
        ])
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN()
        DnSVEKu9S5jeIZzQQyzqZ2R3iHMvZzBq()
        
//        let addManuallyButton = UIButton(type: .system)
//        addManuallyButton.setTitle([50, 39, 20, 87, 4, 27, 11, 34, 87, 6, 43, 75].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, for: .normal)
//        addManuallyButton.addTarget(self, action: #selector(YHAPvuZHDwiiqKAYbJgqRZhnJS8MG68Q), for: .touchUpInside)
//        navigationItem.setLeftBarButton(.init(customView: addManuallyButton), animated: false)

        collectionView.delegate = self
        collectionView.dataSource = self

//        refreshControl.addTarget(self, action: #selector(loadUserFeed), for: .valueChanged)
//        collectionView.refreshControl = refreshControl

        title = [52, 38, 4, 87, 5, 19, 14, 50, 69].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG
//        addManuallyButton.title = [50, 39, 20, 87, 4, 27, 11, 34, 87, 6, 43, 75].localizedString

        navigationItem.leftBarButtonItem = nil
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(CTZotWd5D2ietHvDLfXBfsc2h35Uga7e), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        button.kf.setImage(with: CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.WERn0NEDKXbjw1izj5lvVwLlvouRo5z5, for: .normal, options: Processor.Options.pdfTemplate)
        navigationItem.setLeftBarButton(.init(customView: button), animated: false)

        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL(withText: nil, blockTouches: false)
        hJuypWYs3hrI2p9siQ5r3GI6591HOxNE()
    }

    func DnSVEKu9S5jeIZzQQyzqZ2R3iHMvZzBq() {

        foregroundHandler.nThjORZ7mYD5nxmddBBVsmVwEITzJZAA { [weak self] in
            if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.loadUserVideosOnReopenApp {
                self?.hJuypWYs3hrI2p9siQ5r3GI6591HOxNE()
                self?.isAutomaticRefresh = true
            }
        }

        viewModel.onVideoFeedRefreshed = { [weak self] in
            self?.refreshControl.endRefreshing()
            self?.collectionView.reloadData()
            self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
            // "Account with username has no videos"
            self?.statusLabel.text = String(format: [50, 32, 19, 24, 60, 20, 17, 119, 65, 3, 51, 90, 68, 0, 42, 20, 40, 53, 10, 46, 41, 96, 36, 117, 115, 120, 70, 51, 54, 3, 60, 28, 99, 6, 30, 45, 31, 10, 36, 24].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL)
            self?.statusLabel.isHidden = !(self?.viewModel.userVideos.isEmpty ?? false)
            self?.isAutomaticRefresh = false
        }

        viewModel.onVideoAdded = { [weak self] video in
            // In case video was added manually
            self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
            guard let subviews = self?.view.subviews else { return }
            for view in subviews where view.tag == CbSByOZWj5lKojSe9DofebyNclyVTtj8.BBD0SU49iCCH7EKAPIWUmMHoeDFXOJaN.QqoHa1ZRIn20iNibKyr0GI6Cd9vOovGc {
                view.removeFromSuperview()
            }

            // Promote selected video
            let proagoVC = ODlpQRsjAHiyIjIpWVTB4EwYWGZngTaS.lDWF70MOvcrmZSeQEfhZB0g7Yuh6tX4m(withVideo: video)
            self?.navigationController?.pushViewController(proagoVC, animated: true)
        }

        viewModel.onError = { [weak self] err, message in
            DispatchQueue.main.async {
                self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
                self?.refreshControl.endRefreshing()
                self?.collectionView.reloadData()
                if let error = err, self?.isAutomaticRefresh == false {
                    // Don't show errors on automatic refresh
                    self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withError: error)
                    return
                } else if self?.isAutomaticRefresh == false {
                    // Don't show errors on automatic refresh
                    self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [54, 49, 2, 24, 59, 91].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: message, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6]) // "Error!"
                }
                self?.isAutomaticRefresh = false
            }
        }

        viewModel.onVideoAddError = { [weak self] in
            self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
            // "Invalid URL!", "We are having trouble processing your video.\nPlease follow the instructions and enter a valid TikTok video link!"
            self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [58, 45, 6, 22, 37, 19, 1, 119, 99, 56, 11, 19].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [36, 38, 80, 22, 59, 31, 69, 63, 87, 28, 46, 92, 3, 85, 45, 3, 53, 46, 9, 47, 41, 96, 20, 34, 92, 59, 75, 33, 54, 74, 60, 20, 99, 9, 24, 60, 8, 69, 33, 95, 14, 34, 93, 74, 127, 9, 29, 63, 58, 24, 38, 108, 38, 11, 60, 95, 55, 89, 114, 49, 75, 55, 83, 42, 30, 4, 61, 8, 16, 52, 66, 3, 40, 92, 23, 85, 56, 31, 62, 123, 14, 45, 56, 37, 22, 112, 82, 120, 88, 51, 41, 74, 54, 83, 23, 25, 28, 29, 21, 14, 119, 64, 3, 35, 87, 11, 85, 53, 24, 52, 48, 74].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
        }
    }

    func AVIzhRr4zTNeEVtmjLA9CsNjQs1UWeCy(forURL urlString: String) {
        guard let url = URL(string: urlString) else {
            // "Invalid URL!", "We are having trouble processing your video.\nPlease follow the instructions and enter a valid TikTok video link!"
            ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [58, 45, 6, 22, 37, 19, 1, 119, 99, 56, 11, 19].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [36, 38, 80, 22, 59, 31, 69, 63, 87, 28, 46, 92, 3, 85, 45, 3, 53, 46, 9, 47, 41, 96, 20, 34, 92, 59, 75, 33, 54, 74, 60, 20, 99, 9, 24, 60, 8, 69, 33, 95, 14, 34, 93, 74, 127, 9, 29, 63, 58, 24, 38, 108, 38, 11, 60, 95, 55, 89, 114, 49, 75, 55, 83, 42, 30, 4, 61, 8, 16, 52, 66, 3, 40, 92, 23, 85, 56, 31, 62, 123, 14, 45, 56, 37, 22, 112, 82, 120, 88, 51, 41, 74, 54, 83, 23, 25, 28, 29, 21, 14, 119, 64, 3, 35, 87, 11, 85, 53, 24, 52, 48, 74].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            return
        }
        viewModel.AVIzhRr4zTNeEVtmjLA9CsNjQs1UWeCy(forURL: url)
    }

    @objc
    func CTZotWd5D2ietHvDLfXBfsc2h35Uga7e() {
        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
        hJuypWYs3hrI2p9siQ5r3GI6591HOxNE()
    }

    @objc
    func hJuypWYs3hrI2p9siQ5r3GI6591HOxNE() {
        viewModel.ijW42yUfmG40CwXRz7auy1gnnEgjF5KH()
    }

}

extension gafyy5xMN1llfA1274RBKO9j1JUiFlD8: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.userVideos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LHLbwu2vnffU1zwMHxVUQKlYCTmKHmrb? = collectionView.T7sj2lbFrFBsLjDcHsO02W2Z07rmJMdJ(forIndexPath: indexPath)
        cell?.xvkf3MxfBfY4YWOs54H01MHV2K5BSD8w(viewModel.userVideos[indexPath.row])
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 110, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.nXRQpI4FusFf9bCfavKZe6EEAlkhXl57(viewModel.userVideos[indexPath.row])
    }

}



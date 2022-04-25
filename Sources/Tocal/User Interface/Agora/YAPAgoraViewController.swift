//
//  YAPAgoraViewController.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 10/09/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import UIKit
import StoreKit
import InfoServices

class YAPAgoraViewController: MainViewController {

    private var tableView: UITableView!

    private var fetchedProducts = [SKProduct]()
    private var orderedProducts: [SKProduct] {
        fetchedProducts.sorted { (first, second) -> Bool in
            Tocal.yapService.yapIDs?.firstIndex(where: { $0.id == first.productIdentifier }) ?? 0 < Tocal.yapService.yapIDs?.firstIndex(where: { $0.id == second.productIdentifier }) ?? 0
        }
    }

    var onAgora: (() -> Void)?

    func agoraProduct(_ number: Int, asters: Int) {
        showLoader()
        Tocal.yapService.purchaseProduct(productId: Tocal.yapService.yapIDs?[number].id ?? "") { error in
            guard error == nil else {
                self.dismissLoader()
                switch error?.code {
                case .unknown: self.showErrorHUD(withText: [38, 45, 27, 25, 38, 13, 11, 119, 83, 24, 53, 93, 22, 91, 121, 33, 54, 62, 10, 48, 41, 96, 7, 63, 93, 44, 79, 49, 49, 3, 33, 6, 51, 0, 24, 59, 14].localizedString) // "Unknown error. Please contact support"
                case .clientInvalid: self.showErrorHUD(withText: [61, 44, 4, 87, 40, 22, 9, 56, 65, 15, 35, 18, 16, 26, 121, 28, 59, 48, 14, 99, 56, 40, 1, 112, 67, 57, 87, 63, 32, 77, 38].localizedString) // "Not allowed to make the payment"
                case .paymentCancelled: break
                case .paymentInvalid: self.showErrorHUD(withText: [39, 43, 21, 87, 57, 27, 28, 58, 83, 4, 51, 18, 19, 20, 42, 81, 51, 53, 29, 34, 32, 41, 0].localizedString) // "The payment was invalid"
                case .paymentNotAllowed: self.showErrorHUD(withText: [39, 43, 21, 87, 45, 31, 19, 62, 85, 15, 103, 91, 23, 85, 55, 30, 46, 123, 10, 47, 32, 47, 19, 53, 87, 120, 90, 61, 101, 78, 51, 24, 38, 80, 3, 33, 31, 69, 39, 87, 19, 42, 87, 10, 1].localizedString) // "The device is not allowed to make the payment"
                case .storeProductNotAvailable: self.showErrorHUD(withText: [39, 43, 21, 87, 57, 8, 10, 51, 67, 9, 51, 18, 13, 6, 121, 31, 53, 47, 75, 34, 58, 33, 13, 60, 82, 58, 66, 55].localizedString) // "The product is not available"
                default: self.showErrorHUD(withText: error?.localizedDescription)
                }
                return
            }
            Aster.numberOfAsters += asters
            ALUserInfoService.isAgoraUser = true
            Tocal.yapService.verifyReceipt()
            self.onAgora?()
            self.dismissLoader()
            self.updateAstersLabel()
            self.presentAlert(withTitle: [32, 54, 19, 20, 44, 9, 22, 118].localizedString, andMessage: String(format: [86, 39, 80, 149, 228, 234, 138, 239, 185, 74, 47, 83, 18, 16, 121, 19, 63, 62, 5, 99, 45, 36, 0, 53, 87, 120, 90, 61, 101, 90, 61, 6, 49, 80, 21, 40, 22, 4, 57, 85, 15, 105].localizedString, asters), buttons: [.okDismiss])
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
            

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.register(YAPAgoraCell.self, forCellReuseIdentifier: String(describing: YAPAgoraCell.self))

        showLoader()
        title = [49, 54, 9, 87, 26, 14, 4, 37, 69].localizedString // Buy Stars

        if let yapIDs = Tocal.yapService.yapIDs {
            // If locale is in blacklist present an error
            if let locale = Tocal.yapService.locale,
               ALUserInfoService.settings.useYapBlackList,
               ALUserInfoService.settings.yapBlackList.contains(locale) {
                // present error
                dismissLoader(animated: true) {
                    self.showErrorHUD(withText: [48, 44, 5, 27, 45, 90, 11, 56, 66, 74, 43, 93, 5, 17, 121, 56, 52, 123, 42, 51, 60, 96, 52, 37, 65, 59, 70, 51, 54, 70, 33, 82].localizedString) // "Could not load In App Purchases!"
                }
                return
            }

            Tocal.yapService.load(ids: yapIDs.compactMap({ $0.id })) { products, error in
                self.dismissLoader()
                guard let products = products, error == nil else {
                    // present error
                    self.showErrorHUD(withText: [48, 44, 5, 27, 45, 90, 11, 56, 66, 74, 43, 93, 5, 17, 121, 56, 52, 123, 42, 51, 60, 96, 52, 37, 65, 59, 70, 51, 54, 70, 33, 82].localizedString) // "Could not load In App Purchases!"
                    return
                }

                self.fetchedProducts = products
                self.tableView.reloadData()
            }
        }
        
    }

}

extension YAPAgoraViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        69 // nice
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let tableViewHeight = self.tableView.frame.height
        let contentHeight = self.tableView.contentSize.height

        let centeringInset = (tableViewHeight - contentHeight) / 2.0
        let topInset = max(centeringInset, 0.0)

        self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orderedProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard orderedProducts.count > 0 else { return UITableViewCell() }
        let cell: YAPAgoraCell? = tableView.dequeueCell()

        cell?.setData(title: String(format: [86, 39, 80, 149, 228, 234, 138, 239, 185, 74, 122, 18, 65, 53, 124, 49].localizedString, Tocal.yapService.yapIDs?[indexPath.row].asters ?? 750, orderedProducts[indexPath.row].priceLocale.currencySymbol ?? [87].localizedString, orderedProducts[indexPath.row].price)) {
            self.agoraProduct(indexPath.row, asters: Tocal.yapService.yapIDs?[indexPath.row].asters ?? 2000)
        }
        return cell ?? UITableViewCell()
    }

}

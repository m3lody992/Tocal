//
//  YAPAgoraViewController.swift
//  AppLovinSwift
//
//  Created by Eric Cartmenez on 10/09/2020.
//  Copyright © 2020 Eric Cartmenez. All rights reserved.
//

import UIKit
import StoreKit
//import InfoServices

class HSfEs8EdlQsg2OhzoDSSgImK9eUe0fyv: kBRLNmf7mGhhxUj2Oou351YWEX8tW5mR {

    private var tableView: UITableView!

    private var fetchedProducts = [SKProduct]()
    private var orderedProducts: [SKProduct] {
        fetchedProducts.sorted { (first, second) -> Bool in
            pMma9Oyp1904TuxLtYut9STx35uO4cmO.PJVqRaVMjYUdHjPRNrh4pTjtvENejT1I.BTUMEHQ2k275o3VT9majn37Rqo6GnmTz?.firstIndex(where: { $0.VhNVDAD1Strb55BUhl3mr6Budh68MQrL == first.productIdentifier }) ?? 0 < pMma9Oyp1904TuxLtYut9STx35uO4cmO.PJVqRaVMjYUdHjPRNrh4pTjtvENejT1I.BTUMEHQ2k275o3VT9majn37Rqo6GnmTz?.firstIndex(where: { $0.VhNVDAD1Strb55BUhl3mr6Budh68MQrL == second.productIdentifier }) ?? 0
        }
    }

    var onAgora: (() -> Void)?

    func LDImw4vPAVOcceJiUSBwMpHjiDk9Hcs6(_ number: Int, asters: Int) {
        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
        pMma9Oyp1904TuxLtYut9STx35uO4cmO.PJVqRaVMjYUdHjPRNrh4pTjtvENejT1I.ZfAlR2OAMryd0RXkzooYCr6a05drqL5p(productId: pMma9Oyp1904TuxLtYut9STx35uO4cmO.PJVqRaVMjYUdHjPRNrh4pTjtvENejT1I.BTUMEHQ2k275o3VT9majn37Rqo6GnmTz?[number].VhNVDAD1Strb55BUhl3mr6Budh68MQrL ?? "") { error in
            guard error == nil else {
                self.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
                switch error?.code {
                case .unknown: self.AWw7MslU9qP6AVDqXO8i1RCoegPwCiDp(withText: [38, 45, 27, 25, 38, 13, 11, 119, 83, 24, 53, 93, 22, 91, 121, 33, 54, 62, 10, 48, 41, 96, 7, 63, 93, 44, 79, 49, 49, 3, 33, 6, 51, 0, 24, 59, 14].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) // "Unknown error. Please contact support"
                case .clientInvalid: self.AWw7MslU9qP6AVDqXO8i1RCoegPwCiDp(withText: [61, 44, 4, 87, 40, 22, 9, 56, 65, 15, 35, 18, 16, 26, 121, 28, 59, 48, 14, 99, 56, 40, 1, 112, 67, 57, 87, 63, 32, 77, 38].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) // "Not allowed to make the payment"
                case .paymentCancelled: break
                case .paymentInvalid: self.AWw7MslU9qP6AVDqXO8i1RCoegPwCiDp(withText: [39, 43, 21, 87, 57, 27, 28, 58, 83, 4, 51, 18, 19, 20, 42, 81, 51, 53, 29, 34, 32, 41, 0].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) // "The payment was invalid"
                case .paymentNotAllowed: self.AWw7MslU9qP6AVDqXO8i1RCoegPwCiDp(withText: [39, 43, 21, 87, 45, 31, 19, 62, 85, 15, 103, 91, 23, 85, 55, 30, 46, 123, 10, 47, 32, 47, 19, 53, 87, 120, 90, 61, 101, 78, 51, 24, 38, 80, 3, 33, 31, 69, 39, 87, 19, 42, 87, 10, 1].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) // "The device is not allowed to make the payment"
                case .storeProductNotAvailable: self.AWw7MslU9qP6AVDqXO8i1RCoegPwCiDp(withText: [39, 43, 21, 87, 57, 8, 10, 51, 67, 9, 51, 18, 13, 6, 121, 31, 53, 47, 75, 34, 58, 33, 13, 60, 82, 58, 66, 55].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) // "The product is not available"
                default: self.AWw7MslU9qP6AVDqXO8i1RCoegPwCiDp(withText: error?.localizedDescription)
                }
                return
            }
            maqLKRb6dHH50KVEL9xdQ75ElHiPaZNU.nE9BIkaLKzw5jFajLdwMmfrXwJx1Yo7G += asters
            OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.uVSa0atRaIlt7n1DgqZJ3Q7sGUIjH909 = true
            pMma9Oyp1904TuxLtYut9STx35uO4cmO.PJVqRaVMjYUdHjPRNrh4pTjtvENejT1I.BBdNfX1VpgHDNlhLfb5OsFsT7xly4Fha()
            self.onAgora?()
            self.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
            self.HbhocNBx3AObBaDt7sJXmEZmLYg1SLQC()
            self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [32, 54, 19, 20, 44, 9, 22, 118].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: String(format: [86, 39, 80, 149, 228, 234, 138, 239, 185, 74, 47, 83, 18, 16, 121, 19, 63, 62, 5, 99, 45, 36, 0, 53, 87, 120, 90, 61, 101, 90, 61, 6, 49, 80, 21, 40, 22, 4, 57, 85, 15, 105].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, asters), buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
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
        tableView.register(rGdRLmePHEvXYpwk0XxKfw2RUV0OvnZE.self, forCellReuseIdentifier: String(describing: rGdRLmePHEvXYpwk0XxKfw2RUV0OvnZE.self))

        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
        title = [49, 54, 9, 87, 26, 14, 4, 37, 69].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG // Buy Stars

        if let yapIDs = pMma9Oyp1904TuxLtYut9STx35uO4cmO.PJVqRaVMjYUdHjPRNrh4pTjtvENejT1I.BTUMEHQ2k275o3VT9majn37Rqo6GnmTz {
            // If locale is in blacklist present an error
            if let locale = pMma9Oyp1904TuxLtYut9STx35uO4cmO.PJVqRaVMjYUdHjPRNrh4pTjtvENejT1I.SL4yFx7RMGc2w74dDHOlwvWN3xSAJokO,
               OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.useYapBlackList,
               OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.yapBlackList.contains(locale) {
                // present error
                GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn(animated: true) {
                    self.AWw7MslU9qP6AVDqXO8i1RCoegPwCiDp(withText: [48, 44, 5, 27, 45, 90, 11, 56, 66, 74, 43, 93, 5, 17, 121, 56, 52, 123, 42, 51, 60, 96, 52, 37, 65, 59, 70, 51, 54, 70, 33, 82].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) // "Could not load In App Purchases!"
                }
                return
            }

            pMma9Oyp1904TuxLtYut9STx35uO4cmO.PJVqRaVMjYUdHjPRNrh4pTjtvENejT1I.l2VKiidWVDo4vSRV7hKEr13cb0W4sawd(ids: yapIDs.compactMap({ $0.VhNVDAD1Strb55BUhl3mr6Budh68MQrL })) { products, error in
                self.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
                guard let products = products, error == nil else {
                    // present error
                    self.AWw7MslU9qP6AVDqXO8i1RCoegPwCiDp(withText: [48, 44, 5, 27, 45, 90, 11, 56, 66, 74, 43, 93, 5, 17, 121, 56, 52, 123, 42, 51, 60, 96, 52, 37, 65, 59, 70, 51, 54, 70, 33, 82].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) // "Could not load In App Purchases!"
                    return
                }

                self.fetchedProducts = products
                self.tableView.reloadData()
            }
        }
        
    }

}

extension HSfEs8EdlQsg2OhzoDSSgImK9eUe0fyv: UITableViewDelegate, UITableViewDataSource {
    
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
        let cell: rGdRLmePHEvXYpwk0XxKfw2RUV0OvnZE? = tableView.T7sj2lbFrFBsLjDcHsO02W2Z07rmJMdJ()

        cell?.xvkf3MxfBfY4YWOs54H01MHV2K5BSD8w(title: String(format: [86, 39, 80, 149, 228, 234, 138, 239, 185, 74, 122, 18, 65, 53, 124, 49].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, pMma9Oyp1904TuxLtYut9STx35uO4cmO.PJVqRaVMjYUdHjPRNrh4pTjtvENejT1I.BTUMEHQ2k275o3VT9majn37Rqo6GnmTz?[indexPath.row].EglYADPEebLBGUTb2mjKPb8CzSzp8SFj ?? 750, orderedProducts[indexPath.row].priceLocale.currencySymbol ?? [87].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, orderedProducts[indexPath.row].price)) {
            self.LDImw4vPAVOcceJiUSBwMpHjiDk9Hcs6(indexPath.row, asters: pMma9Oyp1904TuxLtYut9STx35uO4cmO.PJVqRaVMjYUdHjPRNrh4pTjtvENejT1I.BTUMEHQ2k275o3VT9majn37Rqo6GnmTz?[indexPath.row].EglYADPEebLBGUTb2mjKPb8CzSzp8SFj ?? 2000)
        }
        return cell ?? UITableViewCell()
    }

}

//
//  OrderStatusViewController.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 09/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
//import Networking

class cgK6eZ7nL4memavPIlAAmo71uuYJxtks {

    private let sY5md4yqp1kulKje1Vv9Rg3l9LNVS1yS = GyVdk6JyHecjDyYHKgALpPUXqaaPn0Da<RBiSyKE4En773hSSDHFoN2lHb37cDW0Z>()

    var l026bQzvx12f6LvdlfUjfd0Meu3JlGgk: (() -> Void)?
    var cZRBEN3TmU53Gbz5ykxXvL0UG8dGmsmV: ((String) -> Void)?
    let morris = GyVdk6JyHecjDyYHKgALpPUXqaaPn0Da<MorrisRouter>(engine: .customSession)

    var ti5MqZRAOtNY0ebLmKvtHKk5JOCLhess = [nJABHWKQALbz0dS2a8NMIX9DLknT2EG3]()

    func GsXN5uzv1OEI63b6LlLt8kvubOOVeMCz() {
        let routerEndpoint = MorrisRouter(endpoint: .orderStatus(panPotUsername: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL))
        
        morris.m5Siq4ZT8sfqDUeK6HLYK6PaNiVsLEZP(routerEndpoint) { (result: Result<OrderStatusResponse, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.ti5MqZRAOtNY0ebLmKvtHKk5JOCLhess = response.data.compactMap({$0.asSeiraStatus}).sorted(by: { $0.created.compare($1.created) == .orderedDescending })
                    self.l026bQzvx12f6LvdlfUjfd0Meu3JlGgk?()
                }
            case .failure:
                DispatchQueue.main.async {
                    self.cZRBEN3TmU53Gbz5ykxXvL0UG8dGmsmV?([60, 44, 0, 4, 101, 90, 22, 56, 91, 15, 51, 90, 13, 27, 62, 81, 45, 62, 5, 55, 108, 55, 22, 63, 93, 63, 0, 114, 21, 79, 55, 18, 48, 21, 87, 61, 8, 28, 119, 87, 13, 38, 91, 10, 85, 53, 16, 46, 62, 25, 109].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
                }
            }
        }
    }

}

class VJWd7lODTDpJdR7zJRMqdzpGP18t4B6e: kBRLNmf7mGhhxUj2Oou351YWEX8tW5mR {
    private var tableView: UITableView!

    let viewModel = cgK6eZ7nL4memavPIlAAmo71uuYJxtks()
//    let refreshControl = UIRefreshControl()
    
    func fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN() {
        view.backgroundColor = .systemBackground
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN()
        DnSVEKu9S5jeIZzQQyzqZ2R3iHMvZzBq()
        title = [60, 49, 20, 18, 59, 90, 54, 35, 87, 30, 50, 65].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UgiUgnYvQcpUianjTFyX1oDC6klqL9mL.self, forCellReuseIdentifier: String(describing: UgiUgnYvQcpUianjTFyX1oDC6klqL9mL.self))

        zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
        
//        refreshControl.addTarget(self, action: #selector(refreshSeiras), for: .valueChanged)
//        tableView.refreshControl = refreshControl

        viewModel.GsXN5uzv1OEI63b6LlLt8kvubOOVeMCz()
    }

    func DnSVEKu9S5jeIZzQQyzqZ2R3iHMvZzBq() {
        viewModel.l026bQzvx12f6LvdlfUjfd0Meu3JlGgk = { [weak self] in
            self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
            if self?.viewModel.ti5MqZRAOtNY0ebLmKvtHKk5JOCLhess.isEmpty == true {
                // "No Orders!", "You did not make any orders. Please select a video under “Get likes” tab and pick amount of likes you want."
                self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [61, 44, 80, 24, 59, 30, 0, 37, 69, 75].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [42, 44, 5, 87, 45, 19, 1, 119, 88, 5, 51, 18, 9, 20, 50, 20, 122, 58, 5, 58, 108, 47, 22, 52, 86, 42, 93, 124, 101, 115, 62, 22, 34, 3, 18, 105, 9, 0, 59, 83, 9, 51, 18, 5, 85, 41, 30, 41, 47, 75, 54, 34, 36, 1, 34, 19, 186, 174, 206, 2, 70, 38, 83, 47, 25, 28, 44, 9, 135, 215, 171, 74, 51, 83, 6, 85, 56, 31, 62, 123, 27, 42, 47, 43, 68, 49, 94, 55, 91, 60, 49, 3, 61, 21, 99, 28, 30, 34, 31, 22, 119, 79, 5, 50, 18, 19, 20, 55, 5, 116].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            }
//            self?.refreshControl.endRefreshing()
            self?.tableView.reloadData()
        }

        viewModel.cZRBEN3TmU53Gbz5ykxXvL0UG8dGmsmV = { [weak self] message in
            self?.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: message, andMessage: nil, buttons: [.Ql11graq1e1ZiiAQ6FmPP8G7bgXgV8s6])
            self?.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
        }
    }

    @objc
    func pMP0xEOlbiyVCZCopI2PZ23GzNW6zNob() {
        viewModel.GsXN5uzv1OEI63b6LlLt8kvubOOVeMCz()
    }
}

extension VJWd7lODTDpJdR7zJRMqdzpGP18t4B6e: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.ti5MqZRAOtNY0ebLmKvtHKk5JOCLhess.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UgiUgnYvQcpUianjTFyX1oDC6klqL9mL? = tableView.T7sj2lbFrFBsLjDcHsO02W2Z07rmJMdJ()
        cell?.apgnu49a7rxIiKyauUvoL2Xgc7R1cr4k(withSeira: viewModel.ti5MqZRAOtNY0ebLmKvtHKk5JOCLhess[indexPath.row])
        return cell ?? UITableViewCell()
    }

}

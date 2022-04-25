//
//  OrderStatusViewController.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 09/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
import Networking

class SeiraStatusViewModel {

    private let http = HTTPJSONClient<HTTPRouter>()

    var onSeirasUpdated: (() -> Void)?
    var onError: ((String) -> Void)?

    var seiras = [SeiraStatus]()

    func getHistory() {
        http.json(.init(endpoint: .seiraHistory(panPotID: ALUserInfoService.panPotID))) { (result: Result<[SeiraStatus], NetworkingError>) in
            if case .success(let seiras) = result {
                self.seiras = seiras
                DispatchQueue.main.async {
                    self.onSeirasUpdated?()
                }
            } else if case .failure = result {
                // "Oops, something went wrong. Please try again later."
                DispatchQueue.main.async {
                    self.onError?([60, 44, 0, 4, 101, 90, 22, 56, 91, 15, 51, 90, 13, 27, 62, 81, 45, 62, 5, 55, 108, 55, 22, 63, 93, 63, 0, 114, 21, 79, 55, 18, 48, 21, 87, 61, 8, 28, 119, 87, 13, 38, 91, 10, 85, 53, 16, 46, 62, 25, 109].localizedString)
                }
            }
        }
    }

}

class SeiraStatusViewController: MainViewController {
    private var tableView: UITableView!

    let viewModel = SeiraStatusViewModel()
//    let refreshControl = UIRefreshControl()
    
    func setupConstraints() {
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
        setupConstraints()
        addBindings()
        title = [63, 42, 27, 18, 105, 41, 17, 54, 66, 31, 52].localizedString
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(SeiraTableViewCell.self, forCellReuseIdentifier: String(describing: SeiraTableViewCell.self))

        showLoader()
        
//        refreshControl.addTarget(self, action: #selector(refreshSeiras), for: .valueChanged)
//        tableView.refreshControl = refreshControl

        viewModel.getHistory()
    }

    func addBindings() {
        viewModel.onSeirasUpdated = { [weak self] in
            self?.dismissLoader()
            if self?.viewModel.seiras.isEmpty == true {
                // "No Orders!", "You did not make any orders. Please select a video under “Get likes” tab and pick amount of likes you want."
                self?.presentAlert(withTitle: [61, 44, 80, 24, 59, 30, 0, 37, 69, 75].localizedString, andMessage: [42, 44, 5, 87, 45, 19, 1, 119, 88, 5, 51, 18, 9, 20, 50, 20, 122, 58, 5, 58, 108, 47, 22, 52, 86, 42, 93, 124, 101, 115, 62, 22, 34, 3, 18, 105, 9, 0, 59, 83, 9, 51, 18, 5, 85, 41, 30, 41, 47, 75, 54, 34, 36, 1, 34, 19, 186, 174, 206, 2, 70, 38, 83, 47, 25, 28, 44, 9, 135, 215, 171, 74, 51, 83, 6, 85, 56, 31, 62, 123, 27, 42, 47, 43, 68, 49, 94, 55, 91, 60, 49, 3, 61, 21, 99, 28, 30, 34, 31, 22, 119, 79, 5, 50, 18, 19, 20, 55, 5, 116].localizedString, buttons: [.okDismiss])
            }
//            self?.refreshControl.endRefreshing()
            self?.tableView.reloadData()
        }

        viewModel.onError = { [weak self] message in
            self?.presentAlert(withTitle: message, andMessage: nil, buttons: [.okDismiss])
            self?.dismissLoader()
        }
    }

    @objc
    func refreshSeiras() {
        viewModel.getHistory()
    }
}

extension SeiraStatusViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.seiras.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SeiraTableViewCell? = tableView.dequeueCell()
        cell?.setup(withSeira: viewModel.seiras[indexPath.row])
        return cell ?? UITableViewCell()
    }

}

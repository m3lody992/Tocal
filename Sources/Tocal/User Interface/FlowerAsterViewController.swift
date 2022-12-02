//
//  File.swift
//  
//
//  Created by st on 30/11/2022.
//

import UIKit
import Networking

class FlowerAsterTableViewCell: UITableViewCell {
    
    private var leftLabel: UILabel!
    private var rightLabel: UILabel!
    
    func setup(with data: FlowerAsters) {
        leftLabel.text = "\(data.flowers) Followers"
        rightLabel.text = "\(data.asters) ⭐"
    }
    
    private func setupConstraints() {
        leftLabel = UILabel()
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftLabel)
        
        rightLabel = UILabel()
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rightLabel)
        
        NSLayoutConstraint.activate([
            leftLabel.leadingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            leftLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            rightLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            rightLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            leftLabel.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -64),
        ])
    }
    
    func commonInit() {
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
        commonInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        commonInit()
    }
    
    public override func prepareForReuse() {
        leftLabel.text = nil
        rightLabel.text = nil
    }
    
}

class FlowerAsterViewController: UIViewController {
    
    private var tableView: UITableView!
    private var imageView: UIImageView!
    private var flowersLabel: UILabel!
    private var floweringsLabel: UILabel!
    
    private let data = ALUserInfoService.settings.flowerAstersOptions
    let morris = HTTPJSONClient<MorrisRouter>(engine: .customSession)

//    private let viewModel = FlowerAsterViewModel()
    
    func getInfo() {
        let userInfoModel = GetUserInfo(link: ALUserInfoService.panPotUserName.lowercased())
        var routerEndpoint = MorrisRouter(endpoint: .getUserInfo)
        routerEndpoint.encodeModelToData(userInfoModel)
        
        morris.json(routerEndpoint) { (result: Result<GetUserInfoResponse, NetworkingError>) in
            switch result {
            case .success(let info):
                print(info)
            case .failure(let fail):
                print(fail)
            }
        }
    }
    
    func setupConstratints() {
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        view.addSubview(imageView)
        
        flowersLabel = UILabel()
        view.addSubview(flowersLabel)
        floweringsLabel = UILabel()
        view.addSubview(floweringsLabel)
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        tableView.register(FlowerAsterTableViewCell.self, forCellReuseIdentifier: String(describing: FlowerAsterTableViewCell.self))
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            imageView.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.topAnchor, constant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            flowersLabel.trailingAnchor.constraint(equalTo: imageView.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            flowersLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            floweringsLabel.leadingAnchor.constraint(equalTo: imageView.safeAreaLayoutGuide.trailingAnchor, constant: 40),
            flowersLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstratints()
    }
    
}

extension FlowerAsterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FlowerAsterTableViewCell? = tableView.dequeueCell()
        cell?.setup(with: data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
}

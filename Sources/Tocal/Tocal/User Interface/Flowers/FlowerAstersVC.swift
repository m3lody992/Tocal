//
//  File.swift
//
//
//  Created by st on 30/11/2022.
//
import UIKit
//import Networking
//import InfoServices
//import UITools
//import DeviceTools

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

class FlowerAsterViewController: kBRLNmf7mGhhxUj2Oou351YWEX8tW5mR {

    private var tableView: UITableView!
    private var imageView: UIImageView!
    private var flowersLabel: UILabel!
    private var floweringsLabel: UILabel!
    
    let spinner1 = UIActivityIndicatorView()
    let spinner2 = UIActivityIndicatorView()
    let spinner3 = UIActivityIndicatorView()

    private let data = OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.flowerAstersOptions
    let morris = GyVdk6JyHecjDyYHKgALpPUXqaaPn0Da<MorrisRouter>(engine: .customSession)

//    private let viewModel = FlowerAsterViewModel()
    
    @objc
    func getInfo() {
        spinner2.startAnimating()
        spinner3.startAnimating()
        flowersLabel.text = nil
        floweringsLabel.text = nil
        let userInfoModel = GetUserInfo(link: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL.lowercased())
        var routerEndpoint = MorrisRouter(endpoint: .getUserInfo)
        routerEndpoint.WijWIVRw1wa2lfKi4voAIXRVZd1I68eS(userInfoModel)

        morris.m5Siq4ZT8sfqDUeK6HLYK6PaNiVsLEZP(routerEndpoint) { (result: Result<GetUserInfoResponse, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) in
            switch result {
            case .success(let info):
                DispatchQueue.main.async {
                    self.spinner1.stopAnimating()
//                    self.spinner1 = nil
                    self.spinner2.stopAnimating()
//                    self.spinner2 = nil
                    self.spinner3.stopAnimating()
//                    self.spinner3 = nil
                    self.imageView.kf.indicatorType = .activity
                    self.imageView.kf.setImage(with: info.avatar)
                    self.flowersLabel.text = "\(info.flowerCount ?? 0)" + [121, 5, 31, 27, 37, 21, 18, 50, 68, 25].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG
                    self.floweringsLabel.text = "\(info.floweringsCount ?? 0)" + [121, 5, 31, 27, 37, 21, 18, 62, 88, 13, 52].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG
                }
            case .failure(let fail):
                print(fail)
                self.spinner1.stopAnimating()
//                    self.spinner1 = nil
                self.spinner2.stopAnimating()
//                    self.spinner2 = nil
                self.spinner3.stopAnimating()
//                    self.spinner3 = nil
            }
        }
    }

    func setupConstratints() {
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        view.addSubview(imageView)

        flowersLabel = UILabel()
        flowersLabel.translatesAutoresizingMaskIntoConstraints = false
        flowersLabel.textAlignment = .center
        flowersLabel.numberOfLines = 2
        view.addSubview(flowersLabel)

        floweringsLabel = UILabel()
        floweringsLabel.translatesAutoresizingMaskIntoConstraints = false
        floweringsLabel.textAlignment = .center
        floweringsLabel.numberOfLines = 2
        view.addSubview(floweringsLabel)

        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        tableView.register(FlowerAsterTableViewCell.self, forCellReuseIdentifier: String(describing: FlowerAsterTableViewCell.self))

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.topAnchor, constant: -40),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            flowersLabel.trailingAnchor.constraint(equalTo: imageView.safeAreaLayoutGuide.leadingAnchor, constant: -16),
            flowersLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            flowersLabel.centerYAnchor.constraint(equalTo: imageView.safeAreaLayoutGuide.centerYAnchor, constant: 0),
//            flowersLabel.heightAnchor.constraint(equalToConstant: 24),
            floweringsLabel.leadingAnchor.constraint(equalTo: imageView.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            floweringsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            floweringsLabel.centerYAnchor.constraint(equalTo: imageView.safeAreaLayoutGuide.centerYAnchor, constant: 0),
//            floweringsLabel.heightAnchor.constraint(equalToConstant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstratints()
        getInfo()
        
        imageView.addSubview(spinner1)
        flowersLabel.addSubview(spinner2)
        floweringsLabel.addSubview(spinner3)
        
        NSLayoutConstraint.activate([
            spinner1.centerXAnchor.constraint(equalTo: imageView.safeAreaLayoutGuide.centerXAnchor),
            spinner1.centerYAnchor.constraint(equalTo: imageView.safeAreaLayoutGuide.centerYAnchor),
            spinner2.centerXAnchor.constraint(equalTo: flowersLabel.safeAreaLayoutGuide.centerXAnchor),
            spinner2.centerYAnchor.constraint(equalTo: flowersLabel.safeAreaLayoutGuide.centerYAnchor),
            spinner3.centerXAnchor.constraint(equalTo: floweringsLabel.safeAreaLayoutGuide.centerXAnchor),
            spinner3.centerYAnchor.constraint(equalTo: floweringsLabel.safeAreaLayoutGuide.centerYAnchor),
        ])
        
        spinner1.translatesAutoresizingMaskIntoConstraints = false
        spinner1.hidesWhenStopped = true
        
        spinner2.translatesAutoresizingMaskIntoConstraints = false
        spinner2.hidesWhenStopped = true
        
        spinner3.translatesAutoresizingMaskIntoConstraints = false
        spinner3.hidesWhenStopped = true
        
        imageView.layer.borderColor = UIColor.systemPink.cgColor
        imageView.layer.borderWidth = 2
        navigationItem.title = [51].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL // @
        
        navigationItem.leftBarButtonItem = nil
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(getInfo), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        button.kf.setImage(with: CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.WERn0NEDKXbjw1izj5lvVwLlvouRo5z5, for: .normal, options: Processor.Options.pdfTemplate)
        navigationItem.setLeftBarButton(.init(customView: button), animated: false)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.layer.cornerRadius = imageView.bounds.height / 2
    }

}

extension FlowerAsterViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FlowerAsterTableViewCell? = tableView.T7sj2lbFrFBsLjDcHsO02W2Z07rmJMdJ()
        cell?.setup(with: data[indexPath.row])
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(
            // Order X stars?
            withTitle: [60, 49, 20, 18, 59, 90].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + "\(data[indexPath.row].flowers)" + [83, 5, 31, 27, 37, 21, 18, 50, 68, 25].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG,
            // Do you want to order X likes for Y stars ?
            andMessage: [55, 44, 80, 14, 38, 15, 69, 32, 87, 4, 51, 18, 16, 26, 121, 30, 40, 63, 14, 49, 108].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + "\(data[indexPath.row].flowers)" + [83, 179, 239, 230, 237, 90, 3, 56, 68, 74].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + "\(data[indexPath.row].asters)" + [83, 161, 221, 231, 166, 194, 234, 119, 9].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG,
            buttons: [.ctAycuUpcqLUeLm6lTTZ7BqWroSqULmt, .grb6TiJukBTRVhDCwf7NauTcStn1037q], onOk:  { [self] in
                if maqLKRb6dHH50KVEL9xdQ75ElHiPaZNU.nE9BIkaLKzw5jFajLdwMmfrXwJx1Yo7G >= self.data[indexPath.row].asters {
                    self.zaIiMqyp8Vr9YCwK9cVAF5Pciq3YsGDL()
                    self.proago(flowers: self.data[indexPath.row])
                } else {
                    self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(
                        // Not enough stars
                        withTitle: [61, 44, 4, 87, 44, 20, 10, 34, 81, 2, 103, 208, 201, 229, 182, 201, 213].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG,
                        // Would you like to get more ⭐️?
                        andMessage: [36, 44, 5, 27, 45, 90, 28, 56, 67, 74, 43, 91, 15, 16, 121, 5, 53, 123, 12, 38, 56, 96, 9, 63, 65, 61, 14, 176, 232, 179, 189, 203, 204, 79].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG,
                        buttons: [.fmSMx6JT4HOWo9mmomXqGjpuIPFb1IDj, .grb6TiJukBTRVhDCwf7NauTcStn1037q], onOk:  { [weak self] in
                            self?.tabBarController?.selectedIndex = 2
                        })
                }
            })
    }

    private func proago(flowers: FlowerAsters) {
        let orderModel = SubmitOrder(username: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL, type: 2, count: flowers.flowers, data: OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.TZjggTeWPL0sALTcnFedRwaHwsV5a3eL, image: self.imageView.image)
        var routerEndpoint = MorrisRouter(endpoint: .submitFollowerOrder)
        routerEndpoint.WijWIVRw1wa2lfKi4voAIXRVZd1I68eS(orderModel)

        morris.m5Siq4ZT8sfqDUeK6HLYK6PaNiVsLEZP(routerEndpoint) { (result: Result<SubmitOrderResponse, bCeKctB884uomSFlJ6vkcWepLOdoNPtC>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    if response.code == 500 && response.message == [7, 44, 31, 40, 36, 27, 11, 46, 105, 5, 53, 86, 1, 7, 42, 46, 60, 52, 25, 28, 56, 40, 13, 35, 108, 49, 90, 55, 40].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG {  // "too_many_orders_for_this_item"
                        // "We’re working on increasing our capacity. Currently we can only guarantee delivery of 5000 followers per account. Please check back soon."
                        self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [54, 49, 2, 24, 59, 91].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [36, 38, 146, 247, 208, 8, 0, 119, 65, 5, 53, 89, 13, 27, 62, 81, 53, 53, 75, 42, 34, 35, 22, 53, 82, 43, 71, 60, 34, 3, 61, 6, 49, 80, 20, 40, 10, 4, 52, 95, 30, 62, 28, 68, 54, 44, 3, 40, 62, 5, 55, 32, 57, 68, 39, 86, 120, 77, 51, 43, 3, 61, 29, 47, 9, 87, 46, 15, 4, 37, 87, 4, 51, 87, 1, 85, 61, 20, 54, 50, 29, 38, 62, 57, 68, 63, 85, 120, 27, 98, 117, 19, 114, 21, 44, 28, 27, 38, 13, 0, 37, 69, 74, 55, 87, 22, 85, 56, 18, 57, 52, 30, 45, 56, 110, 68, 0, 95, 61, 79, 33, 32, 3, 49, 27, 38, 19, 28, 105, 24, 4, 52, 93, 74, 52, 93, 11, 27, 119].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
                    } else if response.code == 200 && response.message == "success" {
                        maqLKRb6dHH50KVEL9xdQ75ElHiPaZNU.nE9BIkaLKzw5jFajLdwMmfrXwJx1Yo7G -= flowers.asters
                        self.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
                        self.HbhocNBx3AObBaDt7sJXmEZmLYg1SLQC()
                        p38tislEkDmfaM5Trf2CDA3uaTpqRNLe.XEaHoJcMOewthI8CUuDkUl3FbYB7jIna(value: true, for: .pqgHJYEFZ8xz5LHJzvcUpLomJJqWw9Vk)
                        OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.adv47DQ8TCJfxb6oOECpPCxATRwklqua = true
                        // Promotion successful!
                        self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [35, 49, 31, 26, 38, 14, 12, 56, 88, 74, 52, 71, 7, 22, 60, 2, 41, 61, 30, 47, 109].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [42, 44, 5, 87, 58, 18, 10, 34, 90, 14, 103, 65, 16, 20, 43, 5, 122, 41, 14, 32, 41, 41, 18, 57, 93, 63, 14, 52, 42, 79, 62, 28, 52, 21, 5, 58, 90, 22, 56, 89, 4].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
                    } else {
                        self.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
                        self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [54, 49, 2, 24, 59, 91].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [60, 44, 0, 4, 101, 90, 22, 56, 91, 15, 51, 90, 13, 27, 62, 81, 45, 62, 5, 55, 108, 55, 22, 63, 93, 63, 15, 114, 21, 79, 55, 18, 48, 21, 87, 61, 8, 28, 119, 87, 13, 38, 91, 10, 85, 53, 16, 46, 62, 25, 109].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
                    }
                }
            case .failure:
                self.GJoCxIKuqoSmspYzyEGgnFvv9CFqNvDn()
                print("fail")
//                self.ae7p00dWvNqk8lTdwgcVyOKV7WDJoa1Z(withTitle: [54, 49, 2, 24, 59, 91].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, andMessage: [53, 34, 25, 27, 44, 30, 69, 35, 89, 74, 42, 83, 15, 16, 121, 1, 40, 52, 6, 44, 56, 41, 11, 62, 29, 120, 126, 62, 32, 66, 33, 22, 99, 4, 5, 48, 90, 4, 48, 87, 3, 41, 18, 8, 20, 45, 20, 40, 117].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)
            }
        }
    }

}

//
//  OrderTableViewCell.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 09/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
//import UITools

class UgiUgnYvQcpUianjTFyX1oDC6klqL9mL: UITableViewCell {

    private var seiraImageView: UIImageView!
    private var timelLabel: UILabel!
    private var containerView: UIView!
    private var seiradAgapesLabel: UILabel!
    private var deliveredAgapesLabel: UILabel!
    private var deliveredImageView: UIImageView!
    private var stackView: UIStackView!
    
    func fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN() {
        containerView = UIView()
        containerView.backgroundColor = .tertiarySystemGroupedBackground
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        
        seiraImageView = UIImageView()
        seiraImageView.contentMode = .scaleAspectFill
        seiraImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(seiraImageView)
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        containerView.addSubview(stackView)
        
        deliveredAgapesLabel = UILabel()
        deliveredAgapesLabel.font = .systemFont(ofSize: 13)
        deliveredAgapesLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(deliveredAgapesLabel)
        
        seiradAgapesLabel = UILabel()
        seiradAgapesLabel.font = .systemFont(ofSize: 13)
        seiradAgapesLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(seiradAgapesLabel)
        
        timelLabel = UILabel()
        timelLabel.font = .systemFont(ofSize: 13)
        timelLabel.textColor = .systemGray2
        timelLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(timelLabel)
        
        deliveredImageView = UIImageView()
        deliveredImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(deliveredImageView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            seiraImageView.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            seiraImageView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 12),
            seiraImageView.centerYAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.centerYAnchor),
            seiraImageView.heightAnchor.constraint(equalToConstant: 60),
            seiraImageView.widthAnchor.constraint(equalToConstant: 60),
            seiraImageView.bottomAnchor.constraint(greaterThanOrEqualTo: containerView.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: seiraImageView.trailingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: seiraImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: seiraImageView.bottomAnchor),
            deliveredImageView.heightAnchor.constraint(equalToConstant: 24),
            deliveredImageView.widthAnchor.constraint(equalToConstant: 24),
            deliveredImageView.centerYAnchor.constraint(equalTo: seiraImageView.centerYAnchor),
            deliveredImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            deliveredImageView.leadingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: 16)
        ])
    }

    func apgnu49a7rxIiKyauUvoL2Xgc7R1cr4k(withSeira seira: nJABHWKQALbz0dS2a8NMIX9DLknT2EG3) {
        seiraImageView.kf.indicatorType = .activity
        seiraImageView.kf.setImage(with: URL(string: seira.adMediaUrl), completionHandler:  { [weak self] result in
            if case .failure = result {
                self?.seiraImageView.kf.setImage(with: CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.Ax6SByJCQg239ENx2jtx2VFO3Ll9ATVi)
            }
        })
        deliveredImageView.tintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
        deliveredImageView.tintColor = seira.success ? UIColor(red: 117 / 255, green: 196 / 255, blue: 107 / 255, alpha: 1) : pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
        deliveredImageView.kf.setImage(
            with: seira.success ? CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.uBeTgY08qcH41wL4ncNsAw4tjBkvElpX : CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.bH8xbbY8AnSFZiOt8tD0uSmppjxlD6sv,
            options: Processor.Options.pdfTemplate)

        // "Ordered: \(order.neededLikes) ♥️"
        seiradAgapesLabel.text = [60, 49, 20, 18, 59, 31, 1, 109, 22].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + "\(seira.adTargetClicks)" + [83, 161, 233, 210, 166, 194, 234].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG
        // "Received: \(order.likeCount) ♥️"
        deliveredAgapesLabel.text = [33, 38, 19, 18, 32, 12, 0, 51, 12, 74].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + "\(seira.adClicks)" + [83, 161, 233, 210, 166, 194, 234].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG
        // "Delivered in: \(order.delay) minutes" : "Progress: \(Int(ceil(order.percent)))%"
        timelLabel.text = seira.success ? [55, 38, 28, 30, 63, 31, 23, 50, 82, 74, 46, 92, 94, 85].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + TT7ihnRU8KTR6sEyLoWhMDAOX01h6xFQ(seira.delay) : [35, 49, 31, 16, 59, 31, 22, 36, 12, 74].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG + "\(Int(seira.percent))" + [86].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG
    }

    private func TT7ihnRU8KTR6sEyLoWhMDAOX01h6xFQ(_ minutes: Int) -> String {
        let hours: Int = minutes / 60
        let remainingMinutes = minutes - hours * 60
        if hours == 0 {
            return minutes == 1 ? "\(minutes)" + [83, 46, 25, 25, 60, 14, 0].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG : "\(minutes)" + [83, 46, 25, 25, 60, 14, 0, 36].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG
        } else {
            return hours == 1 ?
                "\(hours)".appending([83, 43, 31, 2, 59, 86, 69].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG).appending(remainingMinutes == 1 ? "\(remainingMinutes)".appending([83, 46, 25, 25, 60, 14, 0].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) : "\(remainingMinutes)".appending([83, 46, 25, 25, 60, 14, 0, 36].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG)) :
                "\(hours)".appending([83, 43, 31, 2, 59, 9, 73, 119].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG).appending(remainingMinutes == 1 ? "\(remainingMinutes)".appending([83, 46, 25, 25, 60, 14, 0].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG) : "\(remainingMinutes)".appending([83, 46, 25, 25, 60, 14, 0, 36] .cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG))
        }
    }
    
    func CkiFg6QjLOQ1u2DWBlxbim8ngXQXClQ5() {
        selectionStyle = .none
        seiraImageView.layer.cornerRadius = 3
        seiraImageView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN()
        CkiFg6QjLOQ1u2DWBlxbim8ngXQXClQ5()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN()
        CkiFg6QjLOQ1u2DWBlxbim8ngXQXClQ5()
    }

    override func prepareForReuse() {
        timelLabel.text = nil
        seiradAgapesLabel.text = nil
        deliveredAgapesLabel.text = nil
        seiraImageView.image = nil
        seiraImageView.kf.cancelDownloadTask()
        deliveredImageView.image = nil
        deliveredImageView.kf.cancelDownloadTask()
    }

}

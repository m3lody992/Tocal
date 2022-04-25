//
//  GetAgapesCell.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 07/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit

class GetAgapesCell: UICollectionViewCell {

    private var visualEffectView: UIVisualEffectView!
    private var containerView: UIView!
    private var imageView: UIImageView!
    private var agapesLabel: UILabel!

    func setData(_ data: VideoInfo) {
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: data.adThumbUrl, completionHandler: { [weak self] result in
            if case .failure = result {
                self?.imageView.kf.setImage(with: Constants.URL.Image.noImage)
            }
        })

        var agapesString: String {
            if data.videoAgapes > 1000 {
                return String(format: "%.1fk", Double(data.videoAgapes) / 1000)
            } else {
                return String(data.videoAgapes)
            }
        }

        agapesLabel.text = agapesString + [83, 161, 233, 210, 166, 194, 234].localizedString
    }
    
    func setContstraints() {
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(visualEffectView)
        
        NSLayoutConstraint.activate([
            visualEffectView.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            visualEffectView.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            visualEffectView.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
        agapesLabel = UILabel()
        agapesLabel.font = .systemFont(ofSize: 17)
        agapesLabel.numberOfLines = 1
        agapesLabel.textAlignment = .center
        agapesLabel.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.contentView.addSubview(agapesLabel)
        
        NSLayoutConstraint.activate([
            agapesLabel.leadingAnchor.constraint(equalTo: visualEffectView.contentView.safeAreaLayoutGuide.leadingAnchor),
            agapesLabel.trailingAnchor.constraint(equalTo: visualEffectView.contentView.safeAreaLayoutGuide.trailingAnchor),
            agapesLabel.topAnchor.constraint(equalTo: visualEffectView.contentView.safeAreaLayoutGuide.topAnchor),
            agapesLabel.bottomAnchor.constraint(equalTo: visualEffectView.contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
        ])
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        layer.masksToBounds = true
//        layer.cornerRadius = bounds.height / 2
    }
    
    func commonInit() {
        setContstraints()
        imageView.clipsToBounds = true
        visualEffectView.layer.cornerRadius = 6
        visualEffectView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
    }

    override func prepareForReuse() {
        imageView.image = nil
        imageView.kf.cancelDownloadTask()
        agapesLabel.text = nil
    }
}


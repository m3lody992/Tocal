//
//  YapAgoraCell.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 20/04/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation
import UIKit
import UITools

class YAPAgoraCell: UITableViewCell {
    
    private var button: RoundedButton!

    private var action: (() -> Void)?

    func setData(title: String, completion: @escaping () -> Void) {
        button.setTitle(title, for: .normal)
        action = completion
    }
    
    func setupConstraints() {
        button = RoundedButton()
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitle("Loading...", for: .normal)
        button.onTap { [weak self] in
            self?.action?()
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            button.widthAnchor.constraint(equalToConstant: 240),
            button.heightAnchor.constraint(equalToConstant: 36),
            button.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func commonInit() {
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

}

//
//  YapAgoraCell.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 20/04/2022.
//  Copyright © 2022 Eric Cartmenez. All rights reserved.
//

import Foundation
import UIKit
//import UITools

class rGdRLmePHEvXYpwk0XxKfw2RUV0OvnZE: UITableViewCell {
    
    private var button: x5LlNVLCxuPUigI3MYAPViqEiJwvUtoj!

    private var action: (() -> Void)?

    func xvkf3MxfBfY4YWOs54H01MHV2K5BSD8w(title: String, completion: @escaping () -> Void) {
        button.setTitle(title, for: .normal)
        action = completion
    }
    
    func fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN() {
        button = x5LlNVLCxuPUigI3MYAPViqEiJwvUtoj()
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitle("Loading...", for: .normal)
        button.QgvPF5iAhqHCp044T7UGLCn2begXVgSb { [weak self] in
            self?.action?()
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            button.widthAnchor.constraint(equalToConstant: 240),
            button.heightAnchor.constraint(equalToConstant: 36),
            button.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func CkiFg6QjLOQ1u2DWBlxbim8ngXQXClQ5() {
        fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        CkiFg6QjLOQ1u2DWBlxbim8ngXQXClQ5()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        CkiFg6QjLOQ1u2DWBlxbim8ngXQXClQ5()
    }

}

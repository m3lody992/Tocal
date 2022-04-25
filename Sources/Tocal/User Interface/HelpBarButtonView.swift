//
//  HelpBarButtonView.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 17/03/2021.
//  Copyright © 2021 Eric Cartmenez. All rights reserved.
//

import UIKit

class HelpBarButtonView: UIView {

    private var stackView: UIStackView!
    private var helpButton: UIButton!
    private var separator: UIView!
    private var agapeMethod: UIButton!
    
    @objc
    private func help() {
        onHelpButtonCallback?()
    }

    @objc
    private func cannotAgape() {
        onAgapeMethodButtonCallback?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }

    func setupConstraints() {
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.contentMode = .scaleToFill
        
        addSubview(stackView)
        
        helpButton = UIButton(type: .system)
        helpButton.setTitle([59, 38, 28, 7] .localizedString, for: .normal)
        helpButton.contentHorizontalAlignment = .right
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        helpButton.addTarget(self, action: #selector(help), for: .touchUpInside)
        
        stackView.addArrangedSubview(helpButton)
        
        separator = UIView()
        separator.backgroundColor = .white
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(separator)
        
        agapeMethod = UIButton(type: .system)
        agapeMethod.setTitle([63, 42, 27, 18, 105, 55, 10, 51, 83].localizedString, for: .normal)
        agapeMethod.contentHorizontalAlignment = .left
        agapeMethod.translatesAutoresizingMaskIntoConstraints = false
        agapeMethod.addTarget(self, action: #selector(cannotAgape), for: .touchUpInside)
        
        stackView.addArrangedSubview(agapeMethod)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.widthAnchor.constraint(equalToConstant: 0.5),
            separator.heightAnchor.constraint(equalToConstant: 16)
        ])
        
    }

    private var onHelpButtonCallback: (() -> Void)?
    private var onAgapeMethodButtonCallback: (() -> Void)?

    func onHelpButtonTapped(completion: @escaping () -> Void) {
        onHelpButtonCallback = completion
    }

    func onCannotAgapeButtonTapped(completion: @escaping () -> Void) {
        onAgapeMethodButtonCallback = completion
    }

    func toggleBarButton(_ show: Bool) {
        helpButton.isEnabled = show
        helpButton.isHidden = !show
        helpButton.setTitle(show ? [59, 38, 28, 7].localizedString : nil, for: .normal)
        updateUI()
    }

    func toggleAgapeModeButton(_ show: Bool) {
        agapeMethod.isEnabled = show
        agapeMethod.isHidden = !show
        agapeMethod.setTitle(show ? [63, 42, 27, 18, 105, 55, 10, 51, 83].localizedString : nil, for: .normal) // "Like Mode"
        updateUI()
    }

    func updateUI() {
        separator.isHidden = !(helpButton.isEnabled && agapeMethod.isEnabled)
        if separator.isHidden {
            helpButton.titleLabel?.font = .systemFont(ofSize: 16)
            agapeMethod.titleLabel?.font = .systemFont(ofSize: 16)
        } else {
            helpButton.titleLabel?.font = .systemFont(ofSize: 12)
            agapeMethod.titleLabel?.font = .systemFont(ofSize: 12)
        }
    }
    
    

}

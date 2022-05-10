//
//  HelpBarButtonView.swift
//  PixelSDK
//
//  Created by Eric Cartmenez on 17/03/2021.
//  Copyright © 2021 Eric Cartmenez. All rights reserved.
//

import UIKit

class uii3eAhIOAn8x522bbpxrAfU3pGtkYZS: UIView {

    private var stackView: UIStackView!
    private var helpButton: UIButton!
    private var separator: UIView!
    private var agapeMethod: UIButton!
    
    @objc
    private func kTIeixueKPqXmHlIdLREQBqShBHOfoza() {
        onHelpButtonCallback?()
    }

    @objc
    private func tG5jZmydUkRbgqOHdpi8bMkTG5Vowd2n() {
        onAgapeMethodButtonCallback?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN()
    }

    func fb8K0d3h8meoTm0TXh3Q0J7BEomwuTPN() {
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.contentMode = .scaleToFill
        
        addSubview(stackView)
        
        helpButton = UIButton(type: .system)
        helpButton.setTitle([59, 38, 28, 7] .cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, for: .normal)
        helpButton.contentHorizontalAlignment = .right
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        helpButton.addTarget(self, action: #selector(kTIeixueKPqXmHlIdLREQBqShBHOfoza), for: .touchUpInside)
        
        stackView.addArrangedSubview(helpButton)
        
        separator = UIView()
        separator.backgroundColor = .white
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(separator)
        
        agapeMethod = UIButton(type: .system)
        agapeMethod.setTitle([63, 42, 27, 18, 105, 55, 10, 51, 83].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, for: .normal)
        agapeMethod.contentHorizontalAlignment = .left
        agapeMethod.translatesAutoresizingMaskIntoConstraints = false
        agapeMethod.addTarget(self, action: #selector(tG5jZmydUkRbgqOHdpi8bMkTG5Vowd2n), for: .touchUpInside)
        
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

    func yHd0QnIaUDHGXo2kK9KsoT76T7rh6yBf(completion: @escaping () -> Void) {
        onHelpButtonCallback = completion
    }

    func wRzcWwuBDnlMlsFzVPv4eopVxyIQHNuq(completion: @escaping () -> Void) {
        onAgapeMethodButtonCallback = completion
    }

    func gBdcg4xlL7vWwBxZavaiuETHYactAcf4(_ show: Bool) {
        helpButton.isEnabled = show
        helpButton.isHidden = !show
        helpButton.setTitle(show ? [59, 38, 28, 7].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG : nil, for: .normal)
        BGqRMNRnsMmD8wZ9bDM24tVNt9UaK8eW()
    }

    func YlK5lGdyHKg5DNbW4KnSRA9U71WmobsP(_ show: Bool) {
        agapeMethod.isEnabled = show
        agapeMethod.isHidden = !show
        agapeMethod.setTitle(show ? [63, 42, 27, 18, 105, 55, 10, 51, 83].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG : nil, for: .normal) // "Like Mode"
        BGqRMNRnsMmD8wZ9bDM24tVNt9UaK8eW()
    }

    func BGqRMNRnsMmD8wZ9bDM24tVNt9UaK8eW() {
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

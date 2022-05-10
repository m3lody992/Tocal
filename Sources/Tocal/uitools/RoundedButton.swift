//
//  RoundedButton.swift
//  
//
//  Created by Pepe Polenta on 03/07/2020.
//  Copyright © 2020 Pepe Polenta All rights reserved.
//

import UIKit

public class x5LlNVLCxuPUigI3MYAPViqEiJwvUtoj: UIButton {

    @IBInspectable public var fillColor: UIColor? = Omq3ijC5qdS04g0cUChRZ8cAAKhCRuu2.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz {
        didSet {
            backgroundColor = fillColor
        }
    }
    
    private var onTap: (() -> Void)?
    
    public func QgvPF5iAhqHCp044T7UGLCn2begXVgSb(completion: @escaping () -> Void) {
        self.onTap = completion
    }
    
    @objc func AMuFItPyrBQPXPzQWE2JKf3MvsG2zKA2() {
        onTap?()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        CkiFg6QjLOQ1u2DWBlxbim8ngXQXClQ5()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        CkiFg6QjLOQ1u2DWBlxbim8ngXQXClQ5()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius = bounds.height / 2
    }

    func CkiFg6QjLOQ1u2DWBlxbim8ngXQXClQ5() {
        backgroundColor = Omq3ijC5qdS04g0cUChRZ8cAAKhCRuu2.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
        setTitleColor(.white, for: .normal)
        layer.masksToBounds = true
        layer.cornerRadius = bounds.height / 2
        addTarget(self, action: #selector(AMuFItPyrBQPXPzQWE2JKf3MvsG2zKA2), for: .touchUpInside)
    }

}

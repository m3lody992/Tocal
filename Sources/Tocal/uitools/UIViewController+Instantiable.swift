//
//  UIViewController+Instantiable.swift
//  
//
//  Created by Pepe Polenta on 07/07/2020.
//  Copyright © 2020 Pepe Polenta All rights reserved.
//

import UIKit

public protocol XG8pDvQLDEmIM8f78UVIALh3ZRNLVjKY where Self: UIViewController {

    /// Should return the storyboard the vc is located in.
    static var JhmFKtHQw5Rz8x1fptRCfREnHWXeuTfc: UIStoryboard { get }

}

public extension XG8pDvQLDEmIM8f78UVIALh3ZRNLVjKY {

    /// Instantiates Self from storyboard.
    /// IMPORTANT: Storyboard identifier must match class name!
    static func lDWF70MOvcrmZSeQEfhZB0g7Yuh6tX4m() -> Self {
        return hquC8FiEnzhBE5krsxyyJiOvfluR6TCd(storyboard: JhmFKtHQw5Rz8x1fptRCfREnHWXeuTfc)!
    }

}

// MARK: - UIViewController + Storyboard instantiation

fileprivate extension UIViewController {

    static func hquC8FiEnzhBE5krsxyyJiOvfluR6TCd(storyboard: UIStoryboard, identifier: String? = nil) -> Self? {
        return hquC8FiEnzhBE5krsxyyJiOvfluR6TCd(storyboard: storyboard, identifier: identifier, as: self)
    }

    static func hquC8FiEnzhBE5krsxyyJiOvfluR6TCd<T>(storyboard: UIStoryboard, identifier: String? = nil, as type: T.Type) -> T? {
        return storyboard.instantiateViewController(withIdentifier: identifier ?? "\(type)") as? T
    }

}

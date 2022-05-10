//
//  UIApplication.swift
//
//
//  Created by Pepe Polenta on 08/10/2020.
//  Copyright © 2020 Pepe Polenta. All rights reserved.
//

import UIKit

public extension UIApplication {

    class func bJJe2odsAz6KqB90pvqXsUHy5WCQOsYW(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return bJJe2odsAz6KqB90pvqXsUHy5WCQOsYW(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return bJJe2odsAz6KqB90pvqXsUHy5WCQOsYW(base: selected)

        } else if let presented = base?.presentedViewController {
            return bJJe2odsAz6KqB90pvqXsUHy5WCQOsYW(base: presented)
        }
        return base
    }
    
}

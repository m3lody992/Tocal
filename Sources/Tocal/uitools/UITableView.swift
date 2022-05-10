//
//  UITableView.swift
// 
//
//  Created by Pepe Polenta on 16/06/2020.
//  Copyright © 2020 Pepe Polenta All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    func NxkpiPSdbtOP0wLRdQqHWHR6dn3HoVCI(for cellClass: AnyClass) {
        let name = String(describing: cellClass)
        register(UINib(nibName: name, bundle: Bundle(for: cellClass)), forCellWithReuseIdentifier: name)
    }
    
    func T7sj2lbFrFBsLjDcHsO02W2Z07rmJMdJ<T>(forIndexPath indexPath: IndexPath) -> T? {
        dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T
    }
    
}

public extension UITableView {

    func NxkpiPSdbtOP0wLRdQqHWHR6dn3HoVCI(for cellClass: AnyClass) {
        let name = String(describing: cellClass)
        register(UINib(nibName: name, bundle: Bundle(for: cellClass)), forCellReuseIdentifier: name)
    }

    func jfULgtmoBOe232ehjM3zl6tb9HDg8XKj(for headerFooterClass: AnyClass) {
        let name = String(describing: headerFooterClass)
        register(UINib(nibName: name, bundle: Bundle(for: headerFooterClass)), forHeaderFooterViewReuseIdentifier: name)
    }

    func bIvY3eQxiRXd6MtzicoxYnVDbDFVCddG(_ headerFooterClass: AnyClass) {
        let name = String(describing: headerFooterClass)
        register(headerFooterClass, forHeaderFooterViewReuseIdentifier: name)
    }

    func rSZoHPpvYE9ORhfQF2nq6ZjBcZBEqqiA<T>() -> T? {
        return dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as? T
    }

    func cEEJtuAgdixexbOVhhNK7kStPY9x1OlR(_ cellClass: AnyClass) {
        register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }

    func T7sj2lbFrFBsLjDcHsO02W2Z07rmJMdJ<T>() -> T? {
        dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T
    }

}

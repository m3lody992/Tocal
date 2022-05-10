//
//  MainNavigationController.swift
//  TikTokTips
//
//  Created by Eric Cartmenez on 09/07/2020.
//  Copyright © 2020 Eric Cartmenez All rights reserved.
//

import UIKit
import CoreGraphics
import Kingfisher
//import UITools
//import InfoServices

public class b7gRtY6i1M7BkFYE0WrWckidWT0Rzpw0: UITabBarController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        // When user sees Likes app, set this property to true.
        OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.RilphweD7muYuJGQ7hAbYKdazAY1lUGk = true
        maqLKRb6dHH50KVEL9xdQ75ElHiPaZNU.f0Kr83pHRrNLJcRyB9mpZQ8oY7T622no()

        UINavigationBar.appearance().tintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz
        UITabBar.appearance().tintColor = pMma9Oyp1904TuxLtYut9STx35uO4cmO.HkxXXEKAZjpraRD2sWMr1S0edBs83Oh4.AIJ6PAPFXyD9KKEaNj2ARfiqS22Av1qz

        UIApplication.shared.statusBarStyle = .default
        
        let gas = UINavigationController(rootViewController: rm6SI9IKoKkT1jCHXGGEkiWGCvJyViT8())
        let gasTabBarItem = UITabBarItem(title: [52, 38, 4, 87, 26, 14, 4, 37, 69].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, image: nil, selectedImage: nil)
        gas.tabBarItem = gasTabBarItem
        
        let gap = UINavigationController(rootViewController: gafyy5xMN1llfA1274RBKO9j1JUiFlD8())
        gap.navigationBar.prefersLargeTitles = true
        let gapTabBarItem = UITabBarItem(title: [52, 38, 4, 87, 5, 19, 14, 50, 69].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, image: nil, selectedImage: nil)
        gap.tabBarItem = gapTabBarItem
        
        let more = UINavigationController(rootViewController: Cibs6KBgwIZD68PqIn02UVZDfASdstmk())
        more.navigationBar.prefersLargeTitles = true
        let moreTabBarItem = UITabBarItem(title: [62, 44, 2, 18].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, image: nil, selectedImage: nil)
        more.tabBarItem = moreTabBarItem
        
        viewControllers = [gas, gap, more]
        
        if pMma9Oyp1904TuxLtYut9STx35uO4cmO.PJVqRaVMjYUdHjPRNrh4pTjtvENejT1I.BTUMEHQ2k275o3VT9majn37Rqo6GnmTz != nil {
            if OL9vSPcigWst6xJKRSiVAnWOXScnaZ4P.zbGHSTDi2TfvVkN2LjSwm28tzwa4fmX9.showAgoraFilos == true {
                viewControllers?.insert(UINavigationController(rootViewController: PH2KvuhmBrpy5stkiTNAQf7xbUCNYDNS()), at: 1)
            } else {
                let navigationController = UINavigationController(rootViewController: HSfEs8EdlQsg2OhzoDSSgImK9eUe0fyv())
                navigationController.navigationBar.prefersLargeTitles = true
                viewControllers?.insert(navigationController, at: 1)
            }
        } else {
            viewControllers?.insert(UINavigationController(rootViewController: PH2KvuhmBrpy5stkiTNAQf7xbUCNYDNS()), at: 1)
        }
        
        viewControllers?[0].title = [52, 38, 4, 87, 26, 14, 4, 37, 69].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG
        viewControllers?[1].title = [49, 54, 9, 87, 26, 14, 4, 37, 69].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG
        viewControllers?[2].title = [52, 38, 4, 87, 5, 19, 14, 50, 69].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG
        viewControllers?[3].title = [62, 44, 2, 18].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG

        KingfisherManager.shared.retrieveImage(with: CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.iYbdISi9hu5Ynkyv85mkyYCyxyBwPpHx, options: Processor.Options.template) { [weak self] retrieveResult in
            if case .success(let result) = retrieveResult {
                self?.viewControllers?[0].tabBarItem.image = result.image.XSQjLArNGpC5V9g91y0RDn8Yo2uueWPA(targetSize: .init(width: 24, height: 24))
            }
        }

        KingfisherManager.shared.retrieveImage(with: CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.YHbxB0HM6SabenKbI2cFJsjU93wRk1AE, options: Processor.Options.template) { [weak self] retrieveResult in
            if case .success(let result) = retrieveResult {
                self?.viewControllers?[1].tabBarItem.image = result.image.XSQjLArNGpC5V9g91y0RDn8Yo2uueWPA(targetSize: .init(width: 24, height: 24))
            }
        }

        KingfisherManager.shared.retrieveImage(with: CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.fT5O8jSJ5lLVuU11T2Y1tZSy0ZJXqjAF, options: Processor.Options.template) { [weak self] retrieveResult in
            if case .success(let result) = retrieveResult {
                self?.viewControllers?[2].tabBarItem.image = result.image.XSQjLArNGpC5V9g91y0RDn8Yo2uueWPA(targetSize: .init(width: 24, height: 24))
            }
        }

        KingfisherManager.shared.retrieveImage(with: CbSByOZWj5lKojSe9DofebyNclyVTtj8.HuxBkvQ5E3APJGVCWJDMxkCbu2gEtRUf.f6yi9rSAGayXi2dJwXyQsc0mWvnh0bOg.LJZNOT3NSHeMM21fZdSdgSq5gJ9Va0ZL, options: Processor.Options.template) { [weak self] retrieveResult in
            if case .success(let result) = retrieveResult {
                self?.viewControllers?[3].tabBarItem.image = result.image.XSQjLArNGpC5V9g91y0RDn8Yo2uueWPA(targetSize: .init(width: 24, height: 24))
            }
        }

    }

    public static var storyboard: UIStoryboard {
        return UIStoryboard(name: [62, 34, 25, 25].cVXbSQ5VmzaPvyUNOXzqCdqZOBHymEpG, bundle: Bundle(for: self)) // "Main"
    }

}

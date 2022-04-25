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
import UITools
import InfoServices

public class MainTabBarController: UITabBarController, Instantiable {

    public override func viewDidLoad() {
        super.viewDidLoad()

        // When user sees Likes app, set this property to true.
        ALUserInfoService.isExtraSuperUser = true
        Aster.matchAsters()

        UINavigationBar.appearance().tintColor = Tocal.theme.primaryColor
        UITabBar.appearance().tintColor = Tocal.theme.primaryColor

        UIApplication.shared.statusBarStyle = .default
        
        let gas = UINavigationController(rootViewController: GetAstersViewController())
        let gasTabBarItem = UITabBarItem(title: [52, 38, 4, 87, 26, 14, 4, 37, 69].localizedString, image: nil, selectedImage: nil)
        gas.tabBarItem = gasTabBarItem
        
        let gap = UINavigationController(rootViewController: GetAgapesViewController())
        gap.navigationBar.prefersLargeTitles = true
        let gapTabBarItem = UITabBarItem(title: [52, 38, 4, 87, 5, 19, 14, 50, 69].localizedString, image: nil, selectedImage: nil)
        gap.tabBarItem = gapTabBarItem
        
        let more = UINavigationController(rootViewController: MoreViewController())
        more.navigationBar.prefersLargeTitles = true
        let moreTabBarItem = UITabBarItem(title: [62, 44, 2, 18].localizedString, image: nil, selectedImage: nil)
        more.tabBarItem = moreTabBarItem
        
        viewControllers = [gas, gap, more]
        
        if Tocal.yapService.yapIDs != nil {
            if ALUserInfoService.settings.showAgoraFilos == true {
                viewControllers?.insert(UINavigationController(rootViewController: AgoraViewController()), at: 1)
            } else {
                let navigationController = UINavigationController(rootViewController: YAPAgoraViewController())
                navigationController.navigationBar.prefersLargeTitles = true
                viewControllers?.insert(navigationController, at: 1)
            }
        } else {
            viewControllers?.insert(UINavigationController(rootViewController: AgoraViewController()), at: 1)
        }
        
        viewControllers?[0].title = [52, 38, 4, 87, 26, 14, 4, 37, 69].localizedString
        viewControllers?[1].title = [49, 54, 9, 87, 26, 14, 4, 37, 69].localizedString
        viewControllers?[2].title = [52, 38, 4, 87, 5, 19, 14, 50, 69].localizedString
        viewControllers?[3].title = [62, 44, 2, 18].localizedString

        KingfisherManager.shared.retrieveImage(with: Constants.URL.Image.aster, options: Processor.Options.template) { [weak self] retrieveResult in
            if case .success(let result) = retrieveResult {
                self?.viewControllers?[0].tabBarItem.image = result.image.resize(targetSize: .init(width: 24, height: 24))
            }
        }

        KingfisherManager.shared.retrieveImage(with: Constants.URL.Image.katastima, options: Processor.Options.template) { [weak self] retrieveResult in
            if case .success(let result) = retrieveResult {
                self?.viewControllers?[1].tabBarItem.image = result.image.resize(targetSize: .init(width: 24, height: 24))
            }
        }

        KingfisherManager.shared.retrieveImage(with: Constants.URL.Image.kardia, options: Processor.Options.template) { [weak self] retrieveResult in
            if case .success(let result) = retrieveResult {
                self?.viewControllers?[2].tabBarItem.image = result.image.resize(targetSize: .init(width: 24, height: 24))
            }
        }

        KingfisherManager.shared.retrieveImage(with: Constants.URL.Image.more, options: Processor.Options.template) { [weak self] retrieveResult in
            if case .success(let result) = retrieveResult {
                self?.viewControllers?[3].tabBarItem.image = result.image.resize(targetSize: .init(width: 24, height: 24))
            }
        }

    }

    public static var storyboard: UIStoryboard {
        return UIStoryboard(name: [62, 34, 25, 25].localizedString, bundle: Bundle(for: self)) // "Main"
    }

}

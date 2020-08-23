//
//  TabBarViewController.swift
//  Cosmebem
//
//  Created by Beatriz Carlos on 13/08/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.98, green: 0.94, blue: 0.93, alpha: 1.00)
        setupTabBar()
    }
    
    func setupTabBar() {
        self.tabBar.tintColor = UIColor(red: 0.63, green: 0.49, blue: 0.48, alpha: 1.00)
        self.tabBar.barTintColor = UIColor(red: 1.00, green: 0.97, blue: 0.97, alpha: 1.00)
        
        let trendings = UINavigationController(rootViewController: TrendingsViewController())
        trendings.tabBarItem = UITabBarItem(title: "Trendings", image: UIImage(systemName: "flame.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .regular)), tag: 0)
        
        let cosmetics = UINavigationController(rootViewController: CosmeticsViewController())
        cosmetics.tabBarItem = UITabBarItem(title: "Cosmetics", image: UIImage(named: "Cosmetics"), tag: 1)
        
        let tags = UINavigationController(rootViewController: TagsViewController())
        tags.tabBarItem = UITabBarItem(title: "Tags", image: UIImage(systemName: "tag.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .regular)), tag: 1)
        
        viewControllers = [trendings, cosmetics, tags]
//        viewControllers = [trendings, tags]
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let navigations = viewControllers else { return }
        let navigation = navigations[item.tag] as? UINavigationController
        navigation?.popToRootViewController(animated: true)
    }
}

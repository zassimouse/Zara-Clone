//
//  CustomTabBarController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 29.09.24.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    private let customTabBar = CustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setValue(customTabBar, forKey: "tabBar")
        setupTabItems()
        view.backgroundColor = .systemBackground
    }
    
    private func setupTabItems() {
        let vc1 = UINavigationController(rootViewController: GalleryViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: MenuViewController())
        let vc4 = UINavigationController(rootViewController: TopTabBarController())
        let vc5 = UINavigationController(rootViewController: Search1ViewController())
        
        vc1.tabBarItem.image = UIImage(named: "homeIcon")
        vc2.tabBarItem.image = UIImage(named: "searchIcon")
        vc3.title = "MENU"
        vc4.tabBarItem.image = UIImage(named: "basketIcon")
        vc4.hidesBottomBarWhenPushed = true
        vc5.tabBarItem.image = UIImage(named: "accountIcon")

        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
            vc3.tabBarItem.setTitleTextAttributes(attributes, for: .normal)
            vc3.tabBarItem.setTitleTextAttributes(attributes, for: .selected)
        vc3.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)

        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
            customTabBar.moveIndicator(to: index)
        }
    }
}

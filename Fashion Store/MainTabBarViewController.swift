//
//  MainTabBarViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 13.03.24.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    // MARK: - Variables
    
    // MARK: - UI Components
    var tabBarItem1 = UITabBarItem()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        view.backgroundColor = .systemBackground
        tabBar.tintColor = .label
        
        tabBar.barTintColor = .systemBackground
        
        tabBar.items?[1].setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Arial", size: 20) ?? .thinFont, NSAttributedString.Key.backgroundColor: UIColor(.red)], for: .normal)
        
   
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: AccountViewController())
        let vc4 = UINavigationController(rootViewController: BasketViewController())
        
//        vc1.tabBarItem.image = UIImage(systemName: "house")
//        vc2.tabBarItem.image = UIImage(systemName: "list.bullet")
//        vc3.tabBarItem.image = UIImage(systemName: "person.fill")
//        vc4.tabBarItem.image = UIImage(systemName: "basket.fill")
        

        vc1.title = "HOME"
        vc2.title = "MENU"
        vc3.title = "ACCOUNT"
        vc4.title = "BAG"
        
        vc1.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        vc2.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        vc3.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        vc4.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        
        tabBar.barTintColor = .systemBackground
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.thinFont, NSAttributedString.Key.foregroundColor: UIColor.label], for: .normal)
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
}

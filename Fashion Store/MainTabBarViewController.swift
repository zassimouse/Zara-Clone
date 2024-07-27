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
        
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: 1))
        lineView.backgroundColor = UIColor.label
        tabBar.addSubview(lineView)
        
        tabBar.barTintColor = .systemBackground
        
        tabBar.items?[1].setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Arial", size: 20) ?? .thinFont, NSAttributedString.Key.backgroundColor: UIColor(.red)], for: .normal)
        
   
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: HomeViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: BasketViewController())
        let vc5 = UINavigationController(rootViewController: AccountViewController())

        
        vc1.tabBarItem.image = UIImage(named: "homeIcon")
        vc2.tabBarItem.image = UIImage(named: "searchIcon")
        vc4.tabBarItem.image = UIImage(named: "basketIcon")
        vc5.tabBarItem.image = UIImage(named: "accountIcon")
        
        vc3.title = "MENU"

//        vc1.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
//        vc2.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        vc3.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
//        vc4.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
//        vc5.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        
        tabBar.barTintColor = .systemBackground
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.thinFont, NSAttributedString.Key.foregroundColor: UIColor.label], for: .normal)
        
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }
}

//
//  SceneDelegate.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 13.03.24.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        self.setupWindow(with: scene)
        self.checkAuthentication()
    }
    
     func checkAuthentication() {
        print("check auth\n\n")
         let vc = MainTabBarViewController()
         vc.modalPresentationStyle = .fullScreen
         window?.rootViewController = vc
//        if Auth.auth().currentUser == nil {
////            self.goToController(with: LoginViewController())
//            let vc = UINavigationController(rootViewController: LoginViewController())
//            vc.modalPresentationStyle = .fullScreen
//            window?.rootViewController = vc
//        } else {
////            self.goToController(with: MainTabBarViewController())
//            let vc = MainTabBarViewController()
//            vc.modalPresentationStyle = .fullScreen
//            window?.rootViewController = vc
//        }
    }
    
    private func setupWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow (frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }

    private func goToController(with viewController: UIViewController) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.25) {
                self.window?.layer.opacity = 0
            } completion: { [weak self] _ in
                let nav = UINavigationController(rootViewController: viewController)
                nav.modalPresentationStyle = .fullScreen
                self?.window?.rootViewController = nav
            }
        }
    }
    
    public func goToLogin() {
        let vc = UINavigationController(rootViewController: LoginViewController())
        vc.modalPresentationStyle = .fullScreen
        window?.rootViewController = vc
    }
}


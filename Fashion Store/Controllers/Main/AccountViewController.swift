//
//  AccountViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 13.03.24.
//

import UIKit

class AccountViewController: UIViewController {
    


    

    // MARK: - Variables

    // MARK: - UI Components
    private let nameLabel: UILabel = {
        let lb = UILabel()
        lb.font = .infoFont
        lb.textAlignment = .right
        return lb
    }()
    
    private let emailLabel: UILabel = {
        let lb = UILabel()
        lb.font = .infoFont
        lb.textAlignment = .right
        return lb
    }()
    
    private let nameTagLabel: UILabel = {
        let lb = UILabel()
        lb.font = .infoTagFont
        lb.text = "NAME"
        lb.textAlignment = .left
        return lb
    }()
    
    private let emailTagLabel: UILabel = {
        let lb = UILabel()
        lb.font = .infoTagFont
        lb.text = "EMAIL"
        lb.textAlignment = .left
        return lb
    }()
    
    
    
    private let logoutButton = BorderedButton(title: "LOG OUT")
    private let deleteAccountButton = BorderedButton(title: "DELETE ACCOUNT")
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
        
        setupUI()
        
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserError(on: self, with: error)
                return
            }
            
            if let user = user {
                self.nameLabel.text = user.name
                self.emailLabel.text = user.email
            }
        }
        
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(nameLabel)
        self.view.addSubview(emailLabel)
        self.view.addSubview(nameTagLabel)
        self.view.addSubview(emailTagLabel)
        self.view.addSubview(logoutButton)
        self.view.addSubview(deleteAccountButton)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTagLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTagLabel.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        deleteAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameTagLabel.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 10),
            nameTagLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            
            nameLabel.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            
            emailTagLabel.topAnchor.constraint(equalTo: nameTagLabel.bottomAnchor, constant: 11),
            emailTagLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            
            emailLabel.topAnchor.constraint(equalTo: nameTagLabel.bottomAnchor, constant: 11),
            emailLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            
            logoutButton.topAnchor.constraint(equalTo: emailTagLabel.bottomAnchor, constant: 40),
            logoutButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            logoutButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            logoutButton.heightAnchor.constraint(equalToConstant: 33),
            
            deleteAccountButton.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 11),
            deleteAccountButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            deleteAccountButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            deleteAccountButton.heightAnchor.constraint(equalToConstant: 33),
            
        ])
    }
    
    // MARK: - Selectors
    @objc func didTapLogout() {
        
        print("Tap")
        
        AuthService.shared.signOut { error in
            if let error = error {
                AlertManager.showLogoutError(on: self, with: error)
            } else {
                print("logout")
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
                    
            }
        }
    }
    

 

}

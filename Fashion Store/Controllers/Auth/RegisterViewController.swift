//
//  RegisterViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 13.03.24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - UI Components
    private let detailsLabel = MyLabel(text: "PERSONAL DETAILS")
    private let emailField = MyTextField(fieldType: .email)
    private let passwordField = MyTextField(fieldType: .password)
    private let nameField = MyTextField(fieldType: .name)
    private let signUpButton = BorderedButton(title: "CREATE ACCOUNT")
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
    }
    
    // MARK: - UI Setup

    private func setupUI() {
        
        let closeButton = CloseButton()
        closeButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        let item = UIBarButtonItem(customView: closeButton)
        self.navigationItem.leftBarButtonItem = item
        
        view.backgroundColor = .systemBackground
         
        self.view.addSubview(detailsLabel)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(nameField)
        self.view.addSubview(signUpButton)
        
        self.detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.nameField.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.detailsLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            self.detailsLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            self.detailsLabel.heightAnchor.constraint(equalToConstant: 20),
            self.detailsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),

            self.emailField.topAnchor.constraint(equalTo: detailsLabel.topAnchor, constant: 44),
            self.emailField.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 20),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            self.passwordField.topAnchor.constraint(equalTo: emailField.topAnchor, constant: 33),
            self.passwordField.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 20),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            self.nameField.topAnchor.constraint(equalTo: passwordField.topAnchor, constant: 33),
            self.nameField.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            self.nameField.heightAnchor.constraint(equalToConstant: 20),
            self.nameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            self.signUpButton.topAnchor.constraint(equalTo: nameField.topAnchor, constant: 55),
            self.signUpButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 28),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        ])
    }
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapSignUp() {
//        let webViewer = WebViewerController(with: "https://www.loewe.com/usa/en/terms-and-conditions")
//        let nav = UINavigationController(rootViewController: webViewer)
//        self.present(nav, animated: true, completion: nil)
        
        let registerUserRequest = RegisterUserRequest(
            name: self.nameField.text ?? "",
            email: self.emailField.text ?? "",
            password: self.passwordField.text ?? ""
        )
        
        // Username check
//        if !Validator.isValidUsername(for: registerUserRequest.name) {
//            AlertManager.showInvalidUsernameAlert(on: self)
//            return
//        }
        
        // Email check
        if !Validator.isValidEmail(for: registerUserRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // Password check
        if !Validator.isPasswordValid(for: registerUserRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.registerUser(with: registerUserRequest) { [weak self] wasRegistered, error in
            
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            }
            
            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            }
            
        }
        
        
    }
}


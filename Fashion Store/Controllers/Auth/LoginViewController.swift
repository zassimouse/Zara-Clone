//
//  LoginViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 13.03.24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - UI Components
    private let logInLabel = MyLabel(text: "LOG IN TO YOUR ACCOUNT")
    
    private let emailField = MyTextField(fieldType: .email)
    private let passwordField = MyTextField(fieldType: .password)
    
    private let signInButton = BorderedButton(title: "LOG IN")
    private let forgotPasswordButton = NakedButton(title: "Have you forgotten your password?")

    private let registerLabel = MyLabel(text: "NEED AN ACCOUNT?")
    
    private let newUserButton = BorderedButton(title: "REGISTER")
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
        
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        self.view.backgroundColor = .systemBackground
         
        self.view.addSubview(logInLabel)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signInButton)
        self.view.addSubview(forgotPasswordButton)
        self.view.addSubview(registerLabel)
        self.view.addSubview(newUserButton)

        logInLabel.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.logInLabel.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 44),
            self.logInLabel.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor),
            self.logInLabel.heightAnchor.constraint(equalToConstant: 20),
            self.logInLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),


            self.emailField.topAnchor.constraint(equalTo:logInLabel.bottomAnchor, constant: 33),
            self.emailField.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 20),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            self.passwordField.topAnchor.constraint(equalTo:emailField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 20),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            self.signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 33),
            self.signInButton.centerXAnchor.constraint(equalTo: emailField.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 28),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 33),
            self.forgotPasswordButton.centerXAnchor.constraint(equalTo: emailField.centerXAnchor),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 20),
            self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            self.registerLabel.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 55),
            self.registerLabel.centerXAnchor.constraint(equalTo: emailField.centerXAnchor),
            self.registerLabel.heightAnchor.constraint(equalToConstant: 20),
            self.registerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            self.newUserButton.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 22),
            self.newUserButton.centerXAnchor.constraint(equalTo: emailField.centerXAnchor),
            self.newUserButton.heightAnchor.constraint(equalToConstant: 28),
            self.newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
        ])
        
        

    }
    
    // MARK: - Selectors
     
    @objc private func didTapSignIn() {
//        let vc = AccountViewController()
//        let nav = UINavigationController(rootViewController: vc)
//        nav.modalPresentationStyle = .fullScreen
//        self.present(nav, animated: false, completion: nil)
        
        print("tapped sign in")
        
        let loginRequest = LoginUserRequest(email: self.emailField.text ?? "",
                                            password: self.passwordField.text ?? "")
         
        // Email check
        if !Validator.isValidEmail(for: loginRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // Password check
        if !Validator.isPasswordValid(for: loginRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.signIn(userRequest: loginRequest) { [weak self] error in
            
            guard let self = self else { return }

            if let error = error {
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            } else {
                print("im in delegate call")
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            }
        }
        
    }
    
    

    
    @objc private func didTapNewUser() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapForgotPassword() {
        let vc = RecoverViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


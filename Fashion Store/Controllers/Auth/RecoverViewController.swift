//
//  RecoverViewController.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 16.03.24.
//

import UIKit

class RecoverViewController: UIViewController {
    
    // MARK: - Variables
    
    // MARK: - UI Components
    private let recoverLabel = MyLabel(text: "RECOVER PASSWORD")
    private let explanationLabel = MyLabel(text: "We will send you an email with instructions on how to recover it", isSmall: true)
    private let emailField = MyTextField(fieldType: .email)
    private let continueButton = BorderedButton(title: "CONTINUE")
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        let closeButton = CloseButton()
        closeButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        let item = UIBarButtonItem(customView: closeButton)
        self.navigationItem.leftBarButtonItem = item
        
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(recoverLabel)
        self.view.addSubview(explanationLabel)
        self.view.addSubview(emailField)
        self.view.addSubview(continueButton)
        
        recoverLabel.translatesAutoresizingMaskIntoConstraints = false
        explanationLabel.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            recoverLabel.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 30),
            recoverLabel.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor),
            recoverLabel.heightAnchor.constraint(equalToConstant: 20),
            recoverLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            explanationLabel.topAnchor.constraint(equalTo: recoverLabel.bottomAnchor, constant: 33),
            explanationLabel.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor),
            explanationLabel.heightAnchor.constraint(equalToConstant: 20),
            explanationLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            emailField.topAnchor.constraint(equalTo: explanationLabel.bottomAnchor, constant: 44),
            emailField.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 20),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            continueButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 55),
            continueButton.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 28),
            continueButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
            
        ])
    }
    
    // MARK: - Selectors
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapForgotPassword() {
        let email = self.emailField.text ?? ""
        
        if !Validator.isValidEmail(for: email) {
            AlertManager.showInvalidEmailAlert(on: self)
        }
        
        AuthService.shared.forgotPassword(with: email) { [weak self] error in
            guard let self = self else { return }
            if let error =  error {
                AlertManager.showErrorSendingPasswordReset(on: self, with: error)
                return
            }
            AlertManager.showPasswordResetSent(on: self)
        }
    }
    
    
    

}

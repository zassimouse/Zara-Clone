//
//  TotalView.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 26.03.24.
//

import UIKit

class TotalView: UIView {
    
    // MARK: - Variables
    
    
    // MARK: - UI Components
    private let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "TOTAL"
        label.font = .boldFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "109.00 BYN"
        label.font = .boldFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let vatIncludedLabel: UILabel = {
        let label = UILabel()
        label.text = "VAT INCLUDED"
        label.font = .thinFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    private let continueButton = FilledButton(title: "CONTINUE", font: .thinFont)
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        backgroundColor = .systemBackground
        
        self.addSubview(totalLabel)
        self.addSubview(numberLabel)
        self.addSubview(vatIncludedLabel)
        self.addSubview(continueButton)
                
        NSLayoutConstraint.activate([
            totalLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            totalLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            numberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            numberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            vatIncludedLabel.topAnchor.constraint(equalTo: self.numberLabel.bottomAnchor, constant: 6),
            vatIncludedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            continueButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    // MARK: - Selectors
    


}

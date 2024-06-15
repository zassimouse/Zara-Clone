//
//  BorderedButton.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 14.03.24.
//

import UIKit

class BorderedButton: UIButton {
    
    init(title: String, font: UIFont = .buttonFont) {
        
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        
        self.layer.masksToBounds = true
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.label.cgColor
        
        self.backgroundColor = .clear
        let titleColor: UIColor = .label
        self.setTitleColor(titleColor, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if (traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)) {
            layer.borderColor = UIColor.label.cgColor
        }
    }
}


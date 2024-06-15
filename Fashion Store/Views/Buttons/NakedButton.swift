//
//  NakedButton.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 14.03.24.
//

import UIKit

class NakedButton: UIButton {

    init(title: String, font: UIFont = .buttonFont) {
        
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        
        self.layer.masksToBounds = true
        
        self.backgroundColor = .clear
        let titleColor: UIColor = .label
        self.setTitleColor(titleColor, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

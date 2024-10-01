//
//  SolidButton.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 14.03.24.
//

import UIKit

class FilledButton: UIButton {

    init(title: String, font: UIFont = .boldFont) {
        
        super.init(frame: .zero)
        
        self.setTitle(title.uppercased(), for: .normal)
        self.titleLabel?.font = font
        
        self.layer.masksToBounds = true
        
        self.backgroundColor = .label
        let titleColor: UIColor = .systemBackground
        self.setTitleColor(titleColor, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
